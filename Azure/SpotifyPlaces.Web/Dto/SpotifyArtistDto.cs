namespace SpotifyPlaces.Web.Dto
{
    using Newtonsoft.Json;

    public class SpotifyArtistDto
    {
        [JsonProperty(PropertyName = "name")]
        public string Name { get; set; }
    }
}