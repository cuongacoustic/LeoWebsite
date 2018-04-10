using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebSite.Models;

namespace WebSite.Controllers
{
    public class SearchController : Controller
    {
        // GET: Search       
            DBWatchEntities db = new DBWatchEntities();
            // GET: Search
            public ActionResult KetQuaSearch(string f, int? page)
            {



                var product = from s in db.Products select s;
                //phan trang
                //  int pageNumber = page ?? 1;
                // var pageSize = 6;


                if (!String.IsNullOrEmpty(f))
                {
                    product = product.Where(s => s.ProName.Contains(f));
                }
                // return View(product.OrderBy(n=>n.ProName).ToPagedList(pageNumber,pageSize));
                return View(product.ToList());
            }
        }
}