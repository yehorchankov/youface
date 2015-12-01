using System;
using AccountsRepository;
using HW_3.Models;

namespace HW_3.NativePages
{
    public partial class FriendsToConfirm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var id = Request.Cookies["id"];
            var hash = Request.Cookies["hash"];

            if (!AuthorizationManager.IsAuthorizedAccount(id, hash)
                || id == null || hash == null)
                Response.Redirect("Default.aspx", true);

            linkToHome.PostBackUrl = "Page.aspx?id=" + id.Value;

            Repository repository = null;
            if (Application["repository"] != null)
                repository = (Repository) Application["repository"];

            Account account = repository.GetAccount(Guid.Parse(id.Value));
            RepeaterFriends.DataSource = account.GetUnconfirmedAccounts();
            RepeaterFriends.DataBind();
        }
    }
}