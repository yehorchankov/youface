using System;
using System.Web;
using System.Web.Security;
using AccountsRepository;
using HW_3.Models;

namespace HW_3.Authorization
{
    public partial class LogIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            string nickname = InputNickname.Text;
            string password = InputPassword.Text;
            if (!AuthorizationManager.IsRegistered(nickname) || !AuthorizationManager.PasswordMatch(nickname, password))
            {
                ErrorLabel.Text = "Account is not registred yet \nor password doesn't match";
                return;
            }
            FormsAuthentication.RedirectFromLoginPage(nickname, false);
        }
    }
}