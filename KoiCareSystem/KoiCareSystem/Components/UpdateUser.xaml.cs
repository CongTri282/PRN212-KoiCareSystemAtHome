using System.Windows;
using Services.Services;
using Repositories.Entities;

namespace KoiCareSystem.Components
{
    public partial class UpdateUser : Window
    {
        private readonly UserService _userService = new();
        private readonly User _user;

        public UpdateUser(User user)
        {
            InitializeComponent();
            _user = user;
            LoadUserData();
        }

        private void LoadUserData()
        {
            EmailTextBox.Text = _user.Email;
            PasswordTextBox.Text = _user.Password;
            NameTextBox.Text = _user.Name;
            RoleTextBox.Text = _user.Role;
        }

        private void UpdateUserButton_Click(object sender, RoutedEventArgs e)
        {
            _user.Email = EmailTextBox.Text;
            _user.Password = PasswordTextBox.Text;
            _user.Name = NameTextBox.Text;
            _user.Role = RoleTextBox.Text;

            _userService.UpdateUser(_user);
            MessageBox.Show("User updated successfully.");
            Close();
        }
    }
}
