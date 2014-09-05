// --------------------------------------------------------------------------------------------------------------------
// <copyright file="AccountController.cs" company="">
//   
// </copyright>
// <summary>
//   Defines the AccountController type.
// </summary>
// --------------------------------------------------------------------------------------------------------------------

using System.Web.Mvc;

namespace SpotifyPlaces.Web.Controllers
{
    using System;
    using System.Collections.Generic;
    using System.Net;
    using System.Text;

    using Newtonsoft.Json;

    public class AccountController : Controller
    {
        private static IDictionary<string, string> RefreshTokens = new Dictionary<string, string>(); 

        private string CLIENT_ID = "e6695c6d22214e0f832006889566df9c";

        private string CLIENT_SECRET = "29eb02041ba646179a1189dccac112c7";

        private string CLIENT_CALLBACK_URL = "spotifyiossdkexample://";

        private Uri SPOTIFY_ACCOUNTS_ENDPOINT = new Uri("https://accounts.spotify.com");

        private Uri SPOTIFY_API_ENDPOINT = new Uri("https://api.spotify.com");

        [HttpPost]
        public ActionResult Swap(string code)
        {
            // This call takes a single POST parameter, "code", which
            // it combines with your client ID, secret and callback
            // URL to get an OAuth token from the Spotify Auth Service,
            // which it will pass back to the caller in a JSON payload.

            string auth_code = code;

            string AUTH_HEADER = "Basic " + Convert.ToBase64String(Encoding.UTF8.GetBytes(CLIENT_ID + ":" + CLIENT_SECRET));

            var client = new WebClient();

            var parameters = new Dictionary<string, string>();
            parameters.Add("grant_type", "authorization_code");
            parameters.Add("redirect_uri", CLIENT_CALLBACK_URL);
            parameters.Add("code", auth_code);

            var data = JsonConvert.SerializeObject(parameters);
            client.Headers.Add("Authorization", AUTH_HEADER);
            var response = client.UploadString(new Uri(this.SPOTIFY_ACCOUNTS_ENDPOINT, "/api/token"), data);

            var token_data = JsonConvert.DeserializeObject<Dictionary<string, string>>(response);

            var accessToken = token_data["access_token"];
            var refreshToken = token_data["refresh_token"];

            var profile = this.GetProfileData(accessToken);
            var id = profile["id"];

            RefreshTokens.Add(new KeyValuePair<string, string>(id, refreshToken));

            var result = new ContentResult();
            result.Content = response;

            return result;
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

            string refreshToken = RefreshTokens[id];
            parameters.Add("refresh_token", refreshToken);

            var data = JsonConvert.SerializeObject(parameters);

            var response = client.UploadString(new Uri(SPOTIFY_ACCOUNTS_ENDPOINT, "/api/token"), data);

            var result = new ContentResult();
            result.Content = response;

            return result;
        }

        private IDictionary<string, string> GetProfileData(string accessToken)
        {
            var client = new WebClient();
            client.Headers.Add("Authorization", "Bearer " + accessToken);
            var json = client.DownloadString(new Uri(SPOTIFY_API_ENDPOINT, "/v1/me"));

            return JsonConvert.DeserializeObject<Dictionary<string, string>>(json);
        } 
    }
}