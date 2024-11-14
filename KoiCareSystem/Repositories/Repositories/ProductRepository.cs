using Repositories.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repositories.Repositories
{
    public class ProductRepository
    {
        private KoiCareSystemContext? _context;


        public List<ExternalProduct> GetAll()
        {
            _context = new();
            return _context.ExternalProducts.ToList();
        }

        public ExternalProduct? GetById(int id)
        {
            _context = new();
            return _context.ExternalProducts.FirstOrDefault(p => p.ProductId == id);
        }


    }
}
