using BLLTRAVEL;
using System;
using System.Data;

namespace TRAVEL.Admin
{
    public partial class Login : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            if (SessionManager.Admin != null)
            {
                Response.Redirect("AddTourDetails.aspx");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                BLLAdminLogin objBLLAdminLogin = new BLLAdminLogin();
                objBLLAdminLogin.USERNAME = txtUserName.Text.Trim();
                objBLLAdminLogin.Password = txtPassword.Text.Trim();
                DataSet objDataSet = objBLLAdminLogin.ExecuteDataSet(objBLLAdminLogin);
                if (objDataSet.Tables[0].Rows.Count > 0)
                {
                    objBLLAdminLogin = new BLLAdminLogin() { NAME = objDataSet.Tables[0].Rows[0]["Name"].ToString(), AID = objDataSet.Tables[0].Rows[0][0].ToString() };
                    SessionManager.Admin = objBLLAdminLogin;
                    Response.Redirect("AddTourDetails.aspx");
                }
                else
                {
                    msg.Attributes.Remove("class");
                    msg.Attributes.Add("class", "errorHandler alert alert-danger");
                    lblMsg.Text = "Incorrect Username or Password. Please try again";
                }

            }
            catch (Exception)
            {

                throw;
            }
        }

    }
}