namespace SpotifyPlaces.Web.Controllers
{
    using System.Web.Mvc;

    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Title = "Spotify Places API";

            return this.View();
        }
    }
}
