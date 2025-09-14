using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace job_number_check.Models
{
    public class InvoiceModel
    {
        public int InvoiceNumber { get; set; }
        public DateTime IssueDate { get; set; }

        public Address SellerAddress { get; set; }
        public Address CustomerAddress { get; set; }

        public List<WorkItem> Items { get; set; }
        public string Comments { get; set; }
    }

    //public class WorkItem
    //{
    //    public WorkItem(int quantity, string jobPlan, double value)
    //    {
    //        Quantity = quantity;
    //        this.JobPlan = jobPlan;
    //        this.Value = value;
    //    }
    //    public int Quantity { get; set; }
    //    public string JobPlan { get; set; }
    //    public double Value { get; set; }

    //    public double LineTotal { get; set; }
    //}

    public class Address
    {
        public string CompanyName { get; set; }
        public string Street { get; set; }
        public string City { get; set; }
        public string Mobile { get; set; }
        public string Email { get; set; }
        public string Vat { get; set; }
    }
}
