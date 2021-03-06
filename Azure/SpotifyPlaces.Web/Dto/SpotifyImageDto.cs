namespace SpotifyPlaces.Web.Dto
{
    using Newtonsoft.Json;

    public class SpotifyImageDto
    {
        [JsonProperty(PropertyName = "height")]
        public int Height { get; set; }

        [JsonProperty(PropertyName = "width")]
        public int Width { get; set; }

        [JsonProperty(PropertyName = "url")]
        public string Url { get; set; }
    }
}