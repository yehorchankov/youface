using System;
using System.Linq;
using System.Net;
using System.Web.Security;
using AccountsRepository;
using HW_3.Models;

namespace HW_3.NativePages
{
    public partial class SearchForPeople : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.IsAuthenticated)
            {
                FormsAuthentication.RedirectToLoginPage();
                return;
            }

            Repository repository = null;
            if (Application["repository"] != null)
                repository = (Repository)Application["repository"];
            var id = repository.GetAccountId(User.Identity.Name);
            linkToHome.PostBackUrl = "Page.aspx?id=" + id;

            if (!IsPostBack)
            {
                RepeaterPeople.DataSource = repository.GetAccounts();
                RepeaterPeople.DataBind();
            }
        }

        protected void Find_Click(object sender, EventArgs e)
        {
            string template = InputData.Text.ToLower();
            Repository repository = null;
            if (Application["repository"] != null)
                repository = (Repository)Application["repository"];
            var foundedAccounts 
                = repository.GetAccounts()
                .Where(account => account.FirstName.ToLower().Contains(template) 
                    || account.LastName.ToLower().Contains(template) 
                    || account.RegistrationInfo.NickName.ToLower().Contains(template))
                .ToList();

            if (foundedAccounts.Count > 0)
                RepeaterPeople.DataSource = foundedAccounts;
            else
                LblResultsFound.Text = "No users with such name :(";
            RepeaterPeople.DataBind();
        }
    }
}