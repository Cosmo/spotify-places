namespace SpotifyPlaces.Web.Controllers
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Net;
    using System.Threading.Tasks;
    using System.Web.Http;

    using Newtonsoft.Json;

    using NReco.CF.Taste.Impl.Common;
    using NReco.CF.Taste.Impl.Model;
    using NReco.CF.Taste.Impl.Recommender;
    using NReco.CF.Taste.Model;

    using SpotifyPlaces.Web.Dto;

    public class PlacesController : ApiController
    {
        private static IDataModel dataModel;

        public async Task<IEnumerable<PlaceDto>> Get_(string lat, string lng)
        {
            var places = await this.GetPlacesFromGoogle(lat, lng);

            return places.Items.Select(
                x => new PlaceDto()
                         {
                             Id = x.Id, 
                             Name = x.Name, 
                             Latitude = x.Geometry.Location.Latitude,
                             Longitude = x.Geometry.Location.Longitude
                         });

            if (dataModel == null)
            {
                var donniePrefs = new List<IPreference>();
                donniePrefs.Add(new BooleanPreference(1, 1));
                donniePrefs.Add(new BooleanPreference(1, 2));
                donniePrefs.Add(new BooleanPreference(1, 4));
                donniePrefs.Add(new BooleanPreference(1, 9));
                var donnieUserPrefs = new BooleanUserPreferenceArray(donniePrefs);

                var cosmoPrefs = new List<IPreference>();
                cosmoPrefs.Add(new BooleanPreference(2, 11));
                cosmoPrefs.Add(new BooleanPreference(2, 14));
                cosmoPrefs.Add(new BooleanPreference(2, 17));
                cosmoPrefs.Add(new BooleanPreference(2, 19));
                cosmoPrefs.Add(new BooleanPreference(2, 21));
                cosmoPrefs.Add(new BooleanPreference(2, 24));
                cosmoPrefs.Add(new BooleanPreference(2, 27));
                cosmoPrefs.Add(new BooleanPreference(2, 29));
                var cosmoUserPrefs = new BooleanUserPreferenceArray(cosmoPrefs);

                var olcayPrefs = new List<IPreference>();
                olcayPrefs.Add(new BooleanPreference(2, 31));
                olcayPrefs.Add(new BooleanPreference(2, 34));
                olcayPrefs.Add(new BooleanPreference(2, 35));
                olcayPrefs.Add(new BooleanPreference(2, 36));
                olcayPrefs.Add(new BooleanPreference(2, 47));
                olcayPrefs.Add(new BooleanPreference(2, 48));
                olcayPrefs.Add(new BooleanPreference(2, 49));
                olcayPrefs.Add(new BooleanPreference(2, 42));
                olcayPrefs.Add(new BooleanPreference(2, 44));
                olcayPrefs.Add(new BooleanPreference(2, 43));
                var olcayUserPrefs = new BooleanUserPreferenceArray(olcayPrefs);

                var placePrefs = new List<IPreference>();
                placePrefs.Add(new BooleanPreference(0, 1));
                placePrefs.Add(new BooleanPreference(0, 11));
                placePrefs.Add(new BooleanPreference(0, 31));
                var placeUserPrefs = new BooleanUserPreferenceArray(placePrefs);

                var data = new FastByIDMap<IPreferenceArray>();
                data.Put(1, donnieUserPrefs);
                data.Put(2, cosmoUserPrefs);
                data.Put(3, olcayUserPrefs);

                data.Put(0, placeUserPrefs);

                dataModel = new GenericDataModel(data);
            }

            var recommender = new ItemAverageRecommender(dataModel);
            var recommendations = recommender.Recommend(0, 10);

            throw new NotImplementedException();
        }

        private async Task<GooglePlacesResponseDto> GetPlacesFromGoogle(string lat, string lng)
        {
            var format = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location={0},{1}&radius=200&types=night_club|restaurant&key=AIzaSyAt7b1MORyXmR9-RG8c927C-BW1sach8lM";
            var url = string.Format(format, lat, lng);

            var client = new WebClient();
            var json = client.DownloadString(url);

            var dto = JsonConvert.DeserializeObject<GooglePlacesResponseDto>(json);

            return dto;
        }

        public string Get(int id)
        {
            return "value";
        }

        public void Post([FromBody]string value)
        {
        }
    }
}
