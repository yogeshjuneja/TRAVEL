using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
namespace DLLTRAVEL
{
    public abstract class Connection
    {
        public static string TRAVELCONN
        {
            get
            {
                return "Server=5.196.175.110;uid=shapodb;pwd=Shapo@9811;Initial Catalog=shapoexpeditions;Integrated Security=False";
            }
        }
    }   
}
