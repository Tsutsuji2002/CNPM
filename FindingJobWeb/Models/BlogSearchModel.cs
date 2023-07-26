using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FindingJobWeb.Models
{
    public class BlogSearchModel
    {
        public string SearchQuery { get; set; }
        public List<BlogModel> MatchingPosts { get; set; }
    }
}