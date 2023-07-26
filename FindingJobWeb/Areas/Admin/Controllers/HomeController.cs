using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FindingJobWeb.Models;
using PagedList;
using PagedList.Mvc;

namespace FindingJobWeb.Areas.Admin.Controllers
{
    //[Area("Admin")]
    public class HomeController : Controller
    {
        FJWebDataContext data = new FJWebDataContext();
        // GET: Admin/Home
        public ActionResult Index(int? page)
        {
            int pageNum = (page ?? 1);
            int pageSize = 7;
            var commap = from j in data.Jobs
                         join jt in data.TypeofJobs on j.Jobtype equals jt.JobtypeID
                         join cp in data.Companies on j.CompanyID equals cp.CompanyID
                         select j;
            return View(commap.OrderByDescending(x => x.Createdate).ToPagedList(pageNum, pageSize));
        }
        // GET: Admin/Home/Create
        public ActionResult Create()
        {
            
            return View();
        }
        // GET: Admin/Home/Create
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(Job Job, FormCollection f)
        {
            //Đưa dữ liệu vào DropDown
            ViewBag.Company = new SelectList(data.Companies.ToList().OrderBy(n => n.CompanyID), "CompanyID", "Name");
            ViewBag.TypeofJob = new SelectList(data.TypeofJobs.ToList().OrderBy(n => n.TypeName), "JobtypeID", "TypeName");

            ViewBag.Name = f["sName"];
            ViewBag.Description = f["sDescription"];
            ViewBag.Qualification = f["sQualification"];
            ViewBag.Experience = f["sExperience"];
            ViewBag.Specialization = f["sSpecialization"];
            ViewBag.LastDatetoApply = DateTime.Parse(f["dtLastDatetoApply"]);
            ViewBag.Salary = f["sSalary"];
            ViewBag.Email = f["sEmail"];
            ViewBag.Address = f["sAddress"];
            ViewBag.Country = f["sCountry"];
            ViewBag.Company = new SelectList(data.Companies.ToList().OrderBy(n => n.Name), "CompanyID", "Name", int.Parse(f["iCompanyID"]));
            ViewBag.TypeofJob = new SelectList(data.TypeofJobs.ToList().OrderBy(n => n.TypeName), "JobtypeID", "TypeName", int.Parse(f["iJobtypeID"]));
            
            if (ModelState.IsValid)
            {                    
                Job.Name = f["sName"].ToString();
                Job.Description = f["sDescription"].Replace("<p>", "").Replace("</p>", "\n");
                Job.Qualification = f["sQualification"].ToString();
                Job.Experience = f["sExperience"].ToString();
                Job.Specialization = f["sSpecialization"].ToString();
                Job.LastDatetoApply = DateTime.Parse(f["dtLastDatetoApply"]);
                Job.Salary = f["sSalary"].ToString();
                Job.Email = f["sEmail"].ToString();
                Job.Address = f["sAddress"].ToString();
                Job.Country = f["sCountry"].ToString();
                Job.Createdate = Convert.ToDateTime(f["dt"]);
                Job.CompanyID = int.Parse(f["iCompanyID"]);
                Job.Jobtype = int.Parse(f["iJobtypeID"]);
                data.Jobs.InsertOnSubmit(Job);
                data.SubmitChanges();

                return RedirectToAction("Index");
            }
            return View(Job);
        }
        // GET: Admin/Home/Edit/5
        public ActionResult Edit(int id)
        {
            var j = data.Jobs.FirstOrDefault(a => a.JobID == id);
            return View(j);
        }

        /// POST: Admin/Home/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, string jobname, string description, string qualification, string experience, string specialization,
            int timetoapply, string salary, int jobtype, int companyID, string email, string address, int location, string country)
        {
            var s = data.Jobs.SingleOrDefault(model => model.JobID == id);
            s.Name = jobname;
            s.Description = description;
            s.Qualification = qualification;
            s.Experience = experience;
            s.Specialization = specialization;
            s.LastDatetoApply = DateTime.Today.AddDays(timetoapply - 1);
            s.Salary = salary;
            s.Jobtype = jobtype;
            s.CompanyID = companyID;
            s.Email = email;
            s.Address = address;
            s.Location = location;
            s.Country = country;
            data.SubmitChanges();

            return View(s);
        }
        // GET: Admin/Home/Delete/(int)
        public ActionResult Delete(int id)
        {
            Job j = data.Jobs.FirstOrDefault(x => x.JobID == id);
            if (j == null)
            {
                return RedirectToAction("Index");
            }

            return View(j);
        }

        // POST: Admin/Home/Delete/(int)
        [HttpPost]
        public ActionResult Delete(int id, bool confirm)
        {
            if (confirm)
            {
                Job j = data.Jobs.FirstOrDefault(x => x.JobID == id);
                data.Jobs.DeleteOnSubmit(j);
                data.SubmitChanges();
            }
            return RedirectToAction("Index");
        }
    }
}