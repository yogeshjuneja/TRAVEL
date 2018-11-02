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
    public class BLLTourMaster : BLLCommon
    {
        public int TourID { get; set; }
        public string ImagePath { get; set; }
        public string TourPlace { get; set; }
        public DataTable dtTourImages { get; set; }

        public DataSet ExecuteDataSet(BLLTourMaster objBLLTourMaster)
        {
            using (SqlConnection _connection = new SqlConnection(Connection.TRAVELCONN))
            {
                SqlParameter[] _params = new SqlParameter[]
                {
                    new SqlParameter("@Sptype",objBLLTourMaster.Sptype),
                    new SqlParameter("@TourID",objBLLTourMaster.TourID),
                    new SqlParameter("@TourPlace",objBLLTourMaster.TourPlace),
                    new SqlParameter("@ImagePath",objBLLTourMaster.ImagePath),
                    new SqlParameter("@IPaddress",base.IPaddress) 
                    

                };
                return SqlHelper.ExecuteDataset(_connection, CommandType.StoredProcedure, "sp_TourMaster", _params);
            }
        }


        public Int32 ExecuteNonQuery(BLLTourMaster objBLLTourMaster)
        {
            using (SqlConnection _connection = new SqlConnection(Connection.TRAVELCONN))
            {
                SqlParameter[] _params = new SqlParameter[]
                {
                   new SqlParameter("@Sptype",objBLLTourMaster.Sptype),
                    new SqlParameter("@TourID",objBLLTourMaster.TourID),
                    new SqlParameter("@TourPlace",objBLLTourMaster.TourPlace),
                    new SqlParameter("@ImagePath",objBLLTourMaster.ImagePath),
                    new SqlParameter("@IPaddress",base.IPaddress),
                    new SqlParameter("@dtTourImages",dtTourImages)
                };
                return  Convert.ToInt32(SqlHelper.ExecuteScalar(_connection, CommandType.StoredProcedure, "sp_TourMaster", _params));
            }
        }











    }
}
