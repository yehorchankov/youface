using System;
using AccountsRepository;
using HW_3.Models;

namespace HW_3.Handlers
{
    public partial class ConfirmFriendship : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var id = Request.Cookies["id"];
            var hash = Request.Cookies["hash"];
            var friendId = Request.QueryString["friend"];

            if (!AuthorizationManager.IsAuthorizedAccount(id, hash)
                || id == null || hash == null)
                Response.Redirect("Default.aspx", true);

            Repository repository = null;
            if (Application["repository"] != null)
                repository = (Repository)Application["repository"];

            string friend = repository.GetAccountNickname(Guid.Parse(friendId));
            string user = repository.GetAccountNickname(Guid.Parse(id.Value));

            repository.ConfirmFriendship(user, friend);
            Application["repository"] = repository;
            Response.Redirect("Friends.aspx?id=" + id.Value);
        }
    }
}