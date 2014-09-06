namespace SpotifyPlaces.Web.Dto
{
    using Newtonsoft.Json;

    public class SpotifyUserTracksDto
    {
        [JsonProperty(PropertyName = "items")]
        public SpotifyUserTrackDto[] Items { get; set; }

        [JsonProperty(PropertyName = "total")]
        public int Total { get; set; }
    }
}