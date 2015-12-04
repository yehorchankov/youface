using System;
using System.Web.Security;
using AccountsRepository;
using HW_3.Models;

namespace HW_3.Handlers
{
    public partial class AddFriend : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.IsAuthenticated)
            {
                FormsAuthentication.RedirectToLoginPage();
                return;
            }

            var friendId = Request.QueryString["friend"];
            
            Repository repository = (Repository) Application["repository"];
            var id = repository.GetAccountId(User.Identity.Name);

            if (string.Equals(id.ToString(), friendId))
                Response.Redirect("SearchForPeople.aspx", true);
            
            Account user = repository.GetAccount(id);
            string friend = repository.GetAccountNickname(Guid.Parse(friendId));
            repository.AddNewFriend(friend, user);
            Application["repository"] = repository;
            Response.Redirect("SearchForPeople.aspx", true);
        }
    }
}