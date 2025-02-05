using job_number_check.Models;

namespace job_number_check
{
    public partial class App : Application
    {
        static DataBase database;
        //public static bool IsUserLoggedIn { get; set; }
        //Application.Current.Properties["IsLoggedIn"] = Boolean.TrueString;

        // Create the database connection as a singleton.
        public static DataBase Database
        {
            get
            {
                if (database == null)
                {
                    database = new DataBase(Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData), "Extras.db3"));
                }
                return database;
            }
        }
        public App()
        {
            InitializeComponent();

            MainPage = new AppShell();
        }
    }
}
