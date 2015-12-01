using System;
using AccountsRepository;
using HW_3.Models;

namespace HW_3.NativePages
{
    public partial class Friends : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var id = Request.Cookies["id"];
            var hash = Request.Cookies["hash"];
            var requestedPageId = Request.QueryString["id"];

            if (!AuthorizationManager.IsAuthorizedAccount(id, hash))
                Response.Redirect("LogIn.aspx", true);

            linkToHome.PostBackUrl = "Page.aspx?id=" + id.Value;
            MyFriends.PostBackUrl = "Friends.aspx?id=" + id.Value;

            Repository repository = null;
            if (Application["repository"] != null)
                repository = (Repository) Application["repository"];

            Account account = repository.GetAccount(Guid.Parse(requestedPageId));
            RepeaterFriends.DataSource = account.Friends;
            RepeaterFriends.DataBind();
        }
    }
}