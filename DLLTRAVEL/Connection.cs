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
                return "Server=shapodb.database.windows.net;uid=shapodb;pwd=$hapo@9811;Initial Catalog=ShapoDb;Integrated Security=False";
            }
        }
    }   
}
