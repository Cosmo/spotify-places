using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace SpotifyPlaces.Recommendations.Tests
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void Get_Recommendations_For_Group()
        {
            var recommender = new RealtimeRecommender();

            var results = recommender.Recommend();
        }
    }
}
