using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DLLTRAVEL;

namespace BLLTRAVEL
{
    public class BLLAdminLogin
    {
        public string AID { get; set; }
        public string NAME { get; set; }
        public string EMAIL { get; set; }
        public string USERNAME { get; set; }
        public string Password { get; set; }

        public DataSet ExecuteDataSet(BLLAdminLogin objBLLTrip)
        {
            using (SqlConnection _connection = new SqlConnection(Connection.TRAVELCONN))
            {
                SqlParameter[] _params = new SqlParameter[]
                {
                    new SqlParameter("@NAME",objBLLTrip.NAME),
                    new SqlParameter("@EMAIL",objBLLTrip.EMAIL),
                    new SqlParameter("@USERNAME",objBLLTrip.USERNAME),
                    new SqlParameter("@Password",objBLLTrip.Password),
                };
                return SqlHelper.ExecuteDataset(_connection, CommandType.StoredProcedure, "SP_AdminLogin", _params);
            }
        }

    }
}
