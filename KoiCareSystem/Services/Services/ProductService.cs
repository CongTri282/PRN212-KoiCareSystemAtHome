using Repositories.Entities;
using Repositories.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Services.Services
{
    public class ProductService
    {
        private ProductRepository _repo = new();

        public List<ExternalProduct> GetAllProducts()
        {
            return _repo.GetAll();
        }

        public ExternalProduct? GetProductById(int productId)
        {
            return _repo.GetById(productId);
        }
    }
}
