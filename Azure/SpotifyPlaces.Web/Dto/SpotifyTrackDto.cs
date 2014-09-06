namespace SpotifyPlaces.Web.Dto
{
    using Newtonsoft.Json;

    public class SpotifyTrackDto
    {
        [JsonProperty(PropertyName = "album")]
        public SpotifyAlbumDto Album { get; set; }

        [JsonProperty(PropertyName = "artist")]
        public SpotifyArtistDto Artist { get; set; }

        [JsonProperty(PropertyName = "href")]
        public string Href { get; set; }

        [JsonProperty(PropertyName = "id")]
        public string Id { get; set; }

        [JsonProperty(PropertyName = "name")]
        public string Name { get; set; }

        [JsonProperty(PropertyName = "uri")]
        public string Uri { get; set; }
    }
}