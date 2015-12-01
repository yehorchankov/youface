using System;
using System.Collections.Generic;
using System.Linq;

namespace AccountsRepository
{
    public class Account
    {
        public List<Post> Posts { get; private set; }
        public List<Account> Friends { get; private set; }
        private readonly List<Account> _waitingToConfirmFriendship = new List<Account>(); 
        public RegistrationInfo RegistrationInfo { get; private set; }
        public string FirstName { get; private set; }
        public string LastName { get; private set; }
        public string Information { get; private set; }
        public DateTime? BirthDate { get; private set; }
        public string Adress { get; private set; }

        public Account(string email, string nickName)
        {
            RegistrationInfo = new RegistrationInfo(email, nickName);
            Friends = new List<Account>();
            Posts = new List<Post>();
        }

        public Account(string email, string nickName, string firstName, string lastName, DateTime? birthDate)
        {
            RegistrationInfo = new RegistrationInfo(email, nickName);
            Posts = new List<Post>();
            Friends = new List<Account>();
            FirstName = firstName;
            LastName = lastName;
            BirthDate = birthDate;
        }

        public Account(string email, string nickName, string firstName, string lastName, string information, DateTime? birthDate)
        {
            RegistrationInfo = new RegistrationInfo(email, nickName);
            Posts = new List<Post>();
            Friends = new List<Account>();
            FirstName = firstName;
            LastName = lastName;
            Information = information;
            BirthDate = birthDate;
        }

        public List<Post> GetPostCollection()
        {
            return Posts;
        }

        public void ChangeInformation(string fname, string lname, string info, string email, DateTime? bdate)
        {
            FirstName = fname;
            LastName = lname;
            Information = info;
            RegistrationInfo.Email = email;
            BirthDate = bdate;
        }

#region WorkingWithFriends

        public void AddFriendToUser(Account account)
        {
            Friends.Add(account);    
        }

        public void AcceptFriendship(Account account)
        {
            _waitingToConfirmFriendship.Remove(account);
            Friends.Add(account);
        }

        public void DeclineFriendship(Account account)
        {
            _waitingToConfirmFriendship.Remove(account);
        }

        public void AddNewFriend(Account account)
        {
            _waitingToConfirmFriendship.Add(account);
        }

        public void RemoveFromFriends(Account account)
        {
            if (AlreadyHasFriend(account))
                Friends.Remove(account);
        }

        private bool AlreadyHasFriend(Account account)
        {
            return Friends.Contains(account);
        }

        public List<Account> GetUnconfirmedAccounts()
        {
            return _waitingToConfirmFriendship;
        } 
#endregion

#region WorkingWithPosts
        public void AddPost(string text)
        {
            Post post = new Post(text);
            Posts.Add(post);
        }

        public void DeletePost(Guid postId)
        {
            foreach (Post post in Posts.Where(post => post.PostId == postId))
            {
                Posts.Remove(post);
                return;
            }
        }
#endregion
    }
}