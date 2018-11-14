using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLLTRAVEL;

namespace TRAVEL.Admin
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                CheckReviews();
            }
        }

        void CheckReviews()
        {
            try
            {
                BLLReviews objBLLReviews = new BLLReviews();
                objBLLReviews.Sptype = 4;
                int output = objBLLReviews.ExecuteNonQuery(objBLLReviews);
                spnReview.Visible = output > 0;
                if (output>0)
                {
                    spnReview.InnerHtml = output.ToString();
                   
                }
                else
                {
                    spnReview.InnerHtml = "";
                }
            }
            catch (Exception ex)
            {

                throw;
            }
        }
    }
}