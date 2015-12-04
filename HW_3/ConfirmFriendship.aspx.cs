using System;
using System.Web.Security;
using AccountsRepository;
using HW_3.Models;

namespace HW_3.Handlers
{
    public partial class ConfirmFriendship : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.IsAuthenticated)
            {
                FormsAuthentication.RedirectToLoginPage();
                return;
            }

            Repository repository = (Repository)Application["repository"];

            string friendId = Request.QueryString["friend"];
            string userNick = User.Identity.Name;
            var id = repository.GetAccountId(userNick);

            string friend = repository.GetAccountNickname(Guid.Parse(friendId));
            repository.ConfirmFriendship(userNick, friend);
            Application["repository"] = repository;

            Response.Redirect("Friends.aspx?id=" + id);
        }
    }
}