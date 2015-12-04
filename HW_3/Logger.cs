using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace HW_3
{
    public class Logger
    {
        private StreamWriter _streamWriter;
        public void LogEnter(DateTime timeRequest, string browserAgent, string clientIp, string userName)
        {
            
        }

        public void Flush()
        {
            _streamWriter.Close();
        }
    }
}