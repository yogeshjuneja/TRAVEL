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
    public partial class TripDetail : System.Web.UI.Page
    {
        private int TripID
        {
            get
            {
                if (Request.QueryString["TID"] != null)
                {
                    try
                    {
                        return Convert.ToInt32(Request.QueryString["TID"]);
                    }
                    catch (Exception)
                    {

                        return 0;
                    }

                }
                else
                {
                    return 0;
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }
        void BindData()
        {
            try
            {
                BLLTourDetailsData objBLLTourDetailsData = new BLLTourDetailsData();
                objBLLTourDetailsData.Sptype = 3;
                objBLLTourDetailsData.TourDetailsID = TripID;
                DataSet objDataSet = objBLLTourDetailsData.ExecuteDataSet(objBLLTourDetailsData);
                if(objDataSet.Tables[0].Rows.Count>0)
                {
                    lblTourInfo.Text = objDataSet.Tables[0].Rows[0]["TourInfo"].ToString();
                    lblTourName.Text= objDataSet.Tables[0].Rows[0]["Place"].ToString();  
                }
                if(objDataSet.Tables[1].Rows.Count>0)
                {
                    DataTable dtInclude = objDataSet.Tables[1].Select("IncluExcluType=1").CopyToDataTable();
                    rptPkgInclude.DataSource = dtInclude;
                    rptPkgInclude.DataBind();

                    DataTable dtExclude = objDataSet.Tables[1].Select("IncluExcluType=0").CopyToDataTable();
                    rptExclude.DataSource = dtExclude;
                    rptExclude.DataBind();

                }
                if (objDataSet.Tables[2].Rows.Count > 0)
                {
                    rptIternary.DataSource = objDataSet.Tables[2];
                    rptIternary.DataBind();
                }
                if(objDataSet.Tables[3].Rows.Count>0)
                {
                    rptImages.DataSource = objDataSet.Tables[3];
                    rptImages.DataBind();

                }


            }
            catch (Exception ex)
            {

                throw;
            }
        }
    }
}