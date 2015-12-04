using System;
using System.IO;
using System.Web.Security;
using AccountsRepository;
using HW_3.Models;

namespace HW_3.NativePages
{
    public partial class EditProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.IsAuthenticated)
            {
                FormsAuthentication.RedirectToLoginPage();
                return;
            }

            Repository repository = null;
            if (Application["repository"] != null)
                repository = (Repository) Application["repository"];

            var id = repository.GetAccountId(User.Identity.Name);
            Account account = repository.GetAccount(id);

            string path = Server.MapPath("~/Photos/photo_" + id + ".jpg");
            FileInfo info = new FileInfo(path);
            Photo.ImageUrl = info.Exists ? "~/Photos/photo_" + id + ".jpg" : "~/Photos/noimage.jpg";

            InputEmail.Text = account.RegistrationInfo.Email;
            InputFName.Text = account.FirstName;
            InputLName.Text = account.LastName;
            InputInformation.Text = account.Information;
            linkToHome.PostBackUrl = "Page.aspx?id=" + id;
        }

        protected void Confirm_Click(object sender, EventArgs e)
        {
            if (!Request.IsAuthenticated)
            {
                FormsAuthentication.RedirectToLoginPage();
                return;
            }

            Repository repository = null;
            if (Application["repository"] != null)
                repository = (Repository) Application["repository"];

            string nickname = User.Identity.Name;
            var id = repository.GetAccountId(nickname);
            Account account = repository.GetAccount(id);

            if (!AuthorizationManager.PasswordMatch(nickname, InputActualPassword.Text))
                return;
            
            string fName = string.IsNullOrEmpty(InputFName.Text) 
                ? account.FirstName : InputFName.Text;
            string lName = string.IsNullOrEmpty(InputLName.Text)
                ? account.LastName : InputLName.Text;
            string info = string.IsNullOrEmpty(InputInformation.Text)
                ? account.Information : InputInformation.Text;
            string email = string.IsNullOrEmpty(InputEmail.Text)
                ? account.RegistrationInfo.Email : InputEmail.Text;
            DateTime? birthDate = string.IsNullOrEmpty(InputBirthDate.Text)
                ? account.BirthDate : DateTime.Parse(InputBirthDate.Text);

            if (!string.IsNullOrEmpty(InputPassword.Text) 
                && string.Equals(InputPassword.Text, InputPassword2.Text))
                AuthorizationManager.ChangePassword(nickname, InputPassword.Text);

            if (PhotoUpload.HasFile && PhotoUpload.FileName.EndsWith(".jpg"))
                PhotoUpload.SaveAs(Server.MapPath("~/Photos/photo_" + id + ".jpg"));

            account.ChangeInformation(fName, lName, info, email, birthDate);

            Application["repository"] = repository;

            Response.Redirect("Page.aspx?id=" + id);
        }
    }
}