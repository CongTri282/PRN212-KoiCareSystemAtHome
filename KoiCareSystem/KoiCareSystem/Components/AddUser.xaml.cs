using System.Windows;
using Services.Services;
using Repositories.Entities;

namespace KoiCareSystem.Components
{
    public partial class AddUser : Window
    {
        private readonly UserService _userService = new();

        public AddUser()
        {
            InitializeComponent();
        }

        private void AddUserButton_Click(object sender, RoutedEventArgs e)
        {
            User newUser = new()
            {
                UserId = Guid.NewGuid().ToString(),
                Email = EmailTextBox.Text,
                Password = PasswordTextBox.Text,
                Name = NameTextBox.Text,
                Role = RoleTextBox.Text
            };

            _userService.AddUser(newUser);
            MessageBox.Show("User added successfully.");
            Close();
        }
    }
}
