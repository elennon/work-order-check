
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
using System.Net;
using System.Runtime.Serialization.Json;
using System.Runtime.Serialization;
namespace job_number_check
{
    public partial class MainPage : ContentPage
    {
        public List<string> mks { get; set; } = new List<string>();
        public string Jplan = "";
        List<WorkItem> workOrders = new List<WorkItem>();
        Location loc = new Location();

        public MainPage()
        {
            InitializeComponent();
        }
        protected override async void OnAppearing()
        {
            //await CheckAndRequestLocationPermission();
            workOrders = await App.Database.GetExtrasAsync();
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
            if(Jplan == "")
            {
                await DisplayAlert("Not Saved", "You need to add job plan", "OK");
                return;
            }
            
            if (won.Text.ToString().Count() != 8)
            {
                await DisplayAlert("Not Saved", "You need to check WO#", "OK");
                return;
            }
            WorkItem workItem = new WorkItem();
            workItem.MyId = Guid.NewGuid().ToString();
            workItem.Date = DateTime.Now;
            workItem.JobPlan = Jplan;
            workItem.Value = workOrders.Where(x => x.JobPlan == Jplan).Select(c => c.Value).LastOrDefault();
            workItem.WoNumber = won.Text.ToString();
            workItem.IsGMC = false;
            //var yy = await GetCurrentLocation();
            //if (yy != null)
            //{
            //    workItem.Location = yy.Longitude.ToString() + yy.Latitude.ToString();
            //    var ft = getAddress(yy.Latitude, yy.Longitude);
            //}
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
        public async Task<PermissionStatus> CheckAndRequestLocationPermission()
        {
            PermissionStatus status = await Permissions.CheckStatusAsync<Permissions.LocationWhenInUse>();

            if (status == PermissionStatus.Granted)
                return status;

            if (status == PermissionStatus.Denied && DeviceInfo.Platform == DevicePlatform.iOS)
            {
                // Prompt the user to turn on in settings
                // On iOS once a permission has been denied it may not be requested again from the application
                return status;
            }

            if (Permissions.ShouldShowRationale<Permissions.LocationWhenInUse>())
            {
                // Prompt the user with additional information as to why the permission is needed
            }

            status = await Permissions.RequestAsync<Permissions.LocationWhenInUse>();

            return status;
        }
        private CancellationTokenSource _cancelTokenSource;
        private bool _isCheckingLocation;

        public async Task<Location> GetCurrentLocation()
        {
            try
            {
                _isCheckingLocation = true;

                GeolocationRequest request = new GeolocationRequest(GeolocationAccuracy.Best, TimeSpan.FromSeconds(10));

                _cancelTokenSource = new CancellationTokenSource();

                Location location = await Geolocation.Default.GetLocationAsync(request, _cancelTokenSource.Token);



                if (location != null)
                    return location;
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
            return null;
        }

        public void CancelRequest()
        {
            if (_isCheckingLocation && _cancelTokenSource != null && _cancelTokenSource.IsCancellationRequested == false)
                _cancelTokenSource.Cancel();
        }
        public static RootObject getAddress(double lat, double lon)
        {
            WebClient webClient = new WebClient();
            webClient.Headers.Add("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.0.3705;)");
            webClient.Headers.Add("Referer", "http://www.microsoft.com");
            var jsonData = webClient.DownloadData("http://nominatim.openstreetmap.org/reverse?format=json&lat=" + lat + "&lon=" + lon);
            DataContractJsonSerializer ser = new DataContractJsonSerializer(typeof(RootObject));
            RootObject rootObject = (RootObject)ser.ReadObject(new MemoryStream(jsonData));
            return rootObject;
        }
    }
    [DataContract]
    public class Address
    {
        [DataMember]
        public string road { get; set; }
        [DataMember]
        public string suburb { get; set; }
        [DataMember]
        public string city { get; set; }
        [DataMember]
        public string state_district { get; set; }
        [DataMember]
        public string state { get; set; }
        [DataMember]
        public string postcode { get; set; }
        [DataMember]
        public string country { get; set; }
        [DataMember]
        public string country_code { get; set; }
    }

    [DataContract]
    public class RootObject
    {
        [DataMember]
        public string place_id { get; set; }
        [DataMember]
        public string licence { get; set; }
        [DataMember]
        public string osm_type { get; set; }
        [DataMember]
        public string osm_id { get; set; }
        [DataMember]
        public string lat { get; set; }
        [DataMember]
        public string lon { get; set; }
        [DataMember]
        public string display_name { get; set; }
        [DataMember]
        public Address address { get; set; }
    }

}
