using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FindingJobWeb.Models;
using PagedList;
using PagedList.Mvc;

namespace FindingJobWeb.Controllers
{
    public class BlogController : Controller
    {
        FJWebDataContext data = new FJWebDataContext();
        private List<Blog> GetPost(int count)
        {
            return data.Blogs.OrderByDescending(a => a.created_at).Take(count).ToList();
        }
        private List<Blog_category> GetCategory(int id)
        {
            return data.Blog_categories.Where(a => a.ID == id).ToList();
        }
        private List<BlogModel>GetPostbyCategory(int count, int id)
        {
            var viewModel = new List<BlogModel>();

            using (var context = new FJWebDataContext())
            {
                var blogs = from b in context.Blogs
                            join bcmap in context.Blog_category_mappings on b.ID equals bcmap.post_ID
                            join c in context.Blog_categories on bcmap.category_ID equals c.ID
                            where c.ID == id
                            group c by b into g
                            select new
                            {
                                Blog = g.Key,
                                Categories = g.Select(c => c.name)
                            };

                foreach (var blog in blogs)
                {
                    viewModel.Add(new BlogModel
                    {
                        iId = blog.Blog.ID,
                        sTitle = blog.Blog.Title,
                        sContent = blog.Blog.Content,
                        sCategoryName = blog.Categories.ToList(),
                        sImage = blog.Blog.image,
                        dtCreateTime = (DateTime)blog.Blog.created_at,
                        dtUpdateTime = (DateTime)blog.Blog.updated_at,
                        iLike = blog.Blog.likes,
                        iComment = blog.Blog.comments

                    });
                }
            }
            return viewModel.ToList();
        }
        public ActionResult BannerArea(string title)
        {
            ViewBag.Controller = "Danh sách bài viết";
            ViewBag.title = title;
            return PartialView();
        }
        public List<BlogModel> GetViewModel()
        {
            var viewModel = new List<BlogModel>();

            using (var context = new FJWebDataContext())
            {
                var blogs = from b in context.Blogs
                            join bcmap in context.Blog_category_mappings on b.ID equals bcmap.post_ID
                            join c in context.Blog_categories on bcmap.category_ID equals c.ID
                            group c by b into g
                            select new
                            {
                                Blog = g.Key,
                                Categories = g.Select(c => c.name)
                            };

                foreach (var blog in blogs)
                {
                    viewModel.Add(new BlogModel
                    {
                        iId = blog.Blog.ID,
                        sTitle = blog.Blog.Title,
                        sContent = blog.Blog.Content,
                        sCategoryName = blog.Categories.ToList(),
                        sImage = blog.Blog.image,
                        dtCreateTime = (DateTime)blog.Blog.created_at,
                        dtUpdateTime = (DateTime)blog.Blog.updated_at,
                        iLike = blog.Blog.likes,
                        iComment = blog.Blog.comments

                    });
                }
            }
            return viewModel.ToList();
        }
        // GET: Blog
        public ActionResult Index(int? page)
        {

            int pageSize = 6;
            int pageNum = (page ?? 1);
            var viewModel = GetViewModel();

            return View(viewModel.ToPagedList(pageNum, pageSize));
        }
        public ActionResult BlogDetails(int id)
        {   
            using (var context = new FJWebDataContext())
            {
                var blog = (from b in context.Blogs
                            where b.ID == id
                            join bcmap in context.Blog_category_mappings on b.ID equals bcmap.post_ID
                            join c in context.Blog_categories on bcmap.category_ID equals c.ID
                            join bl in context.Blog_likes on b.ID equals bl.post_ID into blogLikes
                            from bl in blogLikes.DefaultIfEmpty()
                            join bc in context.Blog_comments on b.ID equals bc.post_ID into blogComments
                            from bc in blogComments.DefaultIfEmpty()
                            group new { c, bl, bc } by b into g
                            select new
                            {
                                Blog = g.Key,
                                Categories = g.Select(x => x.c.name),
                                Likes = g.Count(x => x.bl != null),
                                Comments = g.Count(x => x.bc != null)
                            }).FirstOrDefault();

                if (blog != null)
                {
                    var viewModel = new BlogModel
                    {
                        iId = blog.Blog.ID,
                        sTitle = blog.Blog.Title,
                        sContent = blog.Blog.Content,
                        sCategoryName = blog.Categories.ToList(),
                        sImage = blog.Blog.image,
                        dtCreateTime = (DateTime)blog.Blog.created_at,
                        dtUpdateTime = (DateTime)blog.Blog.updated_at,
                        iLike = blog.Likes,
                        iComment = blog.Comments
                    };
                    return View(viewModel);
                }
                else
                {
                    return RedirectToAction("Index");
                }
            }
        }
        public ActionResult SearchResults(int? page, string search)
        {
            int pageSize = 6;
            int pageNum = (page ?? 1);
            ViewBag.Search = search;
            //var matchingPosts = data.Blogs.Where(p => p.Title.Contains(search) || p.Content.Contains(search)).ToList();
            List<BlogModel> matchingPosts;

            if (!string.IsNullOrEmpty(search))
            {
                matchingPosts = GetViewModel().Where(p => p.sTitle.Contains(search) || p.sContent.Contains(search)).ToList();
            }
            else
            {
                ViewBag.Search = " Không có kết quả phù hợp!";
                // If search is null or empty, return all blog posts
                matchingPosts = GetViewModel().ToList();
            }
            var viewModel = new BlogSearchModel { SearchQuery = search, MatchingPosts = matchingPosts };

            return View("SearchResults", viewModel.MatchingPosts.ToPagedList(pageNum, pageSize));
        }
        public ActionResult SearchbyCategory()
        {
            var lCate = data.PostsbyCategories;
            return PartialView(lCate);
        }
        public ActionResult PostsbyCategory(int? page, int id, string CategoryName)
        {
            ViewBag.Category = CategoryName;
            int pageSize = 6;
            int pageNum = (page ?? 1);
            var ljobs = GetPostbyCategory(20, id);
            return View(ljobs.ToPagedList(pageNum, pageSize));
        }
        public ActionResult Protfolio()
        {
            return PartialView();
        }
    }
}