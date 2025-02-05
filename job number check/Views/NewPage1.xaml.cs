using Mopups.Pages;
using Mopups.Services;

namespace job_number_check.Views;

public partial class NewPage1 : PopupPage
{
    public NewPage1()
    {
        InitializeComponent();
        BackgroundColor = Color.FromArgb("#80000000");
    }

    private void LoginButton_Clicked(object sender, EventArgs e)
    {
        MopupService.Instance.PopAsync();
    }
}