using System;
using AccountsRepository;
using HW_3.Models;

namespace HW_3.Handlers
{
    public partial class AddFriend : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var id = Request.Cookies["id"];
            var hash = Request.Cookies["hash"];
            var friendId = Request.QueryString["friend"];

            if (!AuthorizationManager.IsAuthorizedAccount(id, hash)
                || id == null || hash == null)
                Response.Redirect("Default.aspx", true);

            if (string.Equals(id.Value, friendId))
                Response.Redirect("SearchForPeople.aspx", true);

            Repository repository = null;
            if (Application["repository"] != null)
                repository = (Repository) Application["repository"];

            Account user = repository.GetAccount(Guid.Parse(id.Value));
            string friend = repository.GetAccountNickname(Guid.Parse(friendId));
            repository.AddNewFriend(friend, user);
            Application["repository"] = repository;
            Response.Redirect("SearchForPeople.aspx", true);
        }
    }
}