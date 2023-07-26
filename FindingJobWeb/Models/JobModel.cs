using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FindingJobWeb.Models
{
    public class JobModel
    {
        public int JobID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public int CompanyID { get; set; }
        public string Qualification { get; set; }
        public int Experience { get; set; }
        public string Specialization { get; set; }
        public string LastDatetoApply { get; set; }
        public double Salary { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public string Country { get; set; }
        public Company CompanyName { get; set; }
        public TypeofJob TypeName { get; set; }
    }

}