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

namespace KoiCareSystem.Components
{
    /// <summary>
    /// Interaction logic for PondAction.xaml
    /// </summary>
    public partial class PondAction : Window
    {
        public PondAction()
        {
            InitializeComponent();
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            // Retrieve values from the form

            string name = PondName.Text;
            if (string.IsNullOrWhiteSpace(name))
            {
                MessageBox.Show("Pond Name is required.");
                return;
            }

            if (!int.TryParse(Volume.Text, out int volume))
            {
                MessageBox.Show("Volume must be a valid integer."); 
                return;
            }

            string thumbnail = Thumbnail.Text;

            if (!float.TryParse(Depth.Text, out float depth))
            {
                MessageBox.Show("Depth must be a valid number.");
                return;
            }

            if (!int.TryParse(PumpingCapacity.Text, out int pumpingCapacity))
            {
                MessageBox.Show("Pumping Capacity must be a valid integer.");
                return;
            }

            if (!int.TryParse(Drain.Text, out int drain))
            {
                MessageBox.Show("Drain must be a valid integer.");
                return;
            }

            if (!int.TryParse(Skimmer.Text, out int skimmer))
            {
                MessageBox.Show("Skimmer must be a valid integer.");
                return;
            }

            string note = Note.Text;

            // Add or update pond logic here
            // Example: Save to database

            MessageBox.Show("Pond saved successfully!");
        }

        private void CloseButton_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
