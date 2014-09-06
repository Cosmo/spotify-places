namespace SpotifyPlaces.Web.Dto
{
    using Newtonsoft.Json;

    public class SpotifyUserPlaylistDto
    {
        [JsonProperty(PropertyName = "collaborative")]
        public bool Collaborative { get; set; }

        [JsonProperty(PropertyName = "id")]
        public string Id { get; set; }

        [JsonProperty(PropertyName = "images")]
        public SpotifyImageDto[] Images { get; set; }

        [JsonProperty(PropertyName = "name")]
        public string Name { get; set; }

        [JsonProperty(PropertyName = "public")]
        public bool Public { get; set; }

        [JsonProperty(PropertyName = "tracks")]
        public SpotifyTracksDto Tracks { get; set; }
    }
}