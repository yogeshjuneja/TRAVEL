using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLLTRAVEL;
namespace TRAVEL.Admin
{
    public partial class PackageMaster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                BLLM_PackageDetails objBLLM_PackageDetails = new BLLM_PackageDetails() { Sptype = 2 };
                objBLLM_PackageDetails.PackageName = txtPackage.Text.Trim();
                int response = objBLLM_PackageDetails.ExecuteNonQuery(objBLLM_PackageDetails);
                    if (response == -200)
                {
                    CommonFunction.Message(divMsg, lblMessage, "Data Saved successfully", 1);
                    txtPackage.Text = "";

                }


            }
            catch (Exception ex)
            {

                throw;
            }
        }
    }
}