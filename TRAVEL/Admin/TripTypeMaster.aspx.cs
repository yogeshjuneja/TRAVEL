using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLLTRAVEL;

namespace TRAVEL.Admin
{
    public partial class TripTypeMaster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                BLLTripType objBLLTripType = new BLLTripType();
                objBLLTripType.Sptype = 1;
                objBLLTripType.TripName = txtTripType.Text;
                int response = objBLLTripType.ExecuteNonQuery(objBLLTripType);
                if(response==-200)
                {
                    CommonFunction.Message(divMsg, lblMessage, "Data Saved successfully", 1);
                }

            }
            catch (Exception ex)
            {

                throw;
            }
        }
    }
}