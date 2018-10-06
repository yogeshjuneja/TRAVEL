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
    public class BLLTourDetailsData : BLLCommon
    {
        public int TourDetailsID { get; set; }
        public int TourInfo { get; set; }
        public int Place { get; set; }
        public int Days { get; set; }
        public int Nights { get; set; }
        public int Discount { get; set; }
        public int Rating { get; set; }
        public int TripTypeID { get; set; }
        public int TourID { get; set; }
        public DataTable dtPackageDetails { get; set; }
        public DataTable dtIternaryDetail { get; set; }


        public DataSet ExecuteDataSet(BLLTourDetailsData objBLLTourDetailsData)
        {
            using (SqlConnection _connection = new SqlConnection(Connection.TRAVELCONN))
            {
                SqlParameter[] _params = new SqlParameter[]
                {
                    new SqlParameter("@Sptype",objBLLTourDetailsData.Sptype),

                    new SqlParameter("@TourDetailsID",objBLLTourDetailsData.TourID),
                    new SqlParameter("@TourInfo",objBLLTourDetailsData.TourInfo),
                     new SqlParameter("@Place",objBLLTourDetailsData.Place),
                    new SqlParameter("@Days",objBLLTourDetailsData.Days),
                     new SqlParameter("@Nights",objBLLTourDetailsData.Nights),
                    new SqlParameter("@Discount",objBLLTourDetailsData.Discount),
                     new SqlParameter("@Rating",objBLLTourDetailsData.Rating),
                    new SqlParameter("@TripTypeID",objBLLTourDetailsData.TripTypeID),
                      new SqlParameter("@TourID",objBLLTourDetailsData.TourID),
                        new SqlParameter("@dtPackageDetails",objBLLTourDetailsData.dtPackageDetails),
                          new SqlParameter("@dtIternaryDetail",objBLLTourDetailsData.dtIternaryDetail),
                    new SqlParameter("@IsActive",objBLLTourDetailsData.Active),
                    new SqlParameter("@Createddate",objBLLTourDetailsData.Createddate),
                    new SqlParameter("@Updateddate",objBLLTourDetailsData.Updateddate),
                    new SqlParameter("@IPaddress",base.IPaddress)
                };
                return SqlHelper.ExecuteDataset(_connection, CommandType.StoredProcedure, "sp_TourDetailsData", _params);
            }
        }



        public Int32 ExecuteNonQuery(BLLTourDetailsData objBLLTourDetailsData)
        {
            using (SqlConnection _connection = new SqlConnection(Connection.TRAVELCONN))
            {
                SqlParameter[] _params = new SqlParameter[]
                {
                    new SqlParameter("@Sptype",objBLLTourDetailsData.Sptype),
                    new SqlParameter("@TourDetailsID",objBLLTourDetailsData.TourID),
                    new SqlParameter("@TourInfo",objBLLTourDetailsData.TourInfo),
                     new SqlParameter("@Place",objBLLTourDetailsData.Place),
                    new SqlParameter("@Days",objBLLTourDetailsData.Days),
                     new SqlParameter("@Nights",objBLLTourDetailsData.Nights),
                    new SqlParameter("@Discount",objBLLTourDetailsData.Discount),
                     new SqlParameter("@Rating",objBLLTourDetailsData.Rating),
                    new SqlParameter("@TripTypeID",objBLLTourDetailsData.TripTypeID),
                      new SqlParameter("@TourID",objBLLTourDetailsData.TourID),
                      new SqlParameter("@dtPackageDetails",objBLLTourDetailsData.dtPackageDetails),
                      new SqlParameter("@dtIternaryDetail",objBLLTourDetailsData.dtIternaryDetail),
                    new SqlParameter("@IsActive",objBLLTourDetailsData.Active),
                    new SqlParameter("@Createddate",objBLLTourDetailsData.Createddate),
                    new SqlParameter("@Updateddate",objBLLTourDetailsData.Updateddate),
                    new SqlParameter("@IPaddress",base.IPaddress)
                };
                return Convert.ToInt32(SqlHelper.ExecuteScalar(_connection, CommandType.StoredProcedure, "sp_TourDetailsData", _params));
            }
        }




    }
}
