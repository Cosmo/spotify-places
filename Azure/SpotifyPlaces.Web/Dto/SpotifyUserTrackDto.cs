namespace SpotifyPlaces.Web.Dto
{
    using Newtonsoft.Json;

    public class SpotifyUserTrackDto
    {
        [JsonProperty(PropertyName = "added_at")]
        public string AddedAt { get; set; }

        [JsonProperty(PropertyName = "track")]
        public SpotifyTrackDto Track { get; set; }
    }
}