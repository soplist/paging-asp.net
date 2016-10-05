using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(paging.Startup))]
namespace paging
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
