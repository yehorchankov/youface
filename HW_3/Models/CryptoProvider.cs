using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace HW_3.Models
{
    public class CryptoProvider
    {
        private const string key = "admin1234";

        /// <summary>
        /// Returns hash for the string
        /// </summary>
        /// <param name="data">String for computing hash</param>
        /// <returns>Hash</returns>
        public static string GetMd5Hash(string data)
        {
            MD5CryptoServiceProvider md5Crypto = new MD5CryptoServiceProvider();
            byte[] hashCode = md5Crypto.ComputeHash(Encoding.Default.GetBytes(data + key));
            return BitConverter.ToString(hashCode).ToLower().Replace("-", "");
        }
    }
}