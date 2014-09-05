namespace SpotifyPlaces.Web.Controllers
{
    using System.Net;
    using System.Web.Http;

    public class UserController : ApiController
    {
        private const string UserPlaylistsUrl = "https://api.spotify.com/v1/users/{0}/playlists";

        private const string UserTracksUrl = "https://api.spotify.com/v1/{0}/tracks";


        public void Post(string id, string token)
        {
            string auth = string.Format("Basic Barear ", token);
            string requestUrl = string.Format(UserTracksUrl, id);

            var client = new WebClient();
            client.Headers.Add("Authorization", auth);
            var json = client.DownloadString(requestUrl);

        }
    }
}