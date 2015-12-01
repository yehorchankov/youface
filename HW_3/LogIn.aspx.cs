using System;
using System.Web;
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

            Repository repository = null;
            if (Application["repository"] == null)
                Response.Redirect("Register.aspx");
            else
                repository = (Repository) Application["repository"];

            Guid accountId = repository.GetAccountId(InputNickname.Text);
            string hashedId = CryptoProvider.GetMd5Hash(accountId.ToString());
            
            HttpCookie idCookie = new HttpCookie("id", accountId.ToString()) 
            {Expires = DateTime.Now.AddHours(1)};
            HttpCookie hashCookie = new HttpCookie("hash", hashedId) 
            {Expires = DateTime.Now.AddHours(1)};

            Response.Cookies.Add(idCookie);
            Response.Cookies.Add(hashCookie);
            Response.Redirect("Page.aspx?id=" + accountId);
        }
    }
}