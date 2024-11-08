using KoiCareSystem.Components;
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
using System.Windows.Shapes;

namespace KoiCareSystem
{
    /// <summary>
    /// Interaction logic for PondWindow.xaml
    /// </summary>
    public partial class PondWindow : Window
    {
        public PondWindow()
        {
            InitializeComponent();
        }

        private void AddPondButton_Click(object sender, RoutedEventArgs e)
        {
            PondAction pondAction = new();
            pondAction.Show();

        }
    }
}
