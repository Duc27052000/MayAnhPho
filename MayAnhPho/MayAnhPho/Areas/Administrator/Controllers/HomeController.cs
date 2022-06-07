using MayAnhPho.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MayAnhPho.Areas.Administrator.Controllers
{
    public class HomeController : Controller
    {
        Models.AdminContext db = new Models.AdminContext();
        Repository.ShopDAO dao = new Repository.ShopDAO();
        [HandleError]
        public ActionResult Index()
        {
                ProductsDAO proDAO = new ProductsDAO();
                var sanPhamConLai = proDAO.LaySoLuongConLai(5);
                return View();
        }
        public PartialViewResult SanPhamConLai()
        {
            ProductsDAO proDAO = new ProductsDAO();
            ViewBag.sanPhamConLai = proDAO.LaySoLuongConLai(10);
            return PartialView();
        }
        public PartialViewResult SoLuongDonHang()
        {
            OrderDAO orderDAO = new OrderDAO();
            ViewBag.SoLuongDonHang = orderDAO.SoLuongDonHang();
            return PartialView();
        }
        public PartialViewResult TongTien()
        {
            OrderDAO orderDAO = new OrderDAO();
            ViewBag.TongTien = orderDAO.TongTien();
            return PartialView();
        }
        public PartialViewResult DonHangDaGiao()
        {
            OrderDAO orderDAO = new OrderDAO();
            ViewBag.DonHangDaGiao = orderDAO.DonHangDaGiao();
            return PartialView();
        }
        public PartialViewResult TongTienLai()
        {
            OrderDAO orderDAO = new OrderDAO();
            ViewBag.TongTienLai = orderDAO.TongLai();
            return PartialView();
        }
    }
}