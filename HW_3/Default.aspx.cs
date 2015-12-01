using System;
using AccountsRepository;
using HW_3.Models;

namespace HW_3.Authorization
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /*protected void CreateRepository_Click(object sender, EventArgs e)
        {
            var repository = new Repository();
            var account = new Account("egor.ch@dfs.com", "admin", "Egor", "Ch", "crimina l", DateTime.Now);
            account.AddPost("first post");
            account.AddPost("hello world");
            repository.AddAccount(account);
            AuthorizationManager.RegisterUser("admin", "1");

            account = new Account("youtu.be@dds.com", "vasya", "Gro", "Ch", "lorem ipsum", DateTime.Now);
            account.AddPost("lol");
            account.AddPost("hellol worlolol");
            repository.AddAccount(account);
            AuthorizationManager.RegisterUser("vasya", "1234");

            Application["repository"] = repository;
        }*/
    }
}