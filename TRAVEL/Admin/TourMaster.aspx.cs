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
    public partial class TourMaster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

            }
            catch (Exception ex)
            {
                throw;
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                BLLTourMaster objBLLTourMaster = new BLLTourMaster();
                objBLLTourMaster.Sptype = 1;
                objBLLTourMaster.TourPlace = txtTourPlace.Text.Trim();
                if (fupDisplayImage.HasFile)
                {
                    string filename = System.DateTime.Now.Ticks + "_" + fupDisplayImage.FileName;
                    fupDisplayImage.SaveAs(Server.MapPath("~/Upload") + "/" + filename);
                    objBLLTourMaster.ImagePath = filename;
                }
                DataTable dt = new DataTable();
                dt.Columns.Add("IMAGENAME", typeof(string));
                DataRow Dr;
                foreach (HttpPostedFile uploadfile in fuplImages.PostedFiles)
                {
                    string filename = System.DateTime.Now.Ticks + "_" + uploadfile.FileName;
                    uploadfile.SaveAs(Server.MapPath("~/Upload") + "/" + filename);
                    Dr = dt.NewRow();
                    Dr["IMAGENAME"] = filename;
                    dt.Rows.Add(Dr);
                }
                objBLLTourMaster.dtTourImages = dt;
                int reponse = objBLLTourMaster.ExecuteNonQuery(objBLLTourMaster);
                if (reponse == -200)
                {
                    CommonFunction.Message(divMsg, lblMessage, "Data Saved successfully", 1);
                }
                else
                {
                    CommonFunction.Message(divMsg, lblMessage, "Unable to Save data", 2);
                }

            }
            catch (Exception ex)
            {
                CommonFunction.Message(divMsg, lblMessage, ex.ToString(), 2);
            }
        }
    }
}