using BLLTRAVEL;
using System;
using System.Data;
using System.Web.UI.WebControls;

namespace TRAVEL.Admin
{
    public partial class Reviews : System.Web.UI.Page
    {
        private BLLReviews objBLLReviews = new BLLReviews();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Bindgrid();
            }
        }

        private void Bindgrid()
        {
            try
            {

                objBLLReviews.Sptype = 1;
                objBLLReviews.EnumIsApproved = 2;
                DataSet objds = objBLLReviews.ExecuteDataSet(objBLLReviews);
                gvReview.DataSource = objds.Tables[0];
                gvReview.DataBind();
                
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void gvReview_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                switch (e.CommandName)
                {
                    case "iApprove":
                        {
                            objBLLReviews.Sptype = 3;
                            objBLLReviews.EnumIsApproved = 1;
                            objBLLReviews.ReviewID = Convert.ToInt32(e.CommandArgument);
                            int output= objBLLReviews.ExecuteNonQuery(objBLLReviews);
                            if(output==-200)
                            {
                                Response.Redirect(Request.RawUrl);
                                CommonFunction.Message(divMsg, lblMessage,"Changes Updated Successfully", 2);
                            }

                            break;
                        }
                    case "iDisapprove":
                        {

                            objBLLReviews.Sptype = 3;
                            objBLLReviews.ReviewID = Convert.ToInt32(e.CommandArgument);
                            objBLLReviews.EnumIsApproved = 0;
                            int output = objBLLReviews.ExecuteNonQuery(objBLLReviews);
                            if (output == -200)
                            {
                                Response.Redirect(Request.RawUrl);
                                CommonFunction.Message(divMsg, lblMessage, "Changes Updated Successfully", 2);
                            }
                            break;
                        }
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

       
    }
}