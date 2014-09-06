namespace SpotifyPlaces.Web.Dto
{
    using Newtonsoft.Json;

    public class SpotifyUserPlaylistsDto
    {
        [JsonProperty(PropertyName = "items")]
        public SpotifyUserPlaylistDto[] Items { get; set; }
    }
}