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
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                CheckReviewsEnquiry();
            }
        }

        void CheckReviewsEnquiry()
        {
            try
            {
                BLLReviews objBLLReviews = new BLLReviews();
                objBLLReviews.Sptype = 4;
                DataSet output = objBLLReviews.ExecuteDataSet(objBLLReviews);
                int reviews = Convert.ToInt32(output.Tables[0].Rows[0][0]);
                int enquiry = Convert.ToInt32(output.Tables[1].Rows[0][0]);
                spnReview.Visible = reviews > 0;
                if (reviews > 0)
                {
                    spnReview.InnerHtml = reviews.ToString();
                }
                else
                {
                    spnReview.InnerHtml = "";
                }
                if (enquiry > 0)
                {
                    spnEnquiry.InnerHtml = enquiry.ToString();
                }
                else
                {
                    spnEnquiry.InnerHtml = "";
                }

            }
            catch (Exception ex)
            {

                throw;
            }
        }
    }
}