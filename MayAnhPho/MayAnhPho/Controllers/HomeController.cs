using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MayAnhPho.Controllers
{
    public class HomeController : Controller
    {
        // GET: MayAnhPho/Home
        public ActionResult Index()
        {
            return View();
        }
    }
}