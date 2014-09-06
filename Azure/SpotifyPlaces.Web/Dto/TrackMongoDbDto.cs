namespace SpotifyPlaces.Web.Dto
{
    using MongoDB.Bson.Serialization.Attributes;

    public class TrackMongoDbDto
    {
        [BsonId(Order = 0)]
        public string Id { get; set; }

        [BsonElement("title")]
        public string Title { get; set; }

        [BsonElement("artist")]
        public string Artist { get; set; }

        [BsonElement("coverUrl")]
        public string CoverUrl { get; set; }
    }
}