using KoiCareSystem.Components;
using Repositories.Entities;
using Services.Services;
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
        private readonly PondService _pondService = new();

        private string userId = "U001";
        public PondWindow()
        {
            InitializeComponent();
            LoadPonds();
        }

        private void LoadPonds()
        {
            var ponds = _pondService.GetPondsByUserId(userId);
            PondListBox.ItemsSource = ponds;
        }

        private void PondListBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (PondListBox.SelectedItem is Pond selectedPond)
            {
                PondDetailWindow detailWindow = new PondDetailWindow(selectedPond);
                detailWindow.Show();
                this.Close();
            }
        }

        private void AddPondButton_Click(object sender, RoutedEventArgs e)
        {
            AddPond addPond = new();
            addPond.ShowDialog();
            LoadPonds();
        }
    }
}