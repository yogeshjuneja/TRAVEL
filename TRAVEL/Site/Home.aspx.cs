using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLLTRAVEL;
using System.Data;

namespace TRAVEL.Site
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                BindRepeater();

        }
        void BindRepeater()
        {
            try
            {
                BLLTourDetailsData objBLLTourDetailsData = new BLLTourDetailsData() { Sptype = 4 };
                DataSet objDataSet = objBLLTourDetailsData.ExecuteDataSet(objBLLTourDetailsData);
                rptTours.DataSource = objDataSet;
                rptTours.DataBind();
                
            }
            catch (Exception ex)
            {

                throw;
            }
        }
    }
}