using Microsoft.Owin;

[assembly: OwinStartup(typeof(SpotifyPlaces.Web.Startup))]

namespace SpotifyPlaces.Web
{
    using Owin;

    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {

        }
    }
}