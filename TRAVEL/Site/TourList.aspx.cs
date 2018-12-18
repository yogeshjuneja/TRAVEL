using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLLTRAVEL;

namespace TRAVEL.Site
{
    public partial class TourList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindCategory();
        }
        void BindCategory()
        {
            try
            {
                BLLM_PackageDetails obBLLM_PackageDetails = new BLLM_PackageDetails() { Sptype = 1 };
                DataSet ds = obBLLM_PackageDetails.ExecuteDataSet(obBLLM_PackageDetails);
               
               
                chkCategory.DataValueField = "ID";
                chkCategory.DataTextField = "PackageName";
                chkCategory.DataSource = ds;
                chkCategory.DataBind();
                chkCategory.Items.Insert(0, new ListItem("All Style", "0"));
            }
            catch (Exception)
            {

                throw;
            }
        }



    }
}