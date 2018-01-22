using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Supervision.Startup))]
namespace Supervision
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
