using Repositories.Entities;
using Services.Services;
using System.Windows;

namespace KoiCareSystem.Components
{
    public partial class UpdateProduct : Window
    {
        private readonly ProductService _productService = new();
        private readonly ExternalProduct _product;

        public UpdateProduct(ExternalProduct product)
        {
            InitializeComponent();
            _product = product;
            LoadProductDetails();
        }

        private void LoadProductDetails()
        {
            NameTextBox.Text = _product.Name;
            DescriptionTextBox.Text = _product.Description;
            PriceTextBox.Text = _product.Price.ToString();
            ThumbnailTextBox.Text = _product.Thumbnail;
            ExternalUrlTextBox.Text = _product.ExternalUrl;
            CategoryIdTextBox.Text = _product.CategoryId.ToString();
            StatusTextBox.Text = _product.Status.ToString();
        }

        private void UpdateUserButton_Click(object sender, RoutedEventArgs e)
        {
            _product.Name = NameTextBox.Text;
            _product.Description = DescriptionTextBox.Text;
            _product.Price = decimal.Parse(PriceTextBox.Text);
            _product.Thumbnail = ThumbnailTextBox.Text;
            _product.ExternalUrl = ExternalUrlTextBox.Text;
            _product.CategoryId = int.Parse(CategoryIdTextBox.Text);
            _product.Status = bool.Parse(StatusTextBox.Text);

            _productService.UpdateProduct(_product);
            MessageBox.Show("Product updated successfully.");
            Close();
        }
    }
}
