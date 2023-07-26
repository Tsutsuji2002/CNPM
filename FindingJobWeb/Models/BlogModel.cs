using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FindingJobWeb.Models
{
    public class BlogModel
    {
        public int iId { get; set; }
        public string sTitle { get; set; }
        public string sContent { get; set; }
        public List<string> sCategoryName { get; set; }
        public string sUser { get; set; }
        public string sImage { get; set; }
        public DateTime dtCreateTime { get; set; }
        public DateTime dtUpdateTime { get; set; }
        public int iLike { get; set; }
        public int iComment { get; set; }

    }
}