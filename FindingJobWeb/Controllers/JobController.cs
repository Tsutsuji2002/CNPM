using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FindingJobWeb.Models;
using PagedList.Mvc;
using PagedList;
using System.IO;

namespace FindingJobWeb.Controllers
{
    public class JobController : Controller
    {
        // GET: Job
        FJWebDataContext data = new FJWebDataContext();
        private List<FullJob> GetJob(int count)
        {
            return data.FullJobs.OrderByDescending(a => a.Createdate).Take(count).ToList();
        }
        private List<FullJob> GetJobbyLocation(int count, int location)
        {
            return data.FullJobs.Where(a => a.Location == location).OrderByDescending(a => a.Createdate).Take(count).ToList();
        }
        private List<FullJob> GetJobbyCategory(int count, int category)
        {
            return data.FullJobs.Where(a => a.IndustryID == category).OrderByDescending(a => a.Createdate).Take(count).ToList();
        }
        public ActionResult BannerArea(string title)
        {
            ViewBag.Controller = "Danh sách việc làm";
            ViewBag.title = title;
            return PartialView();
        }
        public ActionResult Index(int? page)
        {
            int pageSize = 6;
            int pageNum = (page ?? 1);
            var lNJob = GetJob(20);
            return View(lNJob.ToPagedList(pageNum, pageSize));
        }
        public ActionResult SearchbyLocation()
        {
            var lLoc = data.JobsbyLocations;
            return PartialView(lLoc);
        }
        public ActionResult JobbyLocation(int? page, int id, string LocationName)
        {
            ViewBag.Location = LocationName;
            int pageSize = 6;
            int pageNum = (page ?? 1);
            var ljobs = GetJobbyLocation(20, id);
            return View(ljobs.ToPagedList(pageNum, pageSize));
        }
        public ActionResult JobbyCategory(int? page, int id, string CategoryName)
        {
            ViewBag.Category = CategoryName;
            int pageSize = 6;
            int pageNum = (page ?? 1);
            var ljobs = GetJobbyCategory(20, id);
            return View(ljobs.ToPagedList(pageNum, pageSize));
        }
        public ActionResult NewJob()
        {
            var lNj = data.NewJobs;
            return PartialView(lNj);
        }
        public ActionResult SearchbyCategory()
        {
            var lCate = data.JobsbyCategories;
            return PartialView(lCate);
        }
        public ActionResult JobDetails(int id)
        {
            var job = data.FullJobs.Where(s => s.JobID == id);
            return View(job.Single());
        }

        // GET: Jobs/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: 
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
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
            ViewBag.Company = new SelectList(data.Companies.ToList().OrderBy(n =>
                n.Name), "CompanyID", "Name", int.Parse(f["iCompanyID"]));
            ViewBag.TypeofJob = new SelectList(data.TypeofJobs.ToList().OrderBy(n =>
            n.TypeName), "JobtypeID", "TypeName", int.Parse(f["iJobtypeID"]));

            if (ModelState.IsValid)
            {
                Job.Name = f["sName"].ToString();
                Job.Description = f["sMoTa"].Replace("<p>", "").Replace("</p>", "\n");
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
                User user = (User)Session["Account"];
                int userID = user.ID;

                Job.UserID = userID;
                    data.Jobs.InsertOnSubmit(Job);
                data.SubmitChanges();

                return RedirectToAction("Index");
            }
            return View(Job);
        }
    }  
}