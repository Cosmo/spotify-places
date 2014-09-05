namespace SpotifyPlaces.Web.Dto
{
    using MongoDB.Bson.Serialization.Attributes;

    public class PlaceMongoDbDto
    {
        [BsonId(Order = 0)]
        public string Id { get; set; }

        [BsonElement("name")]
        public string Name { get; set; }

        [BsonElement("people")]
        public string[] People { get; set; }
    }
}