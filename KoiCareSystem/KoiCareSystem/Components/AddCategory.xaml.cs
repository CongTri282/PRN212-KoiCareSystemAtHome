using System.Windows;
using Repositories.Entities;
using Services.Services;

namespace KoiCareSystem.Components
{
    public partial class AddCategory : Window
    {
        private readonly CategoryService _categoryService;

        public AddCategory()
        {
            InitializeComponent();
            _categoryService = new CategoryService();
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            var newCategory = new Category
            {
                Name = NameTextBox.Text,
                Description = DescriptionTextBox.Text,
                CreatedAt = DateTime.Now
            };

            _categoryService.AddCategory(newCategory);
            this.Close();
        }
    }
}
