namespace SpotifyPlaces.Web.Dto
{
    using Newtonsoft.Json;

    public class GooglePlacesResultItemDto
    {
        [JsonProperty(PropertyName = "place_id")]
        public string PlaceId { get; set; }

        [JsonProperty(PropertyName = "name")]
        public string Name { get; set; }

        [JsonProperty(PropertyName = "geometry")]
        public GooglePlacesGeometryDto Geometry { get; set; }

        [JsonProperty(PropertyName = "types")]
        public string[] Types { get; set; }
    }
}