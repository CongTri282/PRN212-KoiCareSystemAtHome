using Repositories.Entities;
using Repositories.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Services.Services
{
    public class UserService
    {
        private UserRepository _repo = new();

        public User? Authenticate(string email, string password)
        {
            return _repo.GetOne(email, password);
        }
    }
}
