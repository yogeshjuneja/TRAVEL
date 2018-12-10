using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using BLLTRAVEL;
using TRAVEL.API.Model;

namespace TRAVEL.API
{
    public class TripController : ApiController
    {

        public IHttpActionResult GetTrips()
        {
            TripModel objTripModel = new TripModel();
            Base objBase = new Base();
            try
            {
                BLLTourDetailsData objBLLTourDetailsData = new BLLTourDetailsData() { Sptype = 8 };
                objBLLTourDetailsData.StartPrice = 0;
                objBLLTourDetailsData.ENDPrice = 500000;
                objBLLTourDetailsData.Difficulty = 0;
                objBLLTourDetailsData.CATEGORY = "";
                DataSet objDataSet = objBLLTourDetailsData.ExecuteDataSet(objBLLTourDetailsData);
               
                if(objDataSet.Tables[0].Rows.Count>0)
                {
                    List<Tour> lstTour = new List<Tour>();
                    objBase.info = "Tour";
                    objBase.Message = "success";
                    foreach (DataRow Dr in objDataSet.Tables[0].Rows)
                    {
                        Tour objTour = new Tour();
                        objTour.TourDetailsID= Dr["TourDetailsID"].ToString();
                        objTour.TourInfo = Dr["TourInfo"].ToString();
                        objTour.Place = Dr["Place"].ToString();
                        objTour.Days = Dr["Days"].ToString();
                        objTour.Nights = Dr["Nights"].ToString();
                        objTour.Discount = Dr["Discount"].ToString();
                        objTour.IsActive = Dr["IsActive"].ToString();
                        objTour.TripTypeID = Dr["TripTypeID"].ToString();
                        objTour.TourID = Dr["TourID"].ToString();
                        objTour.Price = Dr["Price"].ToString();
                        objTour.Transpotation = Dr["Transpotation"].ToString();
                        objTour.TourPlace = Dr["TourPlace"].ToString();
                        objTour.ShortDesc = Dr["ShortDesc"].ToString();
                        objTour.ImagePath = Dr["ImagePath"].ToString();
                        objTour.TripName = Dr["TripName"].ToString();
                        lstTour.Add(objTour);


                    }
                  
                    objTripModel.TourData = lstTour;
                }

                else
                {
                    objBase.info = "Tour";
                    objBase.Message = "No record found";
                }
              
                 

            }
            catch (Exception ex)
            {

                objBase.info = "fail";
                objBase.Message =ex.ToString();
            }
            objTripModel.Root = objBase;
            return Content(HttpStatusCode.OK, objTripModel);
        }
    }
}
