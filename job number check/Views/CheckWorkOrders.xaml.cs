
using Android.Telecom;
using GemBox.Spreadsheet;
using job_number_check.Models;
using job_number_check.ViewModels;
using Microsoft.Maui.Animations;

namespace job_number_check.Views;

public partial class CheckWorkOrders : ContentPage
{
    
    List<string> workSheets = new List<string>();
    List<int> strings = new List<int>();
    public BasePageViewModel ViewModel { get; set; } = new BasePageViewModel();
    public List<WorkItem> all { get; set; }
    public CheckWorkOrders()
	{
		InitializeComponent();
        BindingContext = ViewModel;
    }

    private async void Button_Clicked(object sender, EventArgs e)
    {
        var results = await FilePicker.PickMultipleAsync(new PickOptions{});
        var path = results.First().FullPath;
        all = ReadExcelForJason(path);
        FileName.Text = Path.GetFileName(path);
        poopo.ItemsSource = workSheets;        
    }

    
    public List<WorkItem> ReadExcelForJason(string selectedFilePath)
    {
        SpreadsheetInfo.SetLicense("FREE-LIMITED-KEY");

        // Load Excel workbook from file's path.
        ExcelFile workbook = ExcelFile.Load(selectedFilePath);

        List<WorkItem> workItems = new List<WorkItem>();

        //ExcelWorksheet worksheet = workbook.Worksheets.FirstOrDefault();
        foreach (var worksheet in workbook.Worksheets)
        {
            int cnt = 0;
            int cont = 0;
            //ExcelWorksheet worksheet = workbook.Worksheets[0];

            // Display sheet's name.
            Console.WriteLine("{1} {0} {1}\n", worksheet.Name, new string('#', 30));
            workSheets.Add(worksheet.Name);
            foreach (ExcelRow row in worksheet.Rows)
            {
                if (row.Cells[0].Value == null)
                {
                    cont++;
                    continue;
                }
                if (row.Cells[0].Value.ToString() == "ACTUAL FINISH DATE")
                {
                    break;
                }
            }

            // Iterate through all rows in a worksheet.
            foreach (ExcelRow row in worksheet.Rows.Where(line => line.Index > cont))
            {
                cnt++;
                if (row.Cells[0].Value == null)
                {
                    break;
                }

                WorkItem wi = new WorkItem();
                wi.WorkSheet = worksheet.Name;
                foreach (ExcelCell cell in row.AllocatedCells)
                {
                    switch (cell.Column.Name)
                    {
                        case "A":
                            wi.Date = DateTime.Parse(cell.Value?.ToString());
                            break;
                        case "B":
                            wi.WoNumber = int.Parse(cell.Value?.ToString());
                            break;
                        case "C":
                            wi.JobPlan = cell.Value?.ToString();
                            break;
                        case "F":
                            if (double.TryParse(cell.Value?.ToString(), out double result))
                            {
                                wi.Value = result;
                            }
                            break;
                    }
                }
                workItems.Add(wi);

                Console.WriteLine();
            }
        }
        //SortWorkOrders(workItems);
        return workItems;
    }

    private async void SortWorkOrders(List<WorkItem> workItems)
    {
        
        var all = await App.Database.GetExtrasAsync();
        foreach (var workItem in workItems)
        {
            if (!all.Contains(workItem))
            {
                strings.Add(workItem.WoNumber);
            }
        }
        //poo.ItemsSource = strings;
    }

    private void ToolbarItem_Clicked(object sender, EventArgs e)
    {
        
        IDictionary<string, object> parms = new Dictionary<string, object>();
        parms.Add(new KeyValuePair<string, object>("StockTake", ViewModel.Jobs.ToList()));
        Dispatcher.DispatchAsync(async () =>
        {
            await Shell.Current.GoToAsync("viewMissedWOs", parms);
        });
    }

    private void poopo_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        var picker = (Picker)sender;
        int selectedIndex = picker.SelectedIndex;
        string qq = "";
        if (selectedIndex != -1)
        {
            qq = picker.Items[selectedIndex];
        }
        var hh = all.Where(x => x.WorkSheet == qq);
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
    }
}