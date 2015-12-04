using System;
using System.IO;
using System.Linq;
using System.Web.Security;
using AccountsRepository;
using HW_3.Models;

namespace HW_3
{
    public partial class Page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.IsAuthenticated)
            {
                FormsAuthentication.RedirectToLoginPage();
                return;
            }

            if (IsPostBack) return;

            var requestedPageId = Request.QueryString["id"];

            Repository repository = (Repository) Application["repository"];
            
            this.accountId.Value = requestedPageId;
            string userNickName = User.Identity.Name;
            var userId = repository.GetAccountId(userNickName);

            Guid accountId;
            Guid.TryParse(requestedPageId, out accountId);
            Account currentAccount = null;

            if (!repository.IsAccountExists(accountId))
                Response.Redirect("PageNotFound.html", true);
            else
                currentAccount = repository.GetAccount(accountId);

            LblFName.Text = currentAccount.FirstName;
            LblLName.Text = currentAccount.LastName;
            LblInfo.Text = currentAccount.Information;
            //LblBirthDate.Text = currentAccount.BirthDate.Value.ToShortDateString();

            //Check if this is an actual user's page
            if (AuthorizationManager.IsUsersAccount(userId.ToString(), requestedPageId))
            {
                LblIsUser.Text = "(this is you)";
                InputPost.Visible = true;
                Publicate.Visible = true;
            }
            //If the user is not a page's owner
            else
            {
                var actualAccount = repository.GetAccount(Guid.Parse(userId.ToString()));
                LblIsUser.Text = "";
                LblActualUser.Text = string.Format("You entered as {0} {1}", 
                    actualAccount.FirstName, actualAccount.LastName);
            }

            currentAccount.Posts.Reverse();

            PostRepeater.DataSource = currentAccount.Posts
                .OrderByDescending(po => po.PublicationTime);
            PostRepeater.DataBind();

            Image.ImageUrl = GetUsersPhoto(requestedPageId);

            Friends.PostBackUrl = "Friends.aspx?id=" + requestedPageId;
        }

        protected void Publicate_Click(object sender, EventArgs e)
        {
            Repository repository = (Repository)Application["repository"];
            Guid id = repository.GetAccountId(User.Identity.Name);
            Account usersAccount = repository.GetAccount(id);

            usersAccount.AddPost(InputPost.Text);
            Application["repository"] = repository;
            InputPost.Text = "";

            usersAccount.Posts.Reverse();

            PostRepeater.DataSource = usersAccount.Posts
                .OrderByDescending(po => po.PublicationTime);
            PostRepeater.DataBind();
        }

        protected void ExitButton_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            FormsAuthentication.RedirectToLoginPage();
        }

        private string GetUsersPhoto(string id)
        {
            string photoPath = Server.MapPath("~/Photos/photo_" + id + ".jpg");
            FileInfo info = new FileInfo(photoPath);
            if (info.Exists)
                return "~/Photos/photo_" + id + ".jpg";
            return "~/Photos/noimage.jpg";
        }
    }
}