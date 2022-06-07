using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;

namespace MayAnhPho.Controllers
{
    public class ProductsController : Controller
    {
        Models.UserContext db = new Models.UserContext();
        // GET: FANAshop/Products
        //hiển thị sản phẩm theo id loại
        public ActionResult ProductsByProType(int id, int? page)
        {
            ViewBag.typeName = db.ProductTypes.SingleOrDefault(t => t.typeID == id).typeName;
            int pageSize = 8;
            int pageNumber = (page ?? 1);
            return View(db.Products.Where(t => t.typeID == id).OrderByDescending(x => x.typeID).ToPagedList(pageNumber, pageSize));
        }
        //hiển thị sản phẩm theo id nhà sản xuất
        public ActionResult ProductsByPdc(int id, int? page)
        {
            ViewBag.pdcName = db.Producers.SingleOrDefault(c=>c.pdcID == id).pdcName;
            int pageSize = 8;
            int pageNumber = (page ?? 1);
            return View(db.Products.Where(p => p.pdcID == id).OrderByDescending(x=>x.pdcID).ToPagedList(pageNumber, pageSize));
        }
        //hiển thị sản phẩm theo tên sp
        public ActionResult SearchByName(string name, int? page)
        {
            ViewBag.search = name;
            int pageSize = 8;
            int pageNumber = (page ?? 1);
            return View(db.Products.Where(p => p.proName.Contains(name)).OrderByDescending(x => x.proName).ToPagedList(pageNumber, pageSize));
        }
        //hiển thị sản phẩm theo tên loại
        public ActionResult ProductsBytypeName(string name, int? page)
        {
            ViewBag.tName = name;
            int pageSize = 8;
            int pageNumber = (page ?? 1);
            return View(db.Products.Where(p => p.typeID == db.ProductTypes.FirstOrDefault(t=>t.typeName.Equals(name)).typeID).OrderByDescending(x => x.proUpdateDate).ToPagedList(pageNumber, pageSize));
        }
        //Hiển thị sản phẩm mới nhất
        public ActionResult ProductsBestNew(string title, int? page)
        {
            ViewBag.titleDisplay = title;
            int pageSize = 8;
            int pageNumber = (page ?? 1);
            return View(db.Products.OrderByDescending(x => x.proUpdateDate).ToPagedList(pageNumber, pageSize));
        }
        //Hiển thị sản phẩm giá thấp nhất
        public ActionResult ProductsBestDiscount(string title, int? page)
        {
            ViewBag.titleDisplayOfDis = title;
            int pageSize = 8;
            int pageNumber = (page ?? 1);
            return View(db.Products.OrderByDescending(x => x.proDiscount).ToPagedList(pageNumber, pageSize));
        }
        //Hiển thị chi tiết sản phẩm
        public ActionResult ProductDetail(string id)
        {
            return View(db.Products.SingleOrDefault(p => p.proID.Equals(id)));
        }
    }
}