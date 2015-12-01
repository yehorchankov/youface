using System;
using AccountsRepository;
using HW_3.Models;

namespace HW_3.Authorization
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonConfirm_Click(object sender, EventArgs e)
        {
            try
            {
                string nickname = InputNickname.Text;
                string email = InputEmail.Text;
                string password = InputPassword.Text;
                string firstName = InputFName.Text;
                string lastName = InputLName.Text;
                string info = InputInformation.Text;
                DateTime? birthDate = DateTime.Parse(InputBirthDate.Text);

                Account account = 
                    new Account(email, nickname, firstName, lastName, info, birthDate);

                Repository repository;
                if (Application["repository"] == null)
                    repository = new Repository();
                else
                    repository = (Repository) Application["repository"];

                repository.AddAccount(account);
                Application["repository"] = repository;
                AuthorizationManager.RegisterUser(nickname, password);

                if (PhotoUpload.HasFile && PhotoUpload.FileName.EndsWith(".jpg"))
                    PhotoUpload.SaveAs(Server.MapPath("~/Photos/photo_" + account.RegistrationInfo.AccountId + ".jpg"));

                Response.Redirect("Default.aspx", true);
            }
            catch (Exception exception)
            {
            }
        }
    }
}