using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using job_number_check.Models;

namespace job_number_check.ViewModels
{
    public class BasePageViewModel : INotifyPropertyChanged
    {
        private ObservableCollection<Totals> myCollection;

        public ObservableCollection<Totals> Totalss
        {
            get
            {
                return myCollection;
            }
            set
            {
                myCollection = value;
                NotifyPropertyChanged();
            }
        }
        private ObservableCollection<WorkItem> jobs;

        public ObservableCollection<WorkItem> Jobs
        {
            get
            {
                return jobs;
            }
            set
            {
                jobs = value;
                NotifyPropertyChanged();
            }
        }
        private string totil;

        public string Totil
        {
            get
            {
                return totil;
            }
            set
            {
                totil = value;
                NotifyPropertyChanged();
            }
        }

        private DateTime fdt;

        public DateTime FDT
        {
            get
            {
                return fdt;
            }
            set
            {
                fdt = value;
                NotifyPropertyChanged();
            }
        }
        private DateTime tdt;

        public DateTime TDT
        {
            get
            {
                return tdt;
            }
            set
            {
                tdt = value;
                NotifyPropertyChanged();
            }
        }

        #region INotifyPropertyChanged  
        public event PropertyChangedEventHandler PropertyChanged;
        protected void NotifyPropertyChanged([CallerMemberName] string propertyName = "")
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
        #endregion      
    }
}