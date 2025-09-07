using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//using static Java.Util.Jar.Attributes;

namespace job_number_check.Models
{
    public class WorkItem
    {
        public WorkItem() {}
        public WorkItem(string WoNumber)
        {
            this.WoNumber = WoNumber;
        }
        [PrimaryKey, AutoIncrement]
        public int ID { get; set; }
        public string MyId { get; set; }
        public DateTime Date { get; set; }
        public bool IsGMC { get; set; }

        private string displayDate; // field
        public string DisplayDate   // property
        {
            get { return this.Date.ToShortDateString(); }   // get method
            set { displayDate = this.Date.ToShortDateString(); }  // set method
        }
        public string WoNumber { get; set; }
        public string JobPlan { get; set; }
        public double Value { get; set; }
        public string WorkSheet { get; set; }
        public string Location { get; set; }


        public void AddWorkIrem(DateTime date, string woNumber, string jobPlan, double value)
        {
            Date = date;
            WoNumber = woNumber;
            JobPlan = jobPlan;
            Value = value;
        }

    }

    public class Totals
    { 
        public Totals() { }
        public string Key { get; set; }
        public int Count { get; set; }
        public string JobPlan { get; set; }
        public double Value { get; set; }
        public List<WorkItem> WorkOrders { get; set; }

    } 
}
