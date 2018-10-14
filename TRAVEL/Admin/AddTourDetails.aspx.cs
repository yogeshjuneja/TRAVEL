using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLLTRAVEL;
using System.Configuration;

namespace TRAVEL.Admin
{
    public partial class AddTourDetails : System.Web.UI.Page
    {

        DataTable dtPackageDetails = new DataTable();
        DataTable dtIternaryDetails = new DataTable();
        public Int32 TourID { get { return !String.IsNullOrEmpty(Request.QueryString["TID"]) ? Convert.ToInt32(Request.QueryString["TID"]) : 0; } }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)


            {
               
                BindTourDropDown();
                BindTripDropDown();


                if (TourID != 0)
                {
                    BindDetails();
                    lblSubmit.Text = "Update";
                }
                else
                {
                    InitialRowPackageDetails();
                    InitialRowIternary();
                    lblSubmit.Text = "Submit";
                }


            }
        }



        void BindDetails()
        {
            try
            {
                BLLTourDetailsData objBLLTourDetailsData = new BLLTourDetailsData() { Sptype = 3 , TourDetailsID=TourID};
                DataSet dtDataSet = objBLLTourDetailsData.ExecuteDataSet(objBLLTourDetailsData);
                if(dtDataSet.Tables[0].Rows.Count>0)
                {
                    ddlTripType.SelectedValue = dtDataSet.Tables[0].Rows[0]["TripTypeID"].ToString();
                    txtTourInfo.Text = dtDataSet.Tables[0].Rows[0]["TourInfo"].ToString();
                    ddlTourPlace.SelectedValue = dtDataSet.Tables[0].Rows[0]["TourID"].ToString();
                    txtPlace.Text = dtDataSet.Tables[0].Rows[0]["Place"].ToString();
                    txtDays.Text = dtDataSet.Tables[0].Rows[0]["Days"].ToString();
                    txtNights.Text = dtDataSet.Tables[0].Rows[0]["Nights"].ToString();
                    txtDiscount.Text = Convert.ToInt32( dtDataSet.Tables[0].Rows[0]["Discount"]).ToString();

                    dtPackageDetails = dtDataSet.Tables[1];
                    ViewState["vwPackageDetails"] = dtPackageDetails;
                    gvPackageDetails.DataSource = dtPackageDetails;
                    gvPackageDetails.DataBind();

                    dtIternaryDetails = dtDataSet.Tables[2];
                    ViewState["vwIternaryDetails"] = dtIternaryDetails;
                    gvIternary.DataSource = dtIternaryDetails;
                    gvIternary.DataBind();

                }


            }
            catch (Exception ex)
            {

                throw;
            }
           
        }
        void BindTourDropDown()
        {
            try
            {
                BLLTravel objBLLTravel = new BLLTravel() { Sptype = 1 };
                DataTable dt = objBLLTravel.ExecuteDataSet(objBLLTravel).Tables[0];
                CommonFunction.BindDDL(dt, "TourPlace", "TourID", ref ddlTourPlace);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        void BindTripDropDown()
        {
            try
            {
                BLLTrip objBLLTrip = new BLLTrip() { Sptype = 1 };
                DataTable dt = objBLLTrip.ExecuteDataSet(objBLLTrip).Tables[0];
                CommonFunction.BindDDL(dt, "TripName", "TripTypeID", ref ddlTripType);
            }
            catch (Exception ex)
            {
                CommonFunction.Message(divMsg, lblMessage, ex.ToString(), 2);
            }
        }

        private void InitialRowPackageDetails()
        {
            try
            {
               
                dtPackageDetails.Columns.Add("PackageDetailsID", typeof(Int32));
                dtPackageDetails.Columns.Add("Description", typeof(string));
                dtPackageDetails.Columns.Add("IncluExcluType", typeof(bool));
                dtPackageDetails.Columns.Add("PackageID", typeof(int));


                DataRow dr = null;
                dr = dtPackageDetails.NewRow();
                dr["PackageDetailsID"] = 0;
                dr["Description"] = "";
                dr["IncluExcluType"] = false;
                dr["PackageID"] = 0;
                dtPackageDetails.Rows.Add(dr);
                ViewState["vwPackageDetails"] = dtPackageDetails;
                gvPackageDetails.DataSource = dtPackageDetails;
                gvPackageDetails.DataBind();

            }
            catch (Exception ex)
            {

                CommonFunction.Message(divMsg, lblMessage, ex.ToString(), 2);
            }
        }

        private void InitialRowIternary()
        {
            try
            {
                dtIternaryDetails.Columns.Add("ItnryDtlsID", typeof(Int32));
                dtIternaryDetails.Columns.Add("ItnryMainH", typeof(string));
                dtIternaryDetails.Columns.Add("ItnrySubH", typeof(string));
                dtIternaryDetails.Columns.Add("ItnryImage", typeof(string));
                //DataRow dr = null;
                //dr = dtIternaryDetails.NewRow();
                //dr["ItnryDtlsID"] = 0;
                //dr["ItnryMainH"] = "";
                //dr["ItnrySubH"] = "";
                //dr["ItnryImage"] = "";
                //dtIternaryDetails.Rows.Add(dr);
                ViewState["vwIternaryDetails"] = dtIternaryDetails;
                gvIternary.DataSource = dtIternaryDetails;
                gvIternary.DataBind();

            }
            catch (Exception ex)
            {

                CommonFunction.Message(divMsg, lblMessage, ex.ToString(), 2);
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
                dr["PackageID"] = false;
                dtPackageDetails.Rows.Add(dr);
                ViewState["vwPackageDetails"] = dtPackageDetails;
                gvPackageDetails.DataSource = dtPackageDetails;
                gvPackageDetails.DataBind();




            }
            catch (Exception ex)
            {

                CommonFunction.Message(divMsg, lblMessage, ex.ToString(), 2);
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
                dtPackageDetails.Rows[i]["PackageID"] = ((DropDownList)gvRow.FindControl("drpDetails")).SelectedValue;
                i++;
            }
        }

        private void RestorePreviousDataIternary()
        {
            dtIternaryDetails = (DataTable)ViewState["vwIternaryDetails"];
            int i = 0;
            foreach (GridViewRow gvRow in gvIternary.Rows)
            {
                dtIternaryDetails.Rows[i]["ItnryDtlsID"] = ((HiddenField)gvRow.FindControl("hfIID")).Value;
                dtIternaryDetails.Rows[i]["ItnryMainH"] = ((Label)gvRow.FindControl("lblHeading")).Text;
                dtIternaryDetails.Rows[i]["ItnrySubH"] = ((Label)gvRow.FindControl("lblDescription")).Text;
                dtIternaryDetails.Rows[i]["ItnryImage"] = ((HiddenField)gvRow.FindControl("hfImg")).Value;
                i++;
            }
        }

        protected void gvPackageDetails_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                switch (e.CommandName)
                {
                    case "iDelete":
                        {
                            if (gvPackageDetails.Rows.Count > 1)
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
                CommonFunction.Message(divMsg, lblMessage, ex.ToString(), 2);
            }
        }
         
        protected void gvIternary_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                switch (e.CommandName)  
                {
                    case "iDelete":
                        {
                            RestorePreviousDataIternary();
                            int index = Convert.ToInt32(e.CommandArgument);
                            dtIternaryDetails.Rows.RemoveAt(index);
                            gvIternary.DataSource = dtIternaryDetails;
                            gvIternary.DataBind();
                            break;
                        }
                }
            }
            catch (Exception ex)
            {

                CommonFunction.Message(divMsg, lblMessage, ex.ToString(), 2);
            }
        }

        protected void btnAddMoreIernary_Click(object sender, EventArgs e)
        {
            try
            {
                

                RestorePreviousDataIternary();
                FileUpload fleIternary = gvIternary.HeaderRow.FindControl("fleIternary") as FileUpload;
                string filename = System.DateTime.Now.Ticks + "_" + fleIternary.FileName;
                fleIternary.SaveAs(Server.MapPath("~/Upload") +"/"+ filename);

                DataRow dr = dtIternaryDetails.NewRow();
                dr["ItnryDtlsID"] = 0;
                dr["ItnryMainH"] = ((TextBox)gvIternary.HeaderRow.FindControl("txtHeading")).Text;
                dr["ItnrySubH"] = ((TextBox)gvIternary.HeaderRow.FindControl("txtDescription")).Text; ;
                dr["ItnryImage"] = filename;
                dtIternaryDetails.Rows.Add(dr);
                ViewState["vwIternaryDetails"] = dtIternaryDetails;
                gvIternary.DataSource = dtIternaryDetails;
                gvIternary.DataBind();
            }
            catch (Exception ex)
            {
                CommonFunction.Message(divMsg, lblMessage, ex.ToString(), 2);
            }
        }


        void  ClearControls()
        {
            txtTourInfo.Text = "";
            txtPlace.Text = "";
            txtDays.Text = "";
            txtNights.Text = "";
            ddlTripType.SelectedIndex = 0;
            ddlTourPlace.SelectedIndex = 0;
            txtDiscount.Text = "";
            dtPackageDetails = new DataTable();
            dtIternaryDetails = new DataTable();
            InitialRowPackageDetails();
            InitialRowIternary();

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                BLLTourDetailsData objBLLTourDetailsData = new BLLTourDetailsData();
                objBLLTourDetailsData.TourDetailsID = TourID;
                objBLLTourDetailsData.Sptype = 1;
                objBLLTourDetailsData.TourInfo = txtTourInfo.Text;
                objBLLTourDetailsData.Place = txtPlace.Text;
                objBLLTourDetailsData.Days = string.IsNullOrEmpty(txtDays.Text) ?0: Convert.ToInt32(txtDays.Text);
                objBLLTourDetailsData.Nights = Convert.ToInt32(txtNights.Text);
                objBLLTourDetailsData.TripTypeID = Convert.ToInt32(ddlTripType.SelectedValue);
                objBLLTourDetailsData.TourID = Convert.ToInt32(ddlTourPlace.SelectedValue);
                objBLLTourDetailsData.Discount = Convert.ToDecimal(txtDiscount.Text);
                RestorePreviousData();
                RestorePreviousDataIternary();
                objBLLTourDetailsData.dtPackageDetails = dtPackageDetails;
                objBLLTourDetailsData.dtIternaryDetail = dtIternaryDetails;
                int reponse = objBLLTourDetailsData.ExecuteNonQuery(objBLLTourDetailsData);
                if(reponse == -200)
                {
                    CommonFunction.Message(divMsg, lblMessage, TourID==0?"Data Saved successfully":"Data Updated successfully", 1);
                    if(TourID==0)
                    {
                        ClearControls();
                    }
                } 
                else
                {
                    CommonFunction.Message(divMsg, lblMessage, "Unable to Save data",2);
                }
               
            }
            catch (Exception ex)
            {
                CommonFunction.Message(divMsg, lblMessage, ex.ToString(), 2);
            }
        }

        protected void gvPackageDetails_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DropDownList drpDetails = e.Row.FindControl("drpDetails") as DropDownList;
                BLLM_PackageDetails objBLLM_PackageDetails = new BLLM_PackageDetails() { Sptype=1} ;
                DataTable dt = objBLLM_PackageDetails.ExecuteDataSet(objBLLM_PackageDetails).Tables[0];
                CommonFunction.BindDDL(dt, "PackageName", "ID", ref drpDetails);
                drpDetails.SelectedValue = ((DataTable)ViewState["vwPackageDetails"]).Rows[e.Row.RowIndex]["PackageID"].ToString();
            }
        }
    }
}