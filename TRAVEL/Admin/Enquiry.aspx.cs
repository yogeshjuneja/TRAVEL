using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLLTRAVEL;
using System.Data;

namespace TRAVEL.Admin
{
    public partial class Enquiry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
             {
                BindEnquerydetails();

            }
             
           
        }

        void BindEnquerydetails()
        {
           try
            {
                BLLEnquiryDetails objBLLEnquiryDetails = new BLLEnquiryDetails
                {
                    Sptype = 2,
                    Name = txtname.Text,
                    Email = txtemail.Text,
                    

                };

                if (txtDatefrom.Text != "")
                {
                    objBLLEnquiryDetails.DurationFrom =  txtDatefrom.Text;
                }
               
                if(txtDateTo.Text != "")
                {
                    objBLLEnquiryDetails.DurationTo = txtDateTo.Text;
                }
              
                DataSet objEnq = objBLLEnquiryDetails.ExecuteDataSet(objBLLEnquiryDetails);
                grdEnquiryDetails.DataSource = objEnq;
                grdEnquiryDetails.DataBind();
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            BindEnquerydetails();
        }

        protected void grdEnquiryDetails_RowDataBound(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                switch (e.CommandName)
                {
                    case "iDelete":
                        {
                            BLLEnquiryDetails objBLLEnquiryDetails = new BLLEnquiryDetails();
                            objBLLEnquiryDetails.Sptype = 2;
                            objBLLEnquiryDetails.TourID = Convert.ToInt32(e.CommandArgument);
                            int response = objBLLEnquiryDetails.ExecuteNonQuery(objBLLEnquiryDetails);
                            if (response == -200)
                                BindEnquerydetails();
                            break;
                        }
                }
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
    }
}