
//using Android.Graphics;
using job_number_check.Models;
using job_number_check.Views;
using job_number_check.Helpers;
using System.Collections.ObjectModel;
using Newtonsoft.Json;
using static System.Net.Mime.MediaTypeNames;
using System;
using System.Threading.Tasks;
using System.IO;
using Microsoft.Maui.Controls.Compatibility;
using Mopups.Services;
namespace job_number_check
{
    public partial class MainPage : ContentPage
    {
        public List<string> mks { get; set; } = new List<string>();
        public string Jplan = "";
        List<WorkItem> workOrders = new List<WorkItem>();

        public MainPage()
        {
            InitializeComponent();
        }
        protected override async void OnAppearing()
        {
            workOrders = LoadJP().Result;
            var fg = workOrders.ToList().GroupBy(x => x.JobPlan).Select(std => new
            {
                Key = std.Key,
                //Sorting the Students in Each Group based on Name in Ascending order
                Students = std.OrderBy(x => x.Value)
                
            });

            //mks = (List<string>)df.ToList().Select(x => x.JobPlan).Distinct();
            poopo.ItemsSource = fg.Select(a => a.Key).ToList(); //fg.ToList().ToBindingList();
            
            //SeedDb(workOrders);
            
            BindingContext = this;
            //await GetCurrentLocation();
        }

        private async void SeedDb(List<WorkItem> df)
        {
            foreach (var item in df)
            {              
                await App.Database.SaveExtraAsync(item);
            }
        }

        async Task<List<WorkItem>> LoadJP()
        {
            try
            {
                using var stream = await FileSystem.OpenAppPackageFileAsync("movie.json");
                using var reader = new StreamReader(stream);
                List< WorkItem> movie2 = JsonConvert.DeserializeObject<List<WorkItem>>(reader.ReadToEnd());

                return movie2;
            }
            catch (Exception ex)
            {
                return null;
            }

        }
        

        private void ToolbarItem_Clicked(object sender, EventArgs e)
        {
            Dispatcher.DispatchAsync(async () =>
            {
                await Shell.Current.GoToAsync("viewJobs");
                //await Navigation.PopAsync();
            });
        }

        async void Save_Button_Clicked(object sender, EventArgs e)
        {
            WorkItem workItem = new WorkItem();
            workItem.MyId = Guid.NewGuid().ToString();
            workItem.Date = DateTime.Now;
            workItem.JobPlan = Jplan;
            workItem.Value = workOrders.Where(x => x.JobPlan == Jplan).Select(c => c.Value).FirstOrDefault();
            workItem.WoNumber = Convert.ToInt32(won.Text.ToString());
            var iid = await App.Database.SaveExtraAsync(workItem);
            await MopupService.Instance.PushAsync(new NewPage1());
            won.Text = "";           
        }

        private void ListView_ItemSelected(object sender, SelectedItemChangedEventArgs e)
        {
            Jplan = e.SelectedItem.ToString();///(ListView)sender.ToString();
        }

        private void poopo_SelectedIndexChanged(object sender, EventArgs e)
        {
            var picker = (Picker)sender;
            int selectedIndex = picker.SelectedIndex;
            string qq = "";
            if (selectedIndex != -1)
            {
                Jplan = picker.Items[selectedIndex];
            }
        }
        private CancellationTokenSource _cancelTokenSource;
        private bool _isCheckingLocation;

        public async Task GetCurrentLocation()
        {
            try
            {
                _isCheckingLocation = true;

                GeolocationRequest request = new GeolocationRequest(GeolocationAccuracy.Medium, TimeSpan.FromSeconds(10));

                _cancelTokenSource = new CancellationTokenSource();

                Location location = await Geolocation.Default.GetLocationAsync(request, _cancelTokenSource.Token);

                if (location != null)
                    Console.WriteLine($"Latitude: {location.Latitude}, Longitude: {location.Longitude}, Altitude: {location.Altitude}");
            }
            // Catch one of the following exceptions:
            //   FeatureNotSupportedException
            //   FeatureNotEnabledException
            //   PermissionException
            catch (Exception ex)
            {
                // Unable to get location
            }
            finally
            {
                _isCheckingLocation = false;
            }
        }

        public void CancelRequest()
        {
            if (_isCheckingLocation && _cancelTokenSource != null && _cancelTokenSource.IsCancellationRequested == false)
                _cancelTokenSource.Cancel();
        }
    }

}
