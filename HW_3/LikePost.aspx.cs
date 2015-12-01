using System;
using System.Linq;
using AccountsRepository;
using HW_3.Models;

namespace HW_3.Handlers
{
    public partial class LikePost : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var id = Request.Cookies["id"];
            var hash = Request.Cookies["hash"];
            var postId = Request.QueryString["post"];
            var previousPageId = Request.QueryString["id"];

            if (!AuthorizationManager.IsAuthorizedAccount(id, hash) 
                || id == null || hash == null)
                Response.Redirect("Default.aspx", true);
            try
            {
                if (Application["repository"] != null)
                {
                    var repository = (Repository) Application["repository"];
                    Account account = repository.GetAccount(Guid.Parse(previousPageId));
                    string nickName = repository.GetAccountNickname(Guid.Parse(id.Value));
                    foreach (Post p in account.Posts.Where(p => string.Equals(p.PostId.ToString(), postId)))
                    {
                        p.LikeOrDislikePost(nickName);
                        break;
                    }
                    account.Posts.Reverse();
                    Application["repository"] = repository;
                    Response.Redirect("Page.aspx?id=" + previousPageId, true);
                }
                else
                    Response.Redirect("Default.aspx", true);
            }
            catch (Exception exception)
            {
            }
        }
    }
}