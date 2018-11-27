﻿using DLLTRAVEL;
using System;
using System.Data;
using System.Data.SqlClient;

namespace BLLTRAVEL
{
    public class BLLReviews : BLLCommon
    {
        public float Rating { get; set; }
        public int ReviewID { get; set; }
        public int EnumIsApproved { get; set; }
        public string ReviewInfo { get; set; }
        public int TourDetailsID { get; set; }
        public int IsActive { get; set; }
        public string Name { get; set; }
         public string Email { get; set; }
        



        public DataSet ExecuteDataSet(BLLReviews objBLLReviews)
        {
            using (SqlConnection _connection = new SqlConnection(Connection.TRAVELCONN))
            {
                SqlParameter[] _params = new SqlParameter[]
                {
                    new SqlParameter("@Sptype",objBLLReviews.Sptype),
                     new SqlParameter("@ReviewID",objBLLReviews.ReviewID),
                    new SqlParameter("@EnumIsApproved",objBLLReviews.EnumIsApproved),
                    new SqlParameter("@ReviewInfo",objBLLReviews.ReviewInfo),
                    new SqlParameter("@TourDetailsID",objBLLReviews.TourDetailsID),
                    new SqlParameter("@IsActive",objBLLReviews.IsActive),
                    new SqlParameter("@Name",objBLLReviews.Name),
                    new SqlParameter("@Email",objBLLReviews.Email),
                    new SqlParameter("@Rating",objBLLReviews.Rating),
                     new SqlParameter("@Createddate",objBLLReviews.Createddate),
                       new SqlParameter("@IPaddress",objBLLReviews.IPaddress)
                };
                return SqlHelper.ExecuteDataset(_connection, CommandType.StoredProcedure, "sp_Reviews", _params);
            }
        }


        public Int32 ExecuteNonQuery(BLLReviews objBLLReviews)
        {
            using (SqlConnection _connection = new SqlConnection(Connection.TRAVELCONN))
            {
                SqlParameter[] _params = new SqlParameter[]
                {
                   new SqlParameter("@Sptype",objBLLReviews.Sptype),
                   new SqlParameter("@ReviewID",objBLLReviews.ReviewID),
                    new SqlParameter("@EnumIsApproved",objBLLReviews.EnumIsApproved),
                    new SqlParameter("@ReviewInfo",objBLLReviews.ReviewInfo),
                    new SqlParameter("@TourDetailsID",objBLLReviews.TourDetailsID),
                    new SqlParameter("@IsActive",objBLLReviews.IsActive),
                    new SqlParameter("@Name",objBLLReviews.Name),
                    new SqlParameter("@Email",objBLLReviews.Email),
                    new SqlParameter("@Rating",objBLLReviews.Rating),

                     new SqlParameter("@Createddate",objBLLReviews.Createddate),
                       new SqlParameter("@IPaddress",objBLLReviews.IPaddress)
                };
                return Convert.ToInt32(SqlHelper.ExecuteScalar(_connection, CommandType.StoredProcedure, "sp_Reviews", _params));
            }
        }

    }
}