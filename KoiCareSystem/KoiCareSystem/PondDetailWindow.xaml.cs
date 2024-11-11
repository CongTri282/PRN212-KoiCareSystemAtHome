using Repositories.Entities;
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
        public PondDetailWindow(Pond pond)
        {
            InitializeComponent();
            DisplayPondDetails(pond);
        }

        // ... other code

        private void DisplayPondDetails(Pond pond)
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
    }
}
