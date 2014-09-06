namespace SpotifyPlaces.Web.Dto
{
    using MongoDB.Bson.Serialization.Attributes;

    public class UserMongoDbDto
    {
        [BsonId(Order = 0)]
        public string Id { get; set; }

        [BsonElement("name")]
        public string Name { get; set; }

        [BsonElement("pictureUrl")]
        public string PictureUrl { get; set; }

        [BsonElement("refreshToken")]
        public string RefreshToken { get; set; }

        [BsonElement("accessToken")]
        public string AccessToken { get; set; }

        [BsonElement("tracks")]
        public TrackMongoDbDto[] Tracks { get; set; }
    }
}