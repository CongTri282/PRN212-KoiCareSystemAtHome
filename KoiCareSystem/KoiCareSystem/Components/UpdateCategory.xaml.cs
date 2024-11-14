using System.Windows;
using Repositories.Entities;
using Services.Services;

namespace KoiCareSystem.Components
{
    public partial class UpdateCategory : Window
    {
        private readonly CategoryService _categoryService;
        private readonly Category _category;

        public UpdateCategory(Category category)
        {
            InitializeComponent();
            _categoryService = new CategoryService();
            _category = category;
            LoadCategoryDetails();
        }

        private void LoadCategoryDetails()
        {
            NameTextBox.Text = _category.Name;
            DescriptionTextBox.Text = _category.Description;
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            _category.Name = NameTextBox.Text;
            _category.Description = DescriptionTextBox.Text;

            _categoryService.UpdateCategory(_category);
            this.Close();
        }
    }
}
