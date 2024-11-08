﻿using Repositories.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repositories.Repositories
{
    public class KoiRepository
    {
        private KoiCareSystemContext _context;

        public List<Koi> GetAllKois()
        {
            _context = new();
            return _context.Kois.ToList();
        }

        public Koi? GetKoiByPondId(int pondId)
        {
            _context = new();
            return _context.Kois.FirstOrDefault(k => k.PondId == pondId);
        }

        public void AddKoi(Koi koi)
        {
            _context = new();
            _context.Kois.Add(koi);
            _context.SaveChanges();
        }

        public void UpdateKoi(Koi koi)
        {
            _context = new();
            _context.Kois.Update(koi);
            _context.SaveChanges();
        }

        public void DeleteKoi(Koi koi)
        {
            _context = new();
            _context.Kois.Remove(koi);
            _context.SaveChanges();
        }
    }
}
