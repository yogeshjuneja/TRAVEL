using BLLTRAVEL;
using System;
using System.Data;
using System.Text;

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
                hdnTourID.Value = TripID.ToString();

                BindData();
                BindSimilarTrips();
            }
        }

        private void BindData()
        {
            try
            {
                BLLTourDetailsData objBLLTourDetailsData = new BLLTourDetailsData();
                objBLLTourDetailsData.Sptype = 3;
                objBLLTourDetailsData.TourDetailsID = TripID;
                DataSet objDataSet = objBLLTourDetailsData.ExecuteDataSet(objBLLTourDetailsData);
                if (objDataSet.Tables[0].Rows.Count > 0)
                {
                    lblTourInfo.Text = objDataSet.Tables[0].Rows[0]["TourInfo"].ToString();
                    lblTourName.Text = objDataSet.Tables[0].Rows[0]["Place"].ToString();
                    tripheading.InnerHtml= objDataSet.Tables[0].Rows[0]["ShortDesc"].ToString(); 
                    shortdesc.InnerHtml= objDataSet.Tables[0].Rows[0]["TourInfo"].ToString();
                    lblPrice.Text= "₹ "+ objDataSet.Tables[0].Rows[0]["Price"].ToString();
                    lbltripdays.Text = objDataSet.Tables[0].Rows[0]["Days"].ToString();
                    lbldifficulty.Text = objDataSet.Tables[0].Rows[0]["Difficulty"].ToString();
                    lblTransaportation.Text = objDataSet.Tables[0].Rows[0]["Transpotation"].ToString();
                    lblcost.Text = objDataSet.Tables[0].Rows[0]["Price"].ToString();
                }
                if (objDataSet.Tables[1].Rows.Count > 0)
                {
                    try
                    {
                        DataTable dtInclude = objDataSet.Tables[1].Select("IncluExcluType=1").CopyToDataTable();
                        rptPkgInclude.DataSource = dtInclude;
                        rptPkgInclude.DataBind();

                        DataTable dtExclude = objDataSet.Tables[1].Select("IncluExcluType=0").CopyToDataTable();
                        rptExclude.DataSource = dtExclude;
                        rptExclude.DataBind();
                    }
                    catch (Exception)
                    {
                    }
                   

                }
                if (objDataSet.Tables[2].Rows.Count > 0)
                {
                    rptIternary.DataSource = objDataSet.Tables[2];
                    rptIternary.DataBind();
                }
                if (objDataSet.Tables[3].Rows.Count > 0)
                {
                    rptImages.DataSource = objDataSet.Tables[3];
                    rptImages.DataBind();

                }

                BLLReviews objBLLReviews = new BLLReviews();
                objBLLReviews.Sptype = 6;
                objBLLReviews.TourDetailsID = TripID;
                DataSet objDataSetReview = objBLLReviews.ExecuteDataSet(objBLLReviews);
                rptReviews.DataSource = objDataSetReview;
                rptReviews.DataBind();

            }
            catch (Exception)
            {

                throw;
            }
        }

        void BindSimilarTrips()
        {
            try
            {
                BLLTourDetailsData objBLLTourDetailsData = new BLLTourDetailsData() { Sptype = 4,TourDetailsID=TripID };
                DataSet objDataSet = objBLLTourDetailsData.ExecuteDataSet(objBLLTourDetailsData);
                rptTours.DataSource = objDataSet;
                rptTours.DataBind();



            }
            catch (Exception ex)
            {

                throw;
            }
        }
        protected void btnnSaveComment_Click(object sender, EventArgs e)
        {
            try
            {
                 
                BLLReviews objBLLReviews = new BLLReviews();
                objBLLReviews.Sptype = 2;
                objBLLReviews.Rating = Rating1.CurrentRating;
                objBLLReviews.Name = txtFullName.Text.Trim();
                objBLLReviews.Email = txtEmailAddress.Text.Trim();
                objBLLReviews.TourDetailsID = TripID;
                objBLLReviews.ReviewInfo = txtCommentField.Text.Trim();
                int reponse = objBLLReviews.ExecuteNonQuery(objBLLReviews);
                if (reponse == -200)
                {
                    CommonFunction.Message(divMsg, lblMessage, "Review Submitted to approved by admin. ", 2);
                    txtFullName.Text = "";
                    txtEmailAddress.Text = "";
                    txtCommentField.Text = "";
                }

            }
            catch (Exception)
            {


            }
        }
        public string StarsCountString(int Count)
        {
            StringBuilder objStringBuilder = new StringBuilder();

            for (int i=1; i<=5;i++)
            {
                if(Count>=i)
                {
                    objStringBuilder.Append("<span class=\"icon-star\"></span>");
                }
                else
                {
                    objStringBuilder.Append("<span class=\"icon-star-empty\"></span>");

                }
            }
            return objStringBuilder.ToString().Trim();
        }

    }
}