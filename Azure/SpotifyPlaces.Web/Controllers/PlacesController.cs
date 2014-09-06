namespace SpotifyPlaces.Web.Controllers
{
    using System.Collections.Generic;
    using System.Linq;
    using System.Net;
    using System.Threading.Tasks;
    using System.Web.Http;

    using Newtonsoft.Json;

    using NReco.CF.Taste.Model;

    using SpotifyPlaces.Web.Dto;

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
    }
}
