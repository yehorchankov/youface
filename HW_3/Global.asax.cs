using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using HW_3.Models;

namespace HW_3
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_BeginRequest(Object sender, EventArgs e)
        {
            DateTime timeRequest = DateTime.Now;
            string clientIp = Request.UserHostAddress;
            string browserAgent = Request.UserAgent;
            var userName = !Request.IsAuthenticated ? "anonymous" : User.Identity.Name;

            using (StreamWriter streamWriter = new StreamWriter(Server.MapPath("/request.log"), true))
            {
                streamWriter.WriteLine(
                    string.Format("[{0}] from {1} {2} name: {3}", timeRequest.ToLongTimeString(), clientIp, browserAgent,
                        userName));
            }
        }

        protected void Application_Start(object sender, EventArgs e)
        {
        }

        protected void Application_End(Object sender, EventArgs e)
        {
        }
    }
}