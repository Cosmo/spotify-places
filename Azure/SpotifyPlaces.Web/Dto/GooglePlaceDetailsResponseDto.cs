namespace SpotifyPlaces.Web.Dto
{
    using Newtonsoft.Json;

    public class GooglePlaceDetailsResponseDto
    {
        [JsonProperty(PropertyName = "result")]
        public GooglePlacesResultItemDto Result { get; set; }
    }
}