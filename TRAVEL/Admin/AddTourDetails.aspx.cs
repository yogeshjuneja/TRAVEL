using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TRAVEL.Admin
{
    public partial class AddTourDetails : System.Web.UI.Page
    {
        DataTable dtPackageDetails = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                InitialRow();
            }
        }


        private void InitialRow()
        {
            try
            {
                dtPackageDetails.Columns.Add("PackageDetailsID", typeof(Int32));
                dtPackageDetails.Columns.Add("Description", typeof(string));
                dtPackageDetails.Columns.Add("IncluExcluType", typeof(bool));
                DataRow dr = null;
                dr = dtPackageDetails.NewRow();
                dr["PackageDetailsID"] = 0;
                dr["Description"] = "";
                dr["IncluExcluType"] = false;
                dtPackageDetails.Rows.Add(dr);
                ViewState["vwPackageDetails"] = dtPackageDetails;
                gvPackageDetails.DataSource = dtPackageDetails;
                gvPackageDetails.DataBind();

            }
            catch (Exception ex)
            {

                throw;
            }
        }

        protected void btnAddMore_Click(object sender, EventArgs e)
        {
            try
            {
                RestorePreviousData();

                DataRow dr = dtPackageDetails.NewRow();
                dr["PackageDetailsID"] = 0;
                dr["Description"] = "";
                dr["IncluExcluType"] = false;
                dtPackageDetails.Rows.Add(dr);
                ViewState["vwPackageDetails"] = dtPackageDetails;
                gvPackageDetails.DataSource = dtPackageDetails;
                gvPackageDetails.DataBind();




            }
            catch (Exception ex)
            {

                throw;
            }
        }

        private void RestorePreviousData()
        {
            dtPackageDetails = (DataTable)ViewState["vwPackageDetails"];
            int i = 0;
            foreach (GridViewRow gvRow in gvPackageDetails.Rows)
            {
                dtPackageDetails.Rows[i]["PackageDetailsID"] = ((HiddenField)gvRow.FindControl("hfPID")).Value;
                dtPackageDetails.Rows[i]["Description"] = ((TextBox)gvRow.FindControl("txtDetails")).Text;
                dtPackageDetails.Rows[i]["IncluExcluType"] = ((CheckBox)gvRow.FindControl("chkInclude")).Checked;
                i++;
            }
        }

        protected void gvPackageDetails_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                switch(e.CommandName)
                {
                    case "iDelete":
                        {
                            if(gvPackageDetails.Rows.Count>1)
                            {
                                RestorePreviousData();
                                int index = Convert.ToInt32(e.CommandArgument);
                                dtPackageDetails.Rows.RemoveAt(index);
                                gvPackageDetails.DataSource = dtPackageDetails;
                                gvPackageDetails.DataBind();
                            }
                            break;

                        }
                }
            }
            catch (Exception ex)
            {

                throw;
            }
        }
    }
}