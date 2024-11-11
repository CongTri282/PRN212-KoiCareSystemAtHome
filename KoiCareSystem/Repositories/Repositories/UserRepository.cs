using Repositories.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repositories.Repositories
{
    public class UserRepository
    {
        private KoiCareSystemContext _context;

        public User? GetOne(string email, string password)
        {
            _context = new();
            return _context.Users.FirstOrDefault(x => x.Email.ToLower() == email && x.Password == password);
        }
    }
}
