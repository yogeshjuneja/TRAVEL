using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DLLTRAVEL;
using System.Data.SqlClient;
using System.Data;

namespace BLLTRAVEL
{
   public class BLLTrip : BLLCommon
    {
        public int TripTypeID { get; set; }
        public int TripName { get; set; }
       

        public DataSet ExecuteDataSet(BLLTrip objBLLTrip)
        {
            using (SqlConnection _connection = new SqlConnection(Connection.TRAVELCONN))
            {
                SqlParameter[] _params = new SqlParameter[]
                {
                    new SqlParameter("@Sptype",objBLLTrip.Sptype),
                    new SqlParameter("@TripTypeID",objBLLTrip.TripTypeID),
                    new SqlParameter("@TripName",objBLLTrip.TripName),
                    new SqlParameter("@Active",objBLLTrip.Active),
                    new SqlParameter("@Createddate",objBLLTrip.Createddate),
                    new SqlParameter("@Updateddate",objBLLTrip.Updateddate),
                    new SqlParameter("@IPaddress",base.IPaddress)
                };
                return SqlHelper.ExecuteDataset(_connection, CommandType.StoredProcedure, "sp_Trip", _params);
            }
        }
    }
}
