using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI.WebControls;

namespace TRAVEL
{
    public class CommonFunction
    {
        /// <summary>
        /// Created to bind drop downlist by YJ
        /// </summary>
        /// <param name="DataSource">Data Table as Datasource of DropDown</param>
        /// <param name="DataTextField"> Data Column to be visible</param>
        /// <param name="DataValueField">Value to be visible</param>
        /// <param name="ddl"> DropDownlist</param>
        public static void BindDDL(DataTable DataSource, string DataTextField, string DataValueField, ref DropDownList ddl)
        {
            ddl.DataSource = DataSource;
           
            ddl.DataTextField = DataTextField;
            ddl.DataValueField = DataValueField;
            ddl.DataBind();
            ddl.Items.Insert(0, new ListItem("-Select-", "0"));


        }
    }
}