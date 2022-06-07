using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using MayAnhPho.Areas.Administrator.Models;

namespace MayAnhPho.Areas.Administrator.Controllers
{
    public class CustomersController : Controller
    {
        private AdminContext dbCus = new AdminContext();

        // GET: Administrator/Customers
        [HandleError]
        public ActionResult Index(string error, string sortOrder, string searchString)
        {
                ViewBag.CusError = error;
                ViewBag.SapTheoTen = String.IsNullOrEmpty(sortOrder) ? "ten_desc" : "";
                ViewBag.SapTheoId = sortOrder == "cusPhone" ? "cusPhone_desc" : "cusPhone";
                var model = dbCus.Customers.ToList();
                if (!String.IsNullOrEmpty(searchString))
                {
                    model = model.Where(p => p.cusPhone.Contains(searchString)).ToList();
                }
                switch (sortOrder)
                {
                    case "ten_desc":
                        model = model.OrderByDescending(s => s.cusFullName).ToList();
                        break;
                    case "cusPhone":
                        model = model.OrderBy(s => s.cusPhone).ToList();
                        break;
                    case "cusPhone_desc":
                        model = model.OrderByDescending(s => s.cusPhone).ToList();
                        break;
                    default:
                        model = model.OrderBy(s => s.cusFullName).ToList();
                        break;
                }
                return View(model);
        }
    }
}