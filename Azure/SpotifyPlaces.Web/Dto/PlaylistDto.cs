namespace SpotifyPlaces.Web.Dto
{
    using System.Collections.Generic;

    using Newtonsoft.Json;

    public class PlaylistDto
    {
        [JsonProperty(PropertyName = "spotifyId")]
        public string SpotifyId { get; set; }

        [JsonProperty(PropertyName = "items")]
        public IEnumerable<PlaylistItemDto> Items { get; set; } 
    }
}