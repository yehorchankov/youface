using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AccountsRepository
{
    public class Repository
    {
        /// <summary>
        /// Dictionary [nickName, account]
        /// </summary>
        private readonly Dictionary<string, Account> _accounts;

        public Repository()
        {
            _accounts = new Dictionary<string, Account>();
        }

        public void AddAccount(Account account)
        {
            _accounts.Add(account.RegistrationInfo.NickName, account);
        }

        public void DeleteAccount(string nickName)
        {
            _accounts.Remove(nickName);
        }

        public Account GetAccount(string nickName)
        {
            return _accounts[nickName];
        }

        public Account GetAccount(Guid id)
        {
            return _accounts.Values
                .FirstOrDefault(account => account.RegistrationInfo.AccountId == id);
        }

        public Guid GetAccountId(string nickName)
        {
            return _accounts[nickName].RegistrationInfo.AccountId;
        }

        public string GetAccountNickname(Guid id)
        {
            return _accounts.Values
                .Where(acc => acc.RegistrationInfo.AccountId == id)
                .Select(account => account.RegistrationInfo.NickName)
                .FirstOrDefault();
        }

        public bool IsAccountExists(Guid id)
        {
            return _accounts.Values
                .Any(account => account.RegistrationInfo.AccountId == id);
        }

        public bool IsAccountExists(string nickname)
        {
            return _accounts.ContainsKey(nickname);
        }

        public List<Account> GetAccounts()
        {
            return new List<Account>(_accounts.Values.AsEnumerable());
        }

        public void AddNewFriend(string personToBeFriend, Account usersAccount)
        {
            _accounts[personToBeFriend].AddNewFriend(usersAccount);
        }

        public void DeclineFriendship(string personToBeFriend, string user)
        {
            Account friend = GetAccount(personToBeFriend); 
            _accounts[user].DeclineFriendship(friend);
        }

        public void ConfirmFriendship(string personToBeFriend, string user)
        {
            Account friendAccount = _accounts[personToBeFriend];
            Account userAccount = _accounts[user];
            _accounts[personToBeFriend].AcceptFriendship(userAccount);
            _accounts[user].AddFriendToUser(friendAccount);
        }
    }
}
