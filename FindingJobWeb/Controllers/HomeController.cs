using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using FindingJobWeb.Models;

namespace FindingJobWeb.Controllers
{
    public class HomeController : Controller
    {
        FJWebDataContext data = new FJWebDataContext();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult NavPartial()
        {
            var navList = data.Navigations;
            return PartialView(navList);
        }
        public ActionResult FeaturesPartial()
        {
            var fList = data.Feature_areas;
            return PartialView(fList);
        }
        public ActionResult NewJobs()
        {
            var njList = data.NewJobs;
            return PartialView(njList);
        }
        public ActionResult LoginLogoutPartial()
        {
            return PartialView();
        }
    }
}