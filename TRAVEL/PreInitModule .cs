using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace TRAVEL
{
    public class PreInitModule :IHttpModule
    {
        public void Init(HttpApplication context)
        {
            context.PreRequestHandlerExecute += context_PreRequestHandlerExecute;
        }

        ///<summary>
        ///Disposes of the resources (other than memory) used by the module that implements <see cref="T:System.Web.IHttpModule"></see>.
        ///</summary>
        public void Dispose()
        {
        }
 
        private static void context_PreRequestHandlerExecute(object sender, EventArgs e)
        {
            Page page = HttpContext.Current.CurrentHandler as Page;
            if (page != null) page.PreInit += page_PreInit;
        }


        static void page_PreInit(object sender, EventArgs e)
        {
            HttpContext context = ((HttpApplication)sender).Context;
            if (context.Request.Url.AbsoluteUri.Contains("Admin"))
            {
                if(SessionManager.Admin!=null)
                {
                    context.Response.Redirect("/Admin/Login.aspx");
                }
            }
        }

    }
}