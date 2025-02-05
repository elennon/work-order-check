//using Java.Lang.Reflect;
//using static Android.Provider.Telephony;
using job_number_check.Models;
using job_number_check.Helpers;

namespace job_number_check.Views;

[QueryProperty(nameof(StockTake), "StockTake")]
public partial class ViewWOs : ContentPage
{
    Totals stockTake;
    public Totals StockTake
    {
        get => stockTake;
        set
        {
            stockTake = value;
            OnPropertyChanged();
        }
    }
    public List<WorkItem> Wos { get; set; } = new List<WorkItem>();
    public ViewWOs()
	{
		InitializeComponent();
	}
    protected override async void OnAppearing()
    {
        //Wos = await App.Database.GetExtrasAsync();
        //poopoo.ItemsSource = StockTake.WorkOrders.Select(std => new
        //{
        //    Key = std.WoNumber,
        //    Date = std.Date.ToShortDateString()
        //}).ToList().ToBindingList();
        Wos = StockTake.WorkOrders.OrderByDescending(s => s.Date).ToList();
        BindingContext = this;
    }
    
}