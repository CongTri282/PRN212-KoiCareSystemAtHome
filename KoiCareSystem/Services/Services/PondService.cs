﻿using Repositories.Entities;
using Repositories.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Services.Services
{
    public class PondService
    {
        private PondRepository _repo = new();

        public List<Pond> GetAllPonds()
        {
            return _repo.GetAllPonds();
        }

        public Pond? GetPondByUserId(string userId)
        {
            return _repo.GetPondByUserId(userId);
        }

        public void AddPond(Pond pond)
        {
            _repo.AddPond(pond);
        }

        public void UpdatePond(Pond pond)
        {
            _repo.UpdatePond(pond);
        }

        public void DeletePond(Pond pond)
        {
            _repo.DeletePond(pond);
        }
    }
}
