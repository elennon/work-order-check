using job_number_check.Views;
namespace job_number_check
{
    public partial class AppShell : Shell
    {
        public Dictionary<string, Type> Routes { get; private set; } = new Dictionary<string, Type>();
        public AppShell()
        {
            InitializeComponent();
            RegisterRoutes();
        }
        void RegisterRoutes()
        {
            Routes.Add("mainPage", typeof(MainPage));
            Routes.Add("viewJobs", typeof(Views.ViewJobs));
            Routes.Add("viewWorkOrders", typeof(Views.ViewWOs));
            Routes.Add("checkWorkOrders", typeof(Views.CheckWorkOrders));
            Routes.Add("viewMissedWOs", typeof(Views.ViewMissed));

            foreach (var item in Routes)
            {
                Routing.RegisterRoute(item.Key, item.Value);
            }
        }
    }
}
