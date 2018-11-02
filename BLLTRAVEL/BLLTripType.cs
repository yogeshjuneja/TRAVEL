using DLLTRAVEL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLLTRAVEL
{
   public class BLLTripType : BLLCommon
    {
        public int TripTypeID { get; set; }
        public string TripName { get; set; }


        public DataSet ExecuteDataSet(BLLTripType objBLLTripType)
        {
            using (SqlConnection _connection = new SqlConnection(Connection.TRAVELCONN))
            {
                SqlParameter[] _params = new SqlParameter[]
                {
                    new SqlParameter("@Sptype",objBLLTripType.Sptype),
                    new SqlParameter("@TripTypeID",objBLLTripType.TripTypeID),
                    new SqlParameter("@TripName",objBLLTripType.TripName),
                    new SqlParameter("@IPaddress",base.IPaddress)


                };
                return SqlHelper.ExecuteDataset(_connection, CommandType.StoredProcedure, "sp_TripType", _params);
            }
        }


        public Int32 ExecuteNonQuery(BLLTripType objBLLTripType)
        {
            using (SqlConnection _connection = new SqlConnection(Connection.TRAVELCONN))
            {
                SqlParameter[] _params = new SqlParameter[]
                {
                   new SqlParameter("@Sptype",objBLLTripType.Sptype),
                    new SqlParameter("@TripTypeID",objBLLTripType.TripTypeID),
                    new SqlParameter("@TripName",objBLLTripType.TripName),
                    new SqlParameter("@IPaddress",base.IPaddress)
                };

                return Convert.ToInt32(SqlHelper.ExecuteScalar(_connection, CommandType.StoredProcedure, "sp_TripType", _params));
            }
        }
    }
}
