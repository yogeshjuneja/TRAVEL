using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BLLTRAVEL;
using System.Configuration;

namespace TRAVEL.Admin
{
    public partial class ViewTourDetails : System.Web.UI.Page
    {
       

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
              
                BindTourDropDown();
                BindTripDropDown();

                      BindTourDetails();
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

        void BindTourDetails()
        {
            try
            {
                BLLTourDetailsData objBLLTourDetailsData = new BLLTourDetailsData { Sptype = 2, TourID=Convert.ToInt32(ddlTourPlace.SelectedValue), TripTypeID=Convert.ToInt32(ddlTripType.SelectedValue)};
                DataSet objDataSet = objBLLTourDetailsData.ExecuteDataSet(objBLLTourDetailsData);
                grdTourDtls.DataSource = objDataSet;
                grdTourDtls.DataBind();


            }
            catch (Exception ex)
            {

                CommonFunction.Message(divMsg, lblMessage, ex.ToString(), 2);
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            BindTourDetails();
        }
    }
}