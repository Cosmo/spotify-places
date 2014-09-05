namespace SpotifyPlaces.Web.Dto
{
    using Newtonsoft.Json;

    public class PlaylistItemDto
    {
        [JsonProperty(PropertyName = "spotifyId")]
        public string SpotifyId { get; set; }

        [JsonProperty(PropertyName = "title")]
        public string Title { get; set; }
    }
}