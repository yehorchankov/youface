using System;
using System.Web.Security;
using AccountsRepository;
using HW_3.Models;

namespace HW_3.NativePages
{
    public partial class Friends : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.IsAuthenticated)
            {
                FormsAuthentication.RedirectToLoginPage();
                return;
            }
            
            var requestedPageId = Request.QueryString["id"];
            Repository repository = (Repository) Application["repository"];
            var id = repository.GetAccountId(User.Identity.Name);
            
            Account account = repository.GetAccount(Guid.Parse(requestedPageId));
            RepeaterFriends.DataSource = account.Friends;
            RepeaterFriends.DataBind();

            linkToHome.PostBackUrl = "Page.aspx?id=" + id;
            MyFriends.PostBackUrl = "Friends.aspx?id=" + id;

        }
    }
}