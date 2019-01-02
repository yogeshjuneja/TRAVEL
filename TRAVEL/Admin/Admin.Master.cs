using BLLTRAVEL;
using System;
using System.Data;
using System.Web;

namespace TRAVEL.Admin
{
    public partial class Admin : System.Web.UI.MasterPage
    {

        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (SessionManager.Admin == null)
            {
                Response.Redirect("/Admin/Login.aspx");
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            if (SessionManager.Admin == null)
            {
                Response.Redirect("/Admin/Login.aspx");
            }
           
            if (!IsPostBack)
            {
                CheckReviewsEnquiry();
                if (SessionManager.Admin != null)
                {
                    lblName.Text = SessionManager.Admin.NAME;
                }
            }
        }


        private void CheckReviewsEnquiry()
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
            catch (Exception)
            {


            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            try
            {
                HttpContext.Current.Session["AdminID"] = null;
                Session.Abandon();
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}