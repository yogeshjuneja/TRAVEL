using System;
using System.Web.Http;
using System.Web.Routing;

namespace TRAVEL
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            RouteTable.Routes.MapHttpRoute(
                name: "MyAPI",
                routeTemplate: "api/{controller}/{id}",
                defaults: new
                {
                    id = System.Web.Http.RouteParameter.Optional
                }
            );
        }

        protected void Session_End(object sender, EventArgs e)
        {
            Response.Redirect("/Admin/Login.aspx");
        }
    }
}