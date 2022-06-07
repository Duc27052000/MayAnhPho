using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MayAnhPho.Areas.Administrator.Controllers
{
    public class ThongKeController : Controller
    {
        // GET: Administrator/ThongKe
        public ActionResult Index()
        {
            return View();
        }
        // GET: Administrator/ThongKe/ChiTietTongTien theo thang
        public ActionResult ChiTietTongTienThang()
        {
            return View();
        }
        // GET: Administrator/ThongKe/ChiTietTonglai theo thang
        public ActionResult ChiTietTongLaiThang()
        {
            return View();
        }
    }
}