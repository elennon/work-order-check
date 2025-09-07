
//using Android.Telecom;
using OfficeOpenXml;
using job_number_check.Models;
using job_number_check.ViewModels;
using Microsoft.Maui.Animations;
using Mopups.Services;
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
        all = await ReadExcell(path);       
        FileName.Text = Path.GetFileName(path);
        poopo.ItemsSource = workSheets;
        SaveToDBs();
    }

    private async Task<List<WorkItem>> ReadExcell(string path)
    {
        List<WorkItem> workItems = new List<WorkItem>();
        double totul = 0;
        ExcelPackage.License.SetNonCommercialPersonal("Eddie Lennon");
        byte[] bin = File.ReadAllBytes(path);
        using (MemoryStream stream = new MemoryStream(bin))
            try
            {
                using (ExcelPackage excelPackage = new ExcelPackage(stream))
                {
                    //ExcelWorksheet worksheet = workbook.Worksheets.FirstOrDefault();
                    foreach (var worksheet in excelPackage.Workbook.Worksheets)
                    {
                        int cnt = 0;
                        int cont = 0;
                        //ExcelWorksheet worksheet = workbook.Worksheets[0];

                        // Display sheet's name.
                        Console.WriteLine("{1} {0} {1}\n", worksheet.Name, new string('#', 30));
                        workSheets.Add(worksheet.Name);
                        int ruw = 0;


                        ExcelCellAddress start = worksheet.Dimension.Start;
                        ExcelCellAddress end = worksheet.Dimension.End;
                        for (int row = 1; row <= end.Row; row++)
                        {
                            var rw = worksheet.Cells[string.Format("{0}:{0}", row)];
                            // just an example, you want to know if all cells of this row are empty
                            //bool allEmpty = rw.FirstOrDefault(c => string.IsNullOrWhiteSpace(c.Text));
                            var g = worksheet.Cells[row, start.Column];
                            if (g.Text.ToString() == "")
                            {
                                cont++; continue; // skip this row
                            }
                            if (g.Text.ToString() == "ACTUAL FINISH DATE")
                            {
                                break;
                            }
                        }
                        cont = cont + 2;
                        DateTime previusDt = new DateTime();
                        for (int row = cont; row <= end.Row; row++)
                        {
                            cnt++;
                            var HU = worksheet.Cells[row, 4].Text;
                            if (worksheet.Cells[row, start.Column].Text == "" && worksheet.Cells[row, 2].Text == "" && worksheet.Cells[row, 4].Text == "")
                            {
                                break;
                            }
                            WorkItem wi = new WorkItem();
                            wi.WorkSheet = worksheet.Name;

                            for (int col = start.Column; col <= end.Column; col++)
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
                                        else if(worksheet.Cells[row, col - 1].Text != "")
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
                                            wi.Value = result;
                                        }
                                        break;
                                }
                            }
                            wi.IsGMC = true;
                            workItems.Add(wi);
                            totul += wi.Value;
                            var gg = cont;
                            Console.WriteLine();
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
                Value = std.Sum(x => x.Value)
            });
            ViewModel.Totil = gg.Sum(v => v.Value).ToString();
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