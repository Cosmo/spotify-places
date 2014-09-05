namespace SpotifyPlaces.Web.Dto
{
    using Newtonsoft.Json;

    public class GooglePlacesResponseDto
    {
        [JsonProperty(PropertyName = "results")]
        public GooglePlacesResultItemDto[] Items { get; set; }
    }
}