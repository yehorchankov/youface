using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HW_3.Models
{
    /// <summary>
    /// Allows to control user's authorization state
    /// </summary>
    public static class AuthorizationManager
    {
        /// <summary>
        /// Dictionary [nickname, hashedPassword] Users
        /// </summary>
        private static readonly Dictionary<string, string> Users = new Dictionary<string, string>();

        /// <summary>
        /// Checks if users is registred into internal nickname-passwordHash dictionary
        /// </summary>
        /// <param name="nickname">User's nickname</param>
        /// <returns>Result of checking</returns>
        public static bool IsRegistered(string nickname)
        {
            return Users.ContainsKey(nickname);
        }

        /// <summary>
        /// Allows to register new user into internal users collection
        /// </summary>
        /// <param name="nickname">User's nickname (it should be unique)</param>
        /// <param name="password">User's password</param>
        public static void RegisterUser(string nickname, string password)
        {
            string hashedPassword = CryptoProvider.GetMd5Hash(password);
            Users.Add(nickname, hashedPassword);
        }

        /// <summary>
        /// Checks if nickname matches its password's hash
        /// Use it only to check log in values
        /// </summary>
        /// <param name="nickname">User's nickname</param>
        /// <param name="password">User's password</param>
        /// <returns>Result of checking</returns>
        public static bool PasswordMatch(string nickname, string password)
        {
            string hashedPassword = CryptoProvider.GetMd5Hash(password);
            return string.Equals(Users[nickname], hashedPassword);
        }

        /// <summary>
        /// Checks if input cookies values macth
        /// So it lets know if account is authorized yet 
        /// </summary>
        /// <param name="cookiesId">Cookie that contains id</param>
        /// <param name="cookiesHash">Cookie that contains id hash to be matched</param>
        /// <returns>Result of chacking</returns>
        public static bool IsAuthorizedAccount(HttpCookie cookiesId, HttpCookie cookiesHash)
        {
            if (cookiesId == null || cookiesHash == null)
                return false;
            var hashedId = CryptoProvider.GetMd5Hash(cookiesId.Value);
            return string.Equals(hashedId, cookiesHash.Value);
        }

        /// <summary>
        /// Checks if the account is actual user's account or is it a friend's account
        /// </summary>
        /// <param name="cookieId">Id of actual user</param>
        /// <param name="requestedId">Id of the requested user</param>
        /// <returns>Result of checking</returns>
        public static bool IsUsersAccount(string cookieId, string requestedId)
        {
            return string.Equals(cookieId, requestedId);
        }

        public static void ChangePassword(string nickName, string newPassword)
        {
            Users.Remove(nickName);
            string hashedPassword = CryptoProvider.GetMd5Hash(newPassword);
            Users.Add(nickName, hashedPassword);
        }
    }
}