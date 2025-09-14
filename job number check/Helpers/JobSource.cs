using job_number_check.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace job_number_check.Helpers
{
    public static class jobsSource
    {
        private static Random Random = new Random();

        public static InvoiceModel GetInvoiceDetails()
        {
            return new InvoiceModel
            {
                InvoiceNumber = 5,
                IssueDate = DateTime.Now,
                SellerAddress = GetmyAddress(),
                CustomerAddress = GetGmcAddress(),

                //Items = GetJobs(),
                //Comments = Placeholders.Paragraph()
            };
        }

        

        private static Address GetmyAddress()
        {
            return new Address
            {
                CompanyName = "Eddie Lennon",
                Street = "Kilmacredock,",
                City = "Maynooth, Co. Kildare",
                Mobile = "087 6493789",
                Email = "elennon@outlook.ie",
                Vat = "6924965W"
            };
        }
        private static Address GetGmcAddress()
        {
            return new Address
            {
                CompanyName = "GMC Civil & Mechanical Engineering Ltd,",
                Street = "GMC House,",
                City = "Millennium Business Park,",
                Mobile = "Cappagh Road,",
                Email = "Ballycoolin,",
                Vat = "Dublin 11."
            };
        }
    }
}
