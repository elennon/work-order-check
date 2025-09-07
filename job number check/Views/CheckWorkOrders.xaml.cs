
//using Android.Telecom;
using OfficeOpenXml;
using job_number_check.Models;
using job_number_check.ViewModels;
using Microsoft.Maui.Animations;
using Mopups.Services;
using System.Diagnostics.Metrics;
//using static Android.InputMethodServices.Keyboard;
using System.Collections.Generic;
//using ClosedXML.Excel;

namespace job_number_check.Views;

public partial class CheckWorkOrders : ContentPage
{
    DateTime From = new DateTime();
    DateTime To = new DateTime();
    List<string> workSheets = new List<string>();
    List<int> strings = new List<int>();
    public BasePageViewModel ViewModel { get; set; } = new BasePageViewModel();
    public List<WorkItem> all { get; set; }
    public CheckWorkOrders()
	{
		InitializeComponent();
        BindingContext = ViewModel;
    }
    protected override void OnAppearing()
    {
        //From = new DateTime();
        //To = new DateTime();
        //workSheets = new List<string>();
        //strings = new List<int>();
        //ViewModel = new BasePageViewModel();
    }

    private async void Button_Clicked(object sender, EventArgs e)
    {
        var results = await FilePicker.PickMultipleAsync(new PickOptions{});
        if(results == null) { return; }
        var path = results.First().FullPath;
        workSheets.Clear();
        //var single = GetFirstWs(path);
        all = await App.Database.GetExtrasAsync();
        var wss = await App.Database.GetWorksheetsAsync();
        workSheets.AddRange(wss.Select(x => x.WorkSheetName).ToList());
        var ail = await ReadExcell(path);
        all.AddRange(ail);       
        FileName.Text = Path.GetFileName(path);
        poopo.ItemsSource = workSheets;
        SaveToDBs();
    }

    private async Task<List<WorkItem>> ReadExcell(string path)
    {
        List<WorkItem> workItems = new List<WorkItem>();
        List<Worksheet> wkSheets = await App.Database.GetWorksheetsAsync();
        double totul = 0;
        ExcelPackage.License.SetNonCommercialPersonal("Eddie Lennon");
        byte[] bin = File.ReadAllBytes(path);
        using (MemoryStream stream = new MemoryStream(bin))
            try
            {
                using (ExcelPackage excelPackage = new ExcelPackage(stream))
                {                   
                    for (int ws = 0; ws <= excelPackage.Workbook.Worksheets.Count(); ws++)
                    {
                        int cnt = 0;
                        int cont = 0;
                        DateTime previusDt = new DateTime();
                        var worksheet = excelPackage.Workbook.Worksheets[ws];
                        
                        if (wkSheets.Select(x => x.WorkSheetName).ToList().Contains(worksheet.Name) == false)
                        {
                            await App.Database.SaveWorksheetAsync(new Worksheet(worksheet.Name));
                        }
                        else { break; }
                        workSheets.Add(worksheet.Name);
                        for (int row = 10; row <= worksheet.Rows.Count(); row++)
                        {
                            var hen = worksheet.Rows.Count();
                            cnt++;
                            var HU = worksheet.Cells[row, 4].Text;
                            if (worksheet.Cells[row, 1].Text == "" && worksheet.Cells[row, 2].Text == "" && worksheet.Cells[row, 4].Text == "")
                            {
                                cont++;
                                continue; //break;
                            }
                            WorkItem wi = new WorkItem();
                            wi.WorkSheet = worksheet.Name;

                            for (int col = 1; col <= 6; col++)
                            { // ... Cell by cell...
                                var cell = worksheet.Cells[row, col]; // This got me the actual value I needed.
                                string columnName = new string(worksheet.Cells[row, col].Address.TakeWhile(char.IsLetter).ToArray());
                                switch (columnName)
                                {
                                    case "A":
                                        if (cell.Text != "")
                                        {
                                            var tme = cell.Text;
                                            var dd = tme.Split('.')[0];
                                            if (dd.ToCharArray().Count() == 1)
                                            {
                                                dd = "0" + dd;
                                            }
                                            var mm = tme.Split('.')[1];
                                            if (mm.ToCharArray().Count() == 1)
                                            {
                                                mm = "0" + mm;
                                            }
                                            var dt = dd + '-' + mm + '-' + tme.Split(".")[2];
                                            wi.Date = DateTime.ParseExact(dt, "dd-MM-yy",
                                               System.Globalization.CultureInfo.InvariantCulture);
                                            previusDt = wi.Date;
                                        }
                                        else
                                        {
                                            wi.Date = previusDt;
                                        }
                                        break;
                                    case "B":
                                        wi.WoNumber = cell.Text.ToString();
                                        break;
                                    case "C":
                                        if (cell.Text != "")
                                        {
                                            wi.JobPlan = cell.Text.ToString();
                                        }
                                        else if (worksheet.Cells[row, col - 1].Text != "")
                                        {
                                            wi.JobPlan = worksheet.Cells[row, col - 1].Text;
                                        }
                                        else if (worksheet.Cells[row, col + 1].Text != "")
                                        {
                                            wi.JobPlan = worksheet.Cells[row, col + 1].Text;
                                        }
                                        //wi.JobPlan = (cell.Text != "") ? cell.Text.ToString() : worksheet.Cells[row, col -1].Text;
                                        break;
                                    case "F":
                                        if (double.TryParse(cell.Text.ToString(), out double result))
                                        {
                                            wi.Value = Math.Round(result, 2) ;
                                        }
                                        break;
                                }
                            }
                            wi.IsGMC = true;
                            workItems.Add(wi);
                            totul += wi.Value;
                        }
                    }
                        
                    
                    //SortWorkOrders(workItems);
                }
            }
            catch (Exception ex)
            {
                // Code to handle the exception
            }

        var ft = totul;
        return workItems;
    }

    private async Task<List<WorkItem>> SortWorkOrders(List<WorkItem> workItems)
    {

        List<WorkItem> missed = new List<WorkItem> ();
        var db = await App.Database.GetExtrasAsync();
        var wobd = db.Where(s => s.Date >= From && s.Date <= To).Select(k => k.WoNumber).ToList();

        /////////////////////////// no no no
        //wobd.Add(777777777);
        var j = workItems.Select(n => n.WoNumber).ToList();
        foreach (var snif in wobd)
        {
            if (!j.Contains(snif))
            {
                missed.Add(new WorkItem(snif));
            }
        }
        return missed;
    }

    private async void ToolbarItem_Clicked(object sender, EventArgs e)
    {       
        IDictionary<string, object> parms = new Dictionary<string, object>();
        var y = await SortWorkOrders(ViewModel.Jobs.ToList());
        parms.Add(new KeyValuePair<string, object>("StockTake", y));
        await Dispatcher.DispatchAsync(async () =>
        {
            await Shell.Current.GoToAsync("viewMissedWOs", parms);
        });
    }

    private async void poopo_SelectedIndexChanged(object sender, EventArgs e)
    {       
        var picker = (Picker)sender;
        int selectedIndex = picker.SelectedIndex;
        string qq = "";
        if (selectedIndex != -1)
        {
            qq = picker.Items[selectedIndex];
            var hh = all.Where(x => x.WorkSheet == qq);
            //var gh = qq.Trim().Split('&');
            //var n = gh.FirstOrDefault().Split('.');
            //var k = n.FirstOrDefault() + "/" + n.LastOrDefault() + "/" + DateTime.Now.Year.ToString();
            //var w = DateTime.Parse(k);
            //From = w.AddDays(-4);

            //n = gh.LastOrDefault().Split('.');
            //k = n.FirstOrDefault() + "/" + n.LastOrDefault() + "/" + DateTime.Now.Year.ToString();
            //To = DateTime.Parse(k);
            //From = w.AddDays(-4);       
            ViewModel.Jobs = new System.Collections.ObjectModel.ObservableCollection<WorkItem>(hh);
            var gg = ViewModel.Jobs.GroupBy(x => x.JobPlan).Select(std => new Totals()
            {
                Key = std.Key,
                //Sorting the Students in Each Group based on Name in Ascending order
                JobPlan = std.Key.ToString(),
                Count = std.Count(),
                Value = Math.Round(std.Sum(x => x.Value), 2) 
            });
            ViewModel.Totil = Math.Round(gg.Sum(v => v.Value), 2).ToString();
            ViewModel.Totalss = new System.Collections.ObjectModel.ObservableCollection<Totals>();
            foreach (var g in gg)
            {
                ViewModel.Totalss.Add(g);
            }
            var ghghhg = ViewModel.Totalss;
        }       
    }

    private async void SaveToDBs()
    {
        var dbs = await App.Database.GetExtrasAsync();
        if (dbs.Count() > 0)
        {
            if (all.Count > dbs.Count())
            {
                var tosave = all.Take(all.Count - dbs.Count());
                foreach (var item in tosave)
                {
                    await App.Database.SaveExtraAsync(item);
                }
            }
        }
        else
        {
            foreach (var item in all)
            {
                await App.Database.SaveExtraAsync(item);
            }
        }
        var hu = all.Where(h => h.JobPlan == "Ballybough Outage 2025");
        var d = hu.Count();
    }
}