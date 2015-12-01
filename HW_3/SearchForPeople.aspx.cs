using System;
using System.Linq;
using AccountsRepository;
using HW_3.Models;

namespace HW_3.NativePages
{
    public partial class SearchForPeople : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var id = Request.Cookies["id"];
            var hash = Request.Cookies["hash"];

            if (!AuthorizationManager.IsAuthorizedAccount(id, hash))
                Response.Redirect("Default.aspx", true);
            
            linkToHome.PostBackUrl = "Page.aspx?id=" + id.Value;

            if (!IsPostBack)
            {
                Repository repository = null;
                if (Application["repository"] != null)
                    repository = (Repository) Application["repository"];
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

            RepeaterPeople.DataSource = foundedAccounts;
            RepeaterPeople.DataBind();
        }
    }
}