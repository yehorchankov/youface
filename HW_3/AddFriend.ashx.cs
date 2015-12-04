using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using AccountsRepository;

namespace HW_3
{
    /// <summary>
    /// Сводное описание для AddFriend
    /// </summary>
    public class AddFriend : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            if (!context.Request.IsAuthenticated)
            {
                FormsAuthentication.RedirectToLoginPage();
                return;
            }

            var friendId = context.Request.QueryString["friend"];

            Repository repository = (Repository) context.Application["repository"];
            var id = repository.GetAccountId(context.User.Identity.Name);

            if (string.Equals(id.ToString(), friendId))
                context.Response.Redirect("SearchForPeople.aspx", true);

            Account user = repository.GetAccount(id);
            string friend = repository.GetAccountNickname(Guid.Parse(friendId));
            repository.AddNewFriend(friend, user);
            context.Application["repository"] = repository;
            context.Response.Redirect("SearchForPeople.aspx", true);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}