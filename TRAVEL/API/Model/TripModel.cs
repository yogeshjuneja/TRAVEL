using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TRAVEL.API.Model
{


    public class TripInputModel
    {
        public string tourinfo { get; set; }
        public int startprice { get; set; }
        public int endprice { get; set; }
        public int difficulty { get; set; }
        public string category { get; set; }
        public int days { get; set; }
        public int nights { get; set; }
    }

    public class TripModel
    {
        public Base Root { get; set; }
        public List<Tour> TourData { get; set; }
    }

    public class Base
    {
        public string info { get; set; }
        public string Message { get; set; }
    }

   public class Tour
    {
        public string TourDetailsID { get; set; }
        public string TourInfo { get; set; }
        public string Place { get; set; }
        public string Days { get; set; }
        public string Nights { get; set; }
        public string Discount { get; set; }
        public string IsActive { get; set; }
        public string TripTypeID { get; set; }
        public string TourID { get; set; }
        public string Price { get; set; }
        public string Transpotation { get; set; }
        public string TourPlace { get; set; }
        public string ShortDesc { get; set; }
        public string ImagePath { get; set; }
        public string TripName { get; set; }
    }
}