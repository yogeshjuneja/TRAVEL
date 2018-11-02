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
    public class BLLM_PackageDetails : BLLCommon
    {
        public int ID { get; set; }
        public string PackageName { get; set; }


        public DataSet ExecuteDataSet(BLLM_PackageDetails objBLLTrip)
        {
            using (SqlConnection _connection = new SqlConnection(Connection.TRAVELCONN))
            {
                SqlParameter[] _params = new SqlParameter[]
                {
                    new SqlParameter("@Sptype",objBLLTrip.Sptype),
                    new SqlParameter("@ID",objBLLTrip.ID),
                    new SqlParameter("@PackageName",objBLLTrip.PackageName),
                    new SqlParameter("@Active",objBLLTrip.Active),
                    new SqlParameter("@Createddate",objBLLTrip.Createddate),
                    new SqlParameter("@Updateddate",objBLLTrip.Updateddate),
                    new SqlParameter("@IPaddress",base.IPaddress)
                };
                return SqlHelper.ExecuteDataset(_connection, CommandType.StoredProcedure, "sp_M_PackageDetails", _params);
            }
        }
        public Int32 ExecuteNonQuery(BLLM_PackageDetails objBLLTrip)
        {
            using (SqlConnection _connection = new SqlConnection(Connection.TRAVELCONN))
            {
                SqlParameter[] _params = new SqlParameter[]
                {
                    new SqlParameter("@Sptype",objBLLTrip.Sptype),
                    new SqlParameter("@ID",objBLLTrip.ID),
                    new SqlParameter("@PackageName",objBLLTrip.PackageName),
                    new SqlParameter("@Active",objBLLTrip.Active),
                    new SqlParameter("@Createddate",objBLLTrip.Createddate),
                    new SqlParameter("@Updateddate",objBLLTrip.Updateddate),
                    new SqlParameter("@IPaddress",base.IPaddress)
                };
                return Convert.ToInt32(SqlHelper.ExecuteScalar(_connection, CommandType.StoredProcedure, "sp_M_PackageDetails", _params));
            }
        }
    }
}
