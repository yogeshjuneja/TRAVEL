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
    public class BLLTravel : BLLCommon
    {

        public int TourID { get; set; }
        public int TourPlace { get; set; }
       

        public DataSet ExecuteDataSet(BLLTravel objBLLTravel)
        {
            using (SqlConnection _connection = new SqlConnection(Connection.TRAVELCONN))
            {
                SqlParameter[] _params = new SqlParameter[]
                {
                    new SqlParameter("@Sptype",objBLLTravel.Sptype),
                    new SqlParameter("@TourID",objBLLTravel.TourID),
                    new SqlParameter("@TourPlace",objBLLTravel.TourPlace),
                    new SqlParameter("@Active",objBLLTravel.Active),
                    new SqlParameter("@Createddate",objBLLTravel.Createddate),
                    new SqlParameter("@Updateddate",objBLLTravel.Updateddate),
                    new SqlParameter("@IPaddress",base.IPaddress)
                };
                return SqlHelper.ExecuteDataset(_connection, CommandType.StoredProcedure, "sp_Tour", _params);
            }
        }
    }
}
