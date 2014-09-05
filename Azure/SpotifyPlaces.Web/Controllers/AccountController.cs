namespace SpotifyPlaces.Web.Controllers
{
    using System;
    using System.Collections.Generic;
    using System.Net;
    using System.Net.Http;
    using System.Net.Http.Headers;
    using System.Text;
    using System.Web.Mvc;

    using MongoDB.Driver;

    using Newtonsoft.Json;

    using SpotifyPlaces.Web.Dto;

    public class AccountController : Controller
    {
        #region Fields

        private string CLIENT_ID = "fe1be8418a89472fbb775a1feed4c4cc";

        private string CLIENT_SECRET = "e6044981fa9a48479792fc8a221abbe9";

        private string CLIENT_CALLBACK_URL = "spotify-places://callback";

        private Uri SPOTIFY_ACCOUNTS_ENDPOINT = new Uri("https://accounts.spotify.com");

        private Uri SPOTIFY_API_ENDPOINT = new Uri("https://api.spotify.com");

        #endregion

        [HttpPost]
        public ActionResult Swap(string code)
        {
            // This call takes a single POST parameter, "code", which
            // it combines with your client ID, secret and callback
            // URL to get an OAuth token from the Spotify Auth Service,
            // which it will pass back to the caller in a JSON payload.

            var connectionString = "mongodb://spotifyplaces:jAwrwkIRI2cV0LMRj2E6A9O4oNPqL.kfZnS.cC9q.MA-@ds045077.mongolab.com:45077/spotifyplaces";
            var database = MongoDatabase.Create(connectionString);
            var users = database.GetCollection<UserMongoDbDto>("users");

            var parameters = new Dictionary<string, string>();
            parameters.Add("grant_type", "authorization_code");
            parameters.Add("redirect_uri", CLIENT_CALLBACK_URL);
            parameters.Add("code", code);
            parameters.Add("client_id", CLIENT_ID);
            parameters.Add("client_secret", CLIENT_SECRET);

            var client = new HttpClient();
            var base64Auth = Convert.ToBase64String(Encoding.UTF8.GetBytes(CLIENT_ID + ":" + CLIENT_SECRET));
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Basic", base64Auth);
            client.BaseAddress = this.SPOTIFY_ACCOUNTS_ENDPOINT;
            var content = new FormUrlEncodedContent(parameters);
            var result = client.PostAsync("/api/token", content).Result;
            var response = result.Content.ReadAsStringAsync().Result;

            var token_data = JsonConvert.DeserializeObject<Dictionary<string, string>>(response);

            var accessToken = token_data["access_token"];
            var refreshToken = token_data["refresh_token"];

            var user = this.GetSpotifyUser(accessToken);

            var userDto = new UserMongoDbDto();
            userDto.Id = user.Uri;
            userDto.Name = userDto.Id;
            userDto.AccessToken = accessToken;
            userDto.RefreshToken = refreshToken;
            users.Save(userDto);

            var contentResult = new ContentResult();
            contentResult.Content = response;

            return contentResult;
        }

        [HttpPost]
        public ActionResult Refresh(string id)
        {
            // Request a new access token using the POST:ed access token
            // by looking up the corresponding refresh token in the DB.

            var client = new WebClient();
            
            string AUTH_HEADER = "Basic " + Convert.ToBase64String(Encoding.UTF8.GetBytes(CLIENT_ID + ":" + CLIENT_SECRET));
            client.Headers.Add("Authorization", AUTH_HEADER);

            var parameters = new Dictionary<string, string>();
            parameters.Add("grant_type", "refresh_token");

            string refreshToken = ""; // TODO: Get refresh token from DB
            parameters.Add("refresh_token", refreshToken);

            var data = JsonConvert.SerializeObject(parameters);

            var response = client.UploadString(new Uri(SPOTIFY_ACCOUNTS_ENDPOINT, "/api/token"), data);

            var result = new ContentResult();
            result.Content = response;

            return result;
        }

        private SpotifyUserDto GetSpotifyUser(string accessToken)
        {
            var client = new WebClient();
            client.Headers.Add("Authorization", "Bearer " + accessToken);
            var json = client.DownloadString(new Uri(SPOTIFY_API_ENDPOINT, "/v1/me"));

            return JsonConvert.DeserializeObject<SpotifyUserDto>(json);
        } 
    }
}