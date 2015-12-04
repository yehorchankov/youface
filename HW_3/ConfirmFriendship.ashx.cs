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
    public class ConfirmFriendship : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            if (!context.Request.IsAuthenticated)
            {
                FormsAuthentication.RedirectToLoginPage();
                return;
            }

            Repository repository = (Repository) context.Application["repository"];

            bool accept = Convert.ToBoolean(context.Request.QueryString["acc"]);
            string friendId = context.Request.QueryString["friend"];
            string userNick = context.User.Identity.Name;
            var id = repository.GetAccountId(userNick);
            string friend = repository.GetAccountNickname(Guid.Parse(friendId));

            if (accept)
                repository.ConfirmFriendship(userNick, friend);
            else
                repository.DeclineFriendship(userNick, friend);

            context.Application["repository"] = repository;

            context.Response.Redirect("Friends.aspx?id=" + id);
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