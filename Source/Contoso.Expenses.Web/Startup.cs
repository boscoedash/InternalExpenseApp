using Microsoft.Owin;
using Owin;
using System.Net;

[assembly: OwinStartupAttribute(typeof(Contoso.Expenses.Web.Startup))]
namespace Contoso.Expenses.Web
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12 | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls;
        }
    }
}
