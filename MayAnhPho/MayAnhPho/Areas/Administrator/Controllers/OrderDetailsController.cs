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
    public class OrderDetailsController : Controller
    {
        private AdminContext dbOrDe = new AdminContext();

        // GET: Administrator/OrderDetails
        [HandleError]
        public ActionResult Index(string error, string sortOrder, string searchString)
        {
                ViewBag.ProError = error;
                ViewBag.SapTheoId = sortOrder == "orderID" ? "orderID_desc" : "orderID";
                var model = dbOrDe.OrderDetails.ToList();
                if (!String.IsNullOrEmpty(searchString))
                {
                    model = model.Where(p => p.orderID.Contains(searchString)).ToList();
                }
                switch (sortOrder)
                {
                    case "orderID_desc":
                        model = model.OrderByDescending(s => s.orderID).ToList();
                        break;
                    default:
                        model = model.OrderBy(s => s.orderID).ToList();
                        break;
                }
                return View(model);
        }

        [HandleError]
        public ActionResult Delete(int id)
        {
                var model = dbOrDe.OrderDetails.SingleOrDefault(h => h.orderID.Equals(id));
                try
                {
                    if (model != null)
                    {
                        dbOrDe.OrderDetails.Remove(model);
                        dbOrDe.SaveChanges();
                        return RedirectToAction("Index", "OrderDetails", new { error = "Xoá thành công." });
                    }
                    else
                    {
                        return RedirectToAction("Index", "OrderDetails", new { error = "không tồn tại." });
                    }
                }
                catch (Exception)
                {
                    return RedirectToAction("Index", "OrderDetails", new { error = "Không thể xoá." });
                }
        }
    }
}