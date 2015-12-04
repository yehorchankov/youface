using System;
using System.Web.Security;
using AccountsRepository;
using HW_3.Models;

namespace HW_3.Authorization
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Application["repository"] == null) return;
            if (Request.IsAuthenticated)
            {
                var repository = (Repository)Application["repository"];

                Guid accountId = repository.GetAccountId(User.Identity.Name);

                Response.Redirect("Page.aspx?id=" + accountId);
            }
        }
    }
}