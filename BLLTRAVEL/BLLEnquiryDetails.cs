using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using DLLTRAVEL;

namespace BLLTRAVEL
{
  public   class BLLEnquiryDetails:BLLCommon
    {
       
        public int TourID { get; set; }
        public string Phone { get; set; }
        public string Name { get; set; }
        public int Number_of_Person { get; set; }
        public string DurationFrom { get; set; }
        public string DurationTo { get; set; }
        public string Email { get; set; }




        public DataSet ExecuteDataSet(BLLEnquiryDetails objBLLEnquiryDetails)
        {
            using (SqlConnection _connection = new SqlConnection(Connection.TRAVELCONN))
            {
                SqlParameter[] _params = new SqlParameter[]
                {
                    new SqlParameter("@Sptype",objBLLEnquiryDetails.Sptype),
                     new SqlParameter("@TourID",objBLLEnquiryDetails.TourID),
                    new SqlParameter("@Phone",objBLLEnquiryDetails.Phone),
                    new SqlParameter("@Name",objBLLEnquiryDetails.Name),
                    new SqlParameter("@Number_of_Person",objBLLEnquiryDetails.Number_of_Person),
                    new SqlParameter("@DurationFrom",objBLLEnquiryDetails.DurationFrom),
                    new SqlParameter("@DurationTo",objBLLEnquiryDetails.DurationTo),
                    new SqlParameter("@Email",objBLLEnquiryDetails.Email),
                   

                };
                return SqlHelper.ExecuteDataset(_connection, CommandType.StoredProcedure, "sp_Enquery", _params);
            }
        }


        public Int32 ExecuteNonQuery(BLLEnquiryDetails objBLLEnquiryDetails)
        {
            using (SqlConnection _connection = new SqlConnection(Connection.TRAVELCONN))
            {
                SqlParameter[] _params = new SqlParameter[]
                {
                  new SqlParameter("@Sptype",objBLLEnquiryDetails.Sptype),
                     new SqlParameter("@TourID",objBLLEnquiryDetails.TourID),
                    new SqlParameter("@Phone",objBLLEnquiryDetails.Phone),
                    new SqlParameter("@Name",objBLLEnquiryDetails.Name),
                    new SqlParameter("@Number_of_Person",objBLLEnquiryDetails.Number_of_Person),
                    new SqlParameter("@DurationFrom",objBLLEnquiryDetails.DurationFrom),
                    new SqlParameter("@DurationTo",objBLLEnquiryDetails.DurationTo),
                    new SqlParameter("@Email",objBLLEnquiryDetails.Email),
                };
                return Convert.ToInt32(SqlHelper.ExecuteScalar(_connection, CommandType.StoredProcedure, "sp_Enquery", _params));
            }
        }

    }
}
