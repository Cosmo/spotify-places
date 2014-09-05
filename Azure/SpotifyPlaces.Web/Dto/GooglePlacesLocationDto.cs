namespace SpotifyPlaces.Web.Dto
{
    using Newtonsoft.Json;

    public class GooglePlacesLocationDto
    {
        [JsonProperty(PropertyName = "lat")]
        public string Latitude { get; set; }

        [JsonProperty(PropertyName = "lng")]
        public string Longitude { get; set; }
    }
}