using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mime;
using System.Web;
using System.Web.Security;
using AccountsRepository;
using HW_3.Models;

namespace HW_3
{
    /// <summary>
    /// Сводное описание для LikePost
    /// </summary>
    public class LikePost : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            if (!context.Request.IsAuthenticated)
            {
                FormsAuthentication.RedirectToLoginPage();
                return;
            }

            
            var postId = context.Request.QueryString["post"];
            var previousPageId = context.Request.QueryString["id"];
            
            try
            {
                var repository = (Repository) context.Application["repository"];
                string nickName = context.User.Identity.Name;

                Account account = repository.GetAccount(Guid.Parse(previousPageId));
                foreach (Post p in account.Posts.Where(p => string.Equals(p.PostId.ToString(), postId)))
                {
                    p.LikeOrDislikePost(nickName);
                    break;
                }

                account.Posts.Reverse();
                context.Application["repository"] = repository;
                context.Response.Redirect("Page.aspx?id=" + previousPageId, true);
                return;
            }
            catch (Exception) { }
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