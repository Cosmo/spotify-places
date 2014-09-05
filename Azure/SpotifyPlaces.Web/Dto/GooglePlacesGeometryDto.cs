namespace SpotifyPlaces.Web.Dto
{
    using Newtonsoft.Json;

    public class GooglePlacesGeometryDto
    {
        [JsonProperty(PropertyName = "location")]
        public GooglePlacesLocationDto Location { get; set; }
    }
}