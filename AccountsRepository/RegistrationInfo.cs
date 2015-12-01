using System;

namespace AccountsRepository
{
    public class RegistrationInfo
    {
        public string Email { get; set; }
        public string NickName { get; private set; }
        public DateTime RegistrationTime { get; private set; }
        public Guid AccountId { get; private set; }

        public RegistrationInfo(string email, string nickName)
        {
            Email = email;
            NickName = nickName;
            RegistrationTime = DateTime.Now;
            AccountId = Guid.NewGuid();
        }
    }
}