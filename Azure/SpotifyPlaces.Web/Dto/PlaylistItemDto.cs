namespace SpotifyPlaces.Web.Dto
{
    using Newtonsoft.Json;

    public class PlaylistItemDto
    {
        [JsonProperty(PropertyName = "spotifyId")]
        public string SpotifyId { get; set; }

        [JsonProperty(PropertyName = "title")]
        public string Title { get; set; }

        [JsonProperty(PropertyName = "artist")]
        public string Artist { get; set; }

        [JsonProperty(PropertyName = "coverUrl")]
        public string CoverUrl { get; set; }
    }
}