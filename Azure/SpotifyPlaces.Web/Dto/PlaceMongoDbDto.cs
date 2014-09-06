namespace SpotifyPlaces.Web.Dto
{
    using System.Collections.Generic;

    using MongoDB.Bson.Serialization.Attributes;

    public class PlaceMongoDbDto
    {
        [BsonId(Order = 0)]
        public string Id { get; set; }

        [BsonElement("name")]
        public string Name { get; set; }

        [BsonElement("people")]
        public string[] People { get; set; }

        [BsonElement("playlist")]
        public PlaylistItemMongoDbDto[] Playlist { get; set; }
    }

    public class PlaylistItemMongoDbDto
    {
        [BsonElement("spotifyId")]
        public string SpotifyId { get; set; }

        [BsonElement("title")]
        public string Title { get; set; }

        [BsonElement("artist")]
        public string Artist { get; set; }

        [BsonElement("coverUrl")]
        public string CoverUrl { get; set; }
    }
}