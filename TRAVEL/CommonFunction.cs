using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Collections;

namespace TRAVEL
{
    public class CommonFunction
    {

       static Hashtable hsClass = new Hashtable();

        static CommonFunction()
        {
            hsClass.Add(1, "successHandler alert alert-success");
            hsClass.Add(2, "errorHandler alert alert-danger");
        }



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



        public static void Message(HtmlGenericControl divMsg,Label lblToShow, string Text, int type)
        {
            divMsg.Attributes.Remove("class");
            divMsg.Attributes.Add("class", hsClass[type].ToString());
            lblToShow.Text = Text;
        }
    }
}