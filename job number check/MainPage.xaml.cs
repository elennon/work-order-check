
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
    }
}
