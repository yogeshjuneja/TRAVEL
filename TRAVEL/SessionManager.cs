using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BLLTRAVEL;

namespace TRAVEL
{
    public class SessionManager
    {

        // Assigning Session 
        public static BLLAdminLogin Admin
        {
            get
            {

                return  HttpContext.Current.Session["AdminID"] != null ? (BLLAdminLogin)(HttpContext.Current.Session["AdminID"]) :null;
            }
            set
            {
                HttpContext.Current.Session["AdminID"] = value;
            }
        }

    }
}