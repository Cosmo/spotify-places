namespace SpotifyPlaces.Web.Controllers
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Net;
    using System.Threading.Tasks;
    using System.Web;
    using System.Web.Http;

    using MongoDB.Driver;
    using MongoDB.Driver.Builders;

    using Newtonsoft.Json;

    using NReco.CF.Taste.Impl.Common;
    using NReco.CF.Taste.Impl.Model;
    using NReco.CF.Taste.Impl.Recommender;
    using NReco.CF.Taste.Model;

    using SpotifyPlaces.Web.Dto;

    using WebGrease.Css.Extensions;

    public class PlacesController : ApiController
    {
        private static IDataModel dataModel;

        public async Task<IEnumerable<PlaceDto>> Get(string lat, string lng, string userId)
        {
            var places = await this.GetPlacesFromGoogle(lat, lng);

            var dtos = places.Items.Select(
                x => new PlaceDto()
                         {
                             Id = x.PlaceId, 
                             Name = x.Name, 
                             Latitude = x.Geometry.Location.Latitude,
                             Longitude = x.Geometry.Location.Longitude,
                             PlacesEnabled = (x.PlaceId == "ChIJ912QKthRqEcRyLhGUbyMjew" || x.PlaceId == "ChIJ_wf109ZRqEcRf5DCnPMFrc4" || x.PlaceId == "ChIJMRYLTixQqEcRsCbROOBvqUI")
                         });

            return dtos;
        }

        private async Task<GooglePlacesResponseDto> GetPlacesFromGoogle(string lat, string lng)
        {
            var format = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location={0},{1}&radius=1000&types=bar&key=AIzaSyAt7b1MORyXmR9-RG8c927C-BW1sach8lM";
            var url = string.Format(format, lat, lng);

            var client = new WebClient();
            var json = client.DownloadString(url);

            var dto = JsonConvert.DeserializeObject<GooglePlacesResponseDto>(json);

            return dto;
        }

        public async Task<GooglePlaceDetailsResponseDto> GetPlaceDetailsFromGoogle(string id)
        {
            var format = "https://maps.googleapis.com/maps/api/place/details/json?placeid={0}&key=AIzaSyAt7b1MORyXmR9-RG8c927C-BW1sach8lM";
            var url = string.Format(format, id);

            var client = new WebClient();
            var json = client.DownloadString(url);

            var dto = JsonConvert.DeserializeObject<GooglePlaceDetailsResponseDto>(json);

            return dto;
        }

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
            }

            return dto;

            // Get recommendations
            //if (dataModel == null)
            //{
            //    var donniePrefs = new List<IPreference>();
            //    donniePrefs.Add(new BooleanPreference(1, 1));
            //    donniePrefs.Add(new BooleanPreference(1, 2));
            //    donniePrefs.Add(new BooleanPreference(1, 4));
            //    donniePrefs.Add(new BooleanPreference(1, 9));
            //    var donnieUserPrefs = new BooleanUserPreferenceArray(donniePrefs);

            //    var cosmoPrefs = new List<IPreference>();
            //    cosmoPrefs.Add(new BooleanPreference(2, 11));
            //    cosmoPrefs.Add(new BooleanPreference(2, 14));
            //    cosmoPrefs.Add(new BooleanPreference(2, 17));
            //    cosmoPrefs.Add(new BooleanPreference(2, 19));
            //    cosmoPrefs.Add(new BooleanPreference(2, 21));
            //    cosmoPrefs.Add(new BooleanPreference(2, 24));
            //    cosmoPrefs.Add(new BooleanPreference(2, 27));
            //    cosmoPrefs.Add(new BooleanPreference(2, 29));
            //    var cosmoUserPrefs = new BooleanUserPreferenceArray(cosmoPrefs);

            //    var olcayPrefs = new List<IPreference>();
            //    olcayPrefs.Add(new BooleanPreference(2, 31));
            //    olcayPrefs.Add(new BooleanPreference(2, 34));
            //    olcayPrefs.Add(new BooleanPreference(2, 35));
            //    olcayPrefs.Add(new BooleanPreference(2, 36));
            //    olcayPrefs.Add(new BooleanPreference(2, 47));
            //    olcayPrefs.Add(new BooleanPreference(2, 48));
            //    olcayPrefs.Add(new BooleanPreference(2, 49));
            //    olcayPrefs.Add(new BooleanPreference(2, 42));
            //    olcayPrefs.Add(new BooleanPreference(2, 44));
            //    olcayPrefs.Add(new BooleanPreference(2, 43));
            //    var olcayUserPrefs = new BooleanUserPreferenceArray(olcayPrefs);

            //    var placePrefs = new List<IPreference>();
            //    placePrefs.Add(new BooleanPreference(0, 1));
            //    placePrefs.Add(new BooleanPreference(0, 11));
            //    placePrefs.Add(new BooleanPreference(0, 31));
            //    var placeUserPrefs = new BooleanUserPreferenceArray(placePrefs);

            //    var data = new FastByIDMap<IPreferenceArray>();
            //    data.Put(1, donnieUserPrefs);
            //    data.Put(2, cosmoUserPrefs);
            //    data.Put(3, olcayUserPrefs);

            //    data.Put(0, placeUserPrefs);

            //    dataModel = new GenericDataModel(data);
            //}

            //    var recommender = new ItemAverageRecommender(dataModel);
            //    var recommendations = recommender.Recommend(0, 10);
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
            people.Add(userId);
            placeDto.People = people.ToArray();

            places.Save(placeDto);
        }
    }
}
