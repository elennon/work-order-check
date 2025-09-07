

using job_number_check.Models;
using job_number_check.ViewModels;
using System.Collections.ObjectModel;
using System.ComponentModel;

namespace job_number_check.Views;

//static class MyExtensions
//{
//    public static BindingList<T> ToBindingList<T>(this IList<T> source)
//    {
//        return new BindingList<T>(source);
//    }
//}

public partial class ViewJobs : ContentPage
{
    //public IEnumerable<'a>? 
    //public BindingList<T> mks { get; set; } = new List<object>();
    public BasePageViewModel ViewModel { get; set; }
    public List<WorkItem> all { get; set; }
    public int china { get; set; } = 0;
    public DateTime FromD { get; set; } public DateTime ToD { get; set; }
    public ViewJobs()
	{
		InitializeComponent();
        ViewModel = new BasePageViewModel();        
        BindingContext = ViewModel;
        
    }

    protected override async void OnAppearing()
    {
        base.OnAppearing();

        if (china != 0)
        {
            ViewModel.TDT = ToD;
            ViewModel.FDT = FromD;
        }
        else
        {
            int num_days = System.DayOfWeek.Friday - DateTime.Now.DayOfWeek;
            if (num_days < 0) num_days += 7;
            DateTime friday = DateTime.Now.AddDays(num_days);

            ViewModel.TDT = friday;
            ViewModel.FDT = ViewModel.TDT.AddDays(-5);
        }
        all = await App.Database.GetExtrasAsync();
        all = all.Where(x => x.IsGMC == true).ToList();
        ViewModel.Jobs = new System.Collections.ObjectModel.ObservableCollection<WorkItem>(all.Where(a => a.Date >= ViewModel.FDT && a.Date <= ViewModel.TDT));
        var gg = ViewModel.Jobs.GroupBy(x => x.JobPlan).Select(std => new Totals()
        {
            Key = std.Key,
            //Sorting the Students in Each Group based on Name in Ascending order
            JobPlan = std.Key.ToString(),
            Count = std.Count(),
            Value = std.Sum(x => x.Value)
        });
        ViewModel.Totil = gg.Sum(v => v.Value).ToString();
        ViewModel.Totalss = new System.Collections.ObjectModel.ObservableCollection<Totals>();
        foreach (var g in gg)
        {
            ViewModel.Totalss.Add(g);
        }
        fdp.Date = ViewModel.FDT;
        tdp.Date = ViewModel.TDT;
        GMCJobsCheck.IsChecked = true;
    }

    private void tdp_DateSelected(object sender, DateChangedEventArgs e)
    {
        ViewModel.TDT = e.NewDate;
        ViewModel.Jobs = new System.Collections.ObjectModel.ObservableCollection<WorkItem>(all.Where(a => a.Date >= ViewModel.FDT && a.Date <= ViewModel.TDT));
        var gg = ViewModel.Jobs.GroupBy(x => x.JobPlan).Select(std => new Totals()
        {
            Key = std.Key,
            //Sorting the Students in Each Group based on Name in Ascending order
            JobPlan = std.Key.ToString(),
            Count = std.Count(),
            Value = std.Sum(x => x.Value)
        });
        ViewModel.Totil = gg.Sum(v => v.Value).ToString();
        ViewModel.Totalss = new System.Collections.ObjectModel.ObservableCollection<Totals>();
        foreach (var g in gg)
        {
            ViewModel.Totalss.Add(g);
        }
    }

    private void fdp_DateSelected(object sender, DateChangedEventArgs e)
    {
        ViewModel.FDT = e.NewDate;
        ViewModel.Jobs = new System.Collections.ObjectModel.ObservableCollection<WorkItem>(all.Where(a => a.Date >= ViewModel.FDT && a.Date <= ViewModel.TDT));
        var gg = ViewModel.Jobs.GroupBy(x => x.JobPlan).Select(std => new Totals()
        {
            Key = std.Key,
            //Sorting the Students in Each Group based on Name in Ascending order
            JobPlan = std.Key.ToString(),
            Count = std.Count(),
            Value = std.Sum(x => x.Value)
        });
        ViewModel.Totil = gg.Sum(v => v.Value).ToString();
        ViewModel.Totalss = new System.Collections.ObjectModel.ObservableCollection<Totals>();
        foreach (var g in gg)
        {
            ViewModel.Totalss.Add(g);
        }
    }

    private void poopoo_SelectionChanged(object sender, SelectionChangedEventArgs e)
    {
        china++;
        FromD = ViewModel.FDT; ToD = ViewModel.TDT; 
        Totals b = (Totals)poopoo.SelectedItem;
        b.WorkOrders = ViewModel.Jobs.Where(k => k.JobPlan == b.JobPlan).ToList();
        IDictionary<string, object> parms = new Dictionary<string, object>();
        parms.Add(new KeyValuePair<string, object>("StockTake", b));
        Dispatcher.DispatchAsync(async () =>
        {
            await Shell.Current.GoToAsync("viewWorkOrders", parms);
        });
    }

    private async void GMCJobsCheck_CheckedChanged(object sender, CheckedChangedEventArgs e)
    {
        bool isChecked = GMCJobsCheck.IsChecked;
        
        all = await App.Database.GetExtrasAsync();
        all = all.Where(x => x.IsGMC == isChecked).ToList();
        ViewModel.Jobs = new System.Collections.ObjectModel.ObservableCollection<WorkItem>(all.Where(a => a.Date >= ViewModel.FDT && a.Date <= ViewModel.TDT));
        var gg = ViewModel.Jobs.GroupBy(x => x.JobPlan).Select(std => new Totals()
        {
            Key = std.Key,
            //Sorting the Students in Each Group based on Name in Ascending order
            JobPlan = std.Key.ToString(),
            Count = std.Count(),
            Value = std.Sum(x => x.Value)
        });
        ViewModel.Totil = gg.Sum(v => v.Value).ToString();
        ViewModel.Totalss = new System.Collections.ObjectModel.ObservableCollection<Totals>();
        foreach (var g in gg)
        {
            ViewModel.Totalss.Add(g);
        }
        fdp.Date = ViewModel.FDT;
        tdp.Date = ViewModel.TDT;
    }
}