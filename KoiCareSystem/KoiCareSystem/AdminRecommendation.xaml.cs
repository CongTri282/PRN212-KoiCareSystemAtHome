using KoiCareSystem.Components;
using Repositories.Entities;
using Services.Services;
using System.Windows;

namespace KoiCareSystem
{
    public partial class AdminRecommendation : Window
    {
        private readonly ProductService _productService = new();

        public AdminRecommendation()
        {
            InitializeComponent();
            LoadProducts();
        }

        private void LoadProducts()
        {
            RecommendationDataGrid.ItemsSource = _productService.GetAllProducts();
        }

        private void AddRecommendation_Click(object sender, RoutedEventArgs e)
        {
            var addProductWindow = new AddProduct();
            addProductWindow.ShowDialog();
            LoadProducts();
        }

        private void UpdateRecommendation_Click(object sender, RoutedEventArgs e)
        {
            if (RecommendationDataGrid.SelectedItem is ExternalProduct selectedProduct)
            {
                var updateProductWindow = new UpdateProduct(selectedProduct);
                updateProductWindow.ShowDialog();
                LoadProducts();
            }
            else
            {
                MessageBox.Show("Please select a product to update.");
            }
        }

        private void DeleteRecommendation_Click(object sender, RoutedEventArgs e)
        {
            if (RecommendationDataGrid.SelectedItem is ExternalProduct selectedProduct)
            {
                _productService.DeleteProduct(selectedProduct);
                LoadProducts();
            }
            else
            {
                MessageBox.Show("Please select a product to delete.");
            }
        }
    }
}
