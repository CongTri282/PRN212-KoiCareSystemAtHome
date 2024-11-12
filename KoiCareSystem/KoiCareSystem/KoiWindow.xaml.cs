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
    /// Interaction logic for KoiWindow.xaml
    /// </summary>
    public partial class KoiWindow : Window
    {
        private readonly KoiService _koiService = new();

        public KoiWindow()
        {
            InitializeComponent();
            LoadKois();
        }

        private void LoadKois()
        {
            var kois = _koiService.GetAllKois();
            KoiListBox.ItemsSource = kois;
        }

        private void KoiListBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (KoiListBox.SelectedItem is Koi selectedKoi)
            {
                KoiDetailWindow detailWindow = new KoiDetailWindow(selectedKoi);
                detailWindow.Show();
                this.Close();
            }
        }
    }
}
