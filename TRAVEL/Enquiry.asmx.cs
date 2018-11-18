using BLLTRAVEL;
using System.Web.Services;

namespace TRAVEL
{
    /// <summary>
    /// Summary description for Enquiry
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class Enquiry : System.Web.Services.WebService
    {

        [WebMethod]
        public string SaveEnquiry(string name, string email, string phone, string durationfrom, string duarationto, int noofperson, int TourID)
        {
            try
            {
                BLLEnquiryDetails objBLLEnquiryDetails = new BLLEnquiryDetails();
                objBLLEnquiryDetails.Sptype = 1;
                objBLLEnquiryDetails.TourID = TourID;
                objBLLEnquiryDetails.Name = name;
                objBLLEnquiryDetails.Email = email;
                objBLLEnquiryDetails.Phone = phone;
                objBLLEnquiryDetails.DurationFrom = durationfrom;
                objBLLEnquiryDetails.DurationTo = duarationto;
                objBLLEnquiryDetails.Number_of_Person = noofperson;
                int response = objBLLEnquiryDetails.ExecuteNonQuery(objBLLEnquiryDetails);
                if (response == -200)
                {
                    return "success";
                }
                else return "fail";
            }
            catch (System.Exception ex)
            {

                return "fail";
            }
        }
    }
}
