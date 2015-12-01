using System;
using System.IO;
using System.Linq;
using AccountsRepository;
using HW_3.Models;

namespace HW_3.NativePages
{
    public partial class Page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var id = Request.Cookies["id"];
            var hash = Request.Cookies["hash"];
            var requestedPageId = Request.QueryString["id"];
            this.accountId.Value = requestedPageId;
            Friends.PostBackUrl = "Friends.aspx?id=" + requestedPageId;

            if (IsPostBack) return;
            
            //If user's not signed in before
            if (!AuthorizationManager.IsAuthorizedAccount(id, hash)) 
                Response.Redirect("LogIn.aspx", true);

            Repository repository;
            if (Application["repository"] == null)
                repository = new Repository();
            else
                repository = (Repository) Application["repository"];
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
            if (AuthorizationManager.IsUsersAccount(id.Value, requestedPageId))
            {
                LblIsUser.Text = "(this is you)";
                InputPost.Visible = true;
                Publicate.Visible = true;
            }
            //If the user is not a page's owner
            else
            {
                var actualAccount = repository.GetAccount(Guid.Parse(id.Value));
                LblIsUser.Text = "";
                LblActualUser.Text = string.Format("You entered as {0} {1}", 
                    actualAccount.FirstName, actualAccount.LastName);
            }

            currentAccount.Posts.Reverse();

            PostRepeater.DataSource = currentAccount.Posts.OrderByDescending(po => po.PublicationTime);
            PostRepeater.DataBind();

            Image.ImageUrl = GetUsersPhoto(requestedPageId);
        }

        protected void Publicate_Click(object sender, EventArgs e)
        {
            var cookie = Request.Cookies["id"];
            if (cookie != null)
            {
                Guid id = Guid.Parse(cookie.Value);
                Repository repository = (Repository)Application["repository"];
                Account usersAccount = repository.GetAccount(id);

                usersAccount.AddPost(InputPost.Text);
                Application["repository"] = repository;
                InputPost.Text = "";

                usersAccount.Posts.Reverse();

                PostRepeater.DataSource = usersAccount.Posts.OrderByDescending(po => po.PublicationTime);
                PostRepeater.DataBind();
            }
        }

        protected void ExitButton_Click(object sender, EventArgs e)
        {
            Response.Cookies["id"].Expires = DateTime.MinValue;
            Response.Cookies["hash"].Expires = DateTime.MinValue;

            Response.Redirect("Default.aspx");
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