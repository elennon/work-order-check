using job_number_check.Models;

namespace job_number_check.Views;

[QueryProperty(nameof(StockTake), "StockTake")]
public partial class ViewMissed : ContentPage
{
    List<WorkItem> stockTake;
    public List<WorkItem> StockTake
    {
        get => stockTake;
        set
        {
            stockTake = value;
            OnPropertyChanged();
        }
    }
    //public List<WorkItem> Wos { get; set; } = new List<WorkItem>();
    public ViewMissed()
	{
		InitializeComponent();
	}
    protected override void OnAppearing()
    {                
        BindingContext = this;
    }
}