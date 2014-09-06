namespace SpotifyPlaces.Web.Controllers
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Net;
    using System.Text;
    using System.Threading.Tasks;
    using System.Web;
    using System.Web.Http;

    using MongoDB.Driver;
    using MongoDB.Driver.Builders;

    using Newtonsoft.Json;

    using NReco.CF.Taste.Model;

    using PusherServer;

    using SpotifyPlaces.Web.Dto;

    public class PlaceController : ApiController
    {
        private static IDataModel dataModel;

        public async Task<PlaceDto> Get(string id)
        {
            var dto = new PlaceDto();

            // Get place by id
            var googlePlaceDto = await this.GetPlaceDetailsFromGoogle(id);
            if (googlePlaceDto == null) throw new HttpException(404, "Unknown place, check id.");

            dto.Id = googlePlaceDto.Result.PlaceId;
            dto.Name = googlePlaceDto.Result.Name;

            // Get tracks of people at the place
            var connectionString = "mongodb://spotifyplaces:jAwrwkIRI2cV0LMRj2E6A9O4oNPqL.kfZnS.cC9q.MA-@ds045077.mongolab.com:45077/spotifyplaces";
            var database = MongoDatabase.Create(connectionString);
            var places = database.GetCollection<PlaceMongoDbDto>("places");

            var placeDto = places.FindOne(Query<PlaceMongoDbDto>.EQ(x => x.Id, id));
            if (placeDto != null)
            {
                dto.People = placeDto.People;
                dto.Playlist = new PlaylistDto();
                dto.Playlist.Items = placeDto.Playlist.Select(
                    x => new PlaylistItemDto
                             {
                                 Title = x.Title,
                                 CoverUrl = x.CoverUrl,
                                 SpotifyId = x.SpotifyId,
                                 Artist = x.Artist
                             });
            }

            return dto;
        }

        public async void Post(string id, string userId)
        {
            var connectionString = "mongodb://spotifyplaces:jAwrwkIRI2cV0LMRj2E6A9O4oNPqL.kfZnS.cC9q.MA-@ds045077.mongolab.com:45077/spotifyplaces";
            var database = MongoDatabase.Create(connectionString);
            var places = database.GetCollection<PlaceMongoDbDto>("places");

            var placeDto = places.FindOne(Query<PlaceMongoDbDto>.EQ(x => x.Id, id));
            if (placeDto == null)
            {
                var googlePlaceDto = await this.GetPlaceDetailsFromGoogle(id);
                placeDto = new PlaceMongoDbDto();
                placeDto.Id = googlePlaceDto.Result.PlaceId;
                placeDto.Name = googlePlaceDto.Result.Name;
                placeDto.People = new string[] { };
            }
            
            var people = new List<string>(placeDto.People);
            if (people.All(x => x != userId))
            {
                people.Add(userId);
                placeDto.People = people.ToArray();

                var playlist = this.GetPlaylist(people);
                var playlistDtos = playlist.Items.Select(
                    x => new PlaylistItemMongoDbDto
                        {
                            SpotifyId = x.SpotifyId,
                            Title = x.Title,
                            Artist = x.Artist,
                            CoverUrl = x.CoverUrl
                        });
                placeDto.Playlist = playlistDtos.ToArray();

                places.Save(placeDto);
            }

            this.NotifyClients(id);
        }

        private async Task<GooglePlaceDetailsResponseDto> GetPlaceDetailsFromGoogle(string id)
        {
            var format = "https://maps.googleapis.com/maps/api/place/details/json?placeid={0}&key=AIzaSyAt7b1MORyXmR9-RG8c927C-BW1sach8lM";
            var url = string.Format(format, id);

            var client = new WebClient();
            var json = client.DownloadString(url);

            var dto = JsonConvert.DeserializeObject<GooglePlaceDetailsResponseDto>(json);

            return dto;
        }

        private IEnumerable<TrackMongoDbDto> GetUserTracks(string userId)
        {
            var connectionString = "mongodb://spotifyplaces:jAwrwkIRI2cV0LMRj2E6A9O4oNPqL.kfZnS.cC9q.MA-@ds045077.mongolab.com:45077/spotifyplaces";
            var database = MongoDatabase.Create(connectionString);
            var users = database.GetCollection<UserMongoDbDto>("users");

            var userDto = users.FindOne(Query<UserMongoDbDto>.EQ(x => x.Id, userId));
            var token = userDto.AccessToken;

            var userPlaylistsUrl = string.Format("https://api.spotify.com/v1/users/{0}/playlists", userDto.Name);
            var client = new WebClient();
            client.Headers.Add("Authorization", "Bearer " + token);
            client.Headers.Add("Content-Type", "application/json");
            client.Encoding = Encoding.UTF8;
            var json = client.DownloadString(userPlaylistsUrl);
            var playlists = JsonConvert.DeserializeObject<SpotifyUserPlaylistsDto>(json);

            var playlist = playlists
                .Items
                .Where(x => x.Public)
                .OrderByDescending(x => x.Tracks.Total)
                .FirstOrDefault();

            if (playlist == null) return null;
            var tracksRequestUrl = playlist.Tracks.Href;

            json = client.DownloadString(tracksRequestUrl);
            var spotifyUserTracks = JsonConvert.DeserializeObject<SpotifyUserTracksDto>(json);

            var userTracks = spotifyUserTracks.Items.Select(
                x =>
                    {
                        var artist = x.Track.Artists != null ? x.Track.Artists.FirstOrDefault() : null;

                        var track = new TrackMongoDbDto();
                        track.Id = x.Track.Id;
                        track.Title = x.Track.Name;
                        track.Artist = artist != null ? artist.Name : "Artist";
                        var image = x.Track.Album.Images.OrderByDescending(i => i.Height).FirstOrDefault();
                        if (image != null) track.CoverUrl = image.Url;
                        return track;
                    });

            return userTracks;
        }

        private PlaylistDto GetPlaylist(IEnumerable<string> people)
        {
            var connectionString = "mongodb://spotifyplaces:jAwrwkIRI2cV0LMRj2E6A9O4oNPqL.kfZnS.cC9q.MA-@ds045077.mongolab.com:45077/spotifyplaces";
            var database = MongoDatabase.Create(connectionString);
            var users = database.GetCollection<UserMongoDbDto>("users");

            var userDtos = users.Find(Query<UserMongoDbDto>.In(x => x.Id, people));

            var allTracks = new List<TrackMongoDbDto>();
            foreach (var dto in userDtos)
            {
                var tracks = this.GetUserTracks(dto.Id);
                allTracks.AddRange(tracks);
            }

            var playlist = new PlaylistDto();
            var items = new List<PlaylistItemDto>();

            var queues = allTracks
                .GroupBy(x => x.Id)
                .OrderByDescending(x => x.Count())
                .Select(x => new Queue<TrackMongoDbDto>(x.Select(i => i)));

            foreach (var queue in queues)
            {
                var track = queue.Dequeue();
                items.Add(new PlaylistItemDto { Artist = track.Artist, Title = track.Title, CoverUrl = track.CoverUrl });
            }

            playlist.Items = items;

            return playlist;
        }

        private void NotifyClients(string placeId)
        {
            string appId = "88547";
            string key = "f2bc46ec213ef28ec2cb";
            string secret = "825e2533df0536649bba";

            var pusher = new Pusher(appId, key, secret);
            var result = pusher.Trigger("place-" + placeId, "checkin", new { });
        }
    }
}