namespace SpotifyPlaces.Web.Dto
{
    using Newtonsoft.Json;

    public class PlaceDto
    {
        [JsonProperty(PropertyName = "id")]
        public string Id { get; set; }

        [JsonProperty(PropertyName = "name")]
        public string Name { get; set; }

        [JsonProperty(PropertyName = "lat")]
        public string Latitude { get; set; }

        [JsonProperty(PropertyName = "lng")]
        public string Longitude { get; set; }

        [JsonProperty(PropertyName = "playlist")]
        public PlaylistDto Playlist { get; set; }

        [JsonProperty(PropertyName = "score")]
        public int Score { get; set; }

        [JsonProperty(PropertyName = "placesEnabled")]
        public bool PlacesEnabled { get; set; }

        [JsonProperty(PropertyName = "people")]
        public string[] People { get; set; }
    }
}