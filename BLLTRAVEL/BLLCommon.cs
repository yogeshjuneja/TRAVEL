using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace BLLTRAVEL
{
    public class BLLCommon
    {
        public int Sptype { get; set; }
        public string Createddate { get; set; }
        public string Updateddate { get; set; }
        public string IPaddress
        {
            get
            {
                return HttpContext.Current.Request.UserHostAddress;
            }
        }
        public int Active { get; set; }
    }
}
