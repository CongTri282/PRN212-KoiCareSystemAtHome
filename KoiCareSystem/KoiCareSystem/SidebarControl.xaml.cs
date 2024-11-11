using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace KoiCareSystem
{
    /// <summary>
    /// Interaction logic for SidebarControl.xaml
    /// </summary>
    public partial class SidebarControl : UserControl
    {
        public SidebarControl()
        {
            InitializeComponent();
        }

        private void PondButton_Click(object sender, RoutedEventArgs e)
        {
            PondWindow pondWindow = new();
            pondWindow.Show();
            Window.GetWindow(this)?.Close();
        }

        private void LogOutButton_Click(object sender, RoutedEventArgs e)
        {
            LoginWindow loginWindow = new();
            loginWindow.Show();
            Window.GetWindow(this)?.Close();
        }

        private void QuitButton_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }

        private void KoisButton_Click(object sender, RoutedEventArgs e)
        {
            KoiWindow koiWindow = new();
            koiWindow.Show();
            Window.GetWindow(this)?.Close();
        }

        private void SaltButton_Click(object sender, RoutedEventArgs e)
        {
            SaltCalculatorWindow saltCalculatorWindow = new();
            saltCalculatorWindow.Show();
            Window.GetWindow(this)?.Close();
        }

        private void FoodButton_Click(object sender, RoutedEventArgs e)
        {
            FoodCalculatorWindow foodCalculatorWindow = new();
            foodCalculatorWindow.Show();
            Window.GetWindow(this)?.Close();
        }

        private void RecommendButton_Click(object sender, RoutedEventArgs e)
        {
            ProductWindow productWindow = new();
            productWindow.Show();
            Window.GetWindow(this)?.Close();
        }

        private void ParameterButton_Click(object sender, RoutedEventArgs e)
        {
            MeasurementsWindow measurementsWindow = new();
            measurementsWindow.Show();
            Window.GetWindow(this)?.Close();
        }
    }
}
