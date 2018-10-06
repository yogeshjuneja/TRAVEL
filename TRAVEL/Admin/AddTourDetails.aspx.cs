﻿using System;
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
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitialRowPackageDetails();
                InitialRowIternary();
                BindTourDropDown();
                BindTripDropDown();
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
                throw;
            }
        }

        private void InitialRowPackageDetails()
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
                throw;
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

                throw;
            }
        }

        protected void btnAddMoreIernary_Click(object sender, EventArgs e)
        {
            try
            {
                RestorePreviousDataIternary();
                DataRow dr = dtIternaryDetails.NewRow();
                dr["ItnryDtlsID"] = 0;
                dr["ItnryMainH"] = "";
                dr["ItnrySubH"] = "";
                dr["ItnryImage"] = "";
                dtIternaryDetails.Rows.Add(dr);
                ViewState["vwIternaryDetails"] = dtIternaryDetails;
                gvIternary.DataSource = dtIternaryDetails;
                gvIternary.DataBind();
            }
            catch (Exception ex)
            {

                throw;
            }
        }


    }
}