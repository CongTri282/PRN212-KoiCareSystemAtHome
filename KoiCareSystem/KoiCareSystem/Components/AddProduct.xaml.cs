using Repositories.Entities;
using Services.Services;
using System.Windows;

namespace KoiCareSystem.Components
{
    public partial class AddProduct : Window
    {
        private readonly ProductService _productService = new();

        public AddProduct()
        {
            InitializeComponent();
        }

        private void AddUserButton_Click(object sender, RoutedEventArgs e)
        {
            var newProduct = new ExternalProduct
            {
                Name = NameTextBox.Text,
                Description = DescriptionTextBox.Text,
                Price = decimal.Parse(PriceTextBox.Text),
                Thumbnail = ThumbnailTextBox.Text,
                ExternalUrl = ExternalUrlTextBox.Text,
                CategoryId = int.Parse(CategoryIdTextBox.Text),
                Status = bool.Parse(StatusTextBox.Text),
                CreatedAt = DateTime.Now
            };

            _productService.AddProduct(newProduct);
            MessageBox.Show("Product added successfully.");
            Close();
        }
    }
}
