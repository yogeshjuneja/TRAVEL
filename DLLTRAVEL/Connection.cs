﻿using System;
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
                return ConfigurationSettings.AppSettings["TRAVElDB"].ToString();
            }
        }
    }   
}
