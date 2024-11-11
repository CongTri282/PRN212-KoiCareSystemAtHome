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
    /// Interaction logic for PondDetailWindow.xaml
    /// </summary>
    public partial class PondDetailWindow : Window
    {
        private KoiService _koiService = new();
        private PondService _pondService = new();
        private Pond _pond;

        public PondDetailWindow(Pond pond)
        {
            InitializeComponent();
            _pond = pond;
            try
            {
                DisplayPondDetails(pond);
                DisplayKoiFish(pond.PondId);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred while displaying pond details: {ex.Message}", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void DisplayPondDetails(Pond pond)
        {
            try
            {
                if (!string.IsNullOrEmpty(pond.Thumbnail))
                {
                    PondThumbnail.Source = new BitmapImage(new Uri(pond.Thumbnail));
                }

                PondName.Text = pond.Name;
                PondVolume.Text = pond.Volume.ToString();
                PondDepth.Text = pond.Depth.ToString();
                PondPumpingCapacity.Text = pond.PumpingCapacity.ToString();
                PondDrain.Text = pond.Drain.ToString();
                PondSkimmer.Text = pond.Skimmer.ToString();
                PondNote.Text = pond.Note;
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred while displaying pond details: {ex.Message}", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void DisplayKoiFish(int pondId)
        {
            try
            {
                var koiFish = _koiService.GetKoisByPondId(pondId);
                KoiListBox.ItemsSource = koiFish;
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred while displaying koi fish: {ex.Message}", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void UpdatePondButton_Click(object sender, RoutedEventArgs e)
        {
            var updatePondWindow = new Components.UpdatePond(_pond);
            updatePondWindow.ShowDialog();
            try
            {
                DisplayPondDetails(_pond);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred while updating pond details: {ex.Message}", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void DeletePondButton_Click(object sender, RoutedEventArgs e)
        {
            var result = MessageBox.Show("Are you sure you want to delete this pond?", "Confirm Delete", MessageBoxButton.YesNo, MessageBoxImage.Warning);
            if (result == MessageBoxResult.Yes)
            {
                try
                {
                    _pondService.DeletePond(_pond);
                    PondWindow pondWindow = new();
                    pondWindow.Show();
                    this.Close();
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"An error occurred while deleting the pond: {ex.Message}", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }
    }
}
