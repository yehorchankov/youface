using System;
using System.Web.Security;
using AccountsRepository;
using HW_3.Models;

namespace HW_3.NativePages
{
    public partial class FriendsToConfirm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.IsAuthenticated)
            {
                FormsAuthentication.RedirectToLoginPage();
                return;
            }
            
            Repository repository = (Repository) Application["repository"];
            var id = repository.GetAccountId(User.Identity.Name);

            Account account = repository.GetAccount(id);
            RepeaterFriends.DataSource = account.GetUnconfirmedAccounts();
            RepeaterFriends.DataBind();

            linkToHome.PostBackUrl = "Page.aspx?id=" + id;
        }
    }
}