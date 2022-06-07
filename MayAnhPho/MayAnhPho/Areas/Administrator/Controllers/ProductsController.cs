using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using MayAnhPho.Areas.Administrator.Models;

namespace MayAnhPho.Areas.Administrator.Controllers
{
    public class ProductsController : Controller
    {
        private AdminContext dbPro = new AdminContext();

        // GET: Administrator/Products
        [HandleError]
        public ActionResult Index(string error, string sortOrder, string searchString)
        {
                ViewBag.ProError = error;
                ViewBag.SapTheoTen = String.IsNullOrEmpty(sortOrder) ? "ten_desc" : "";
                ViewBag.SapTheoId = sortOrder == "proID" ? "proID_desc" : "proID";
                var model = dbPro.Products.ToList();
                if (!String.IsNullOrEmpty(searchString))
                {
                    model = model.Where(p => p.proName.Contains(searchString)).ToList();
                }
                switch (sortOrder)
                {
                    case "ten_desc":
                        model = model.OrderByDescending(s => s.proName).ToList();
                        break;
                    case "proID":
                        model = model.OrderBy(s => s.proID).ToList();
                        break;
                    case "proID_desc":
                        model = model.OrderByDescending(s => s.proID).ToList();
                        break;
                    default:
                        model = model.OrderBy(s => s.proName).ToList();
                        break;
                }
                return View(model);
        }

        [HandleError]
        [HttpGet]
        public ActionResult Create()
        {
                ViewBag.pdcListCreate = new SelectList(dbPro.Producers, "pdcID", "pdcName");
                ViewBag.typeListCreate = new SelectList(dbPro.ProductTypes, "typeID", "typeName");
                return View();
        }

        [HandleError]
        [HttpPost]
        public ActionResult Create(Models.Products createPro, HttpPostedFileBase file)
        {
                ViewBag.pdcListCreate = new SelectList(dbPro.Producers, "pdcID", "pdcName");
                ViewBag.typeListCreate = new SelectList(dbPro.ProductTypes, "typeID", "typeName");
                var pro = dbPro.Products.SingleOrDefault(c => c.proID.Equals(createPro.proID));
                if (file != null)
                {
                    if (file.ContentLength > 0)
                    {
                        try
                        {
                            string nameFile = Path.GetFileName(file.FileName);
                            file.SaveAs(Path.Combine(Server.MapPath("/Image"), nameFile));
                            createPro.proPhoto = "/Image/" + nameFile;
                        }
                        catch (Exception)
                        {
                            ViewBag.CreateProError = "Không thể chọn ảnh.";
                        }
                    }
                    createPro.proUpdateDate = DateTime.Now.ToString();
                    try
                    {
                        if (pro != null)
                        {
                            ViewBag.CreateProError = "Mã sản phẩm đã tồn tại.";
                        }
                        else
                        {
                            dbPro.Products.Add(createPro);
                            dbPro.SaveChanges();
                            ViewBag.CreateProError = "Thêm sản phẩm thành công.";
                        }
                    }
                    catch (Exception)
                    {
                        ViewBag.CreateProError = "Không thể thêm sản phẩm.";
                    }
                }
                else
                {
                    ViewBag.HinhAnh = "Vui lòng chọn hình ảnh.";
                }
                return View();
        }

        [HandleError]
        [HttpGet]
        public ActionResult Edit(string id)
        {
                ViewBag.pdcListEdit = new SelectList(dbPro.Producers, "pdcID", "pdcName");
                ViewBag.typeListEdit = new SelectList(dbPro.ProductTypes, "typeID", "typeName");
                var model = dbPro.Products.SingleOrDefault(p => p.proID.Equals(id));
                return View(model);
        }

        [HandleError]
        [HttpPost]
        public ActionResult Edit(Models.Products editPro, HttpPostedFileBase file)
        {
                ViewBag.pdcListEdit = new SelectList(dbPro.Producers, "pdcID", "pdcName");
                ViewBag.typeListEdit = new SelectList(dbPro.ProductTypes, "typeID", "typeName");
                if (file != null)
                {
                    if (file.ContentLength > 0)
                    {
                        try
                        {
                            string nameFile = Path.GetFileName(file.FileName);
                            file.SaveAs(Path.Combine(Server.MapPath("/Image"), nameFile));
                            editPro.proPhoto = "/Image/" + nameFile;
                        }
                        catch (Exception)
                        {
                            ViewBag.EditProError = "Không thể chọn ảnh.";
                        }
                    }
                }
                editPro.proUpdateDate = DateTime.Now.ToString();
                try
                {
                    dbPro.Entry(editPro).State = System.Data.Entity.EntityState.Modified;
                    dbPro.SaveChanges();
                    ViewBag.EditProError = "Cập nhật sản phẩm thành công.";
                }
                catch (Exception)
                {
                    ViewBag.EditProError = "Không thể cập nhật sản phẩm.";
                }
                return View();
        }

        [HandleError]
        public ActionResult Delete(string id)
        {
                var model = dbPro.Products.SingleOrDefault(h => h.proID.Equals(id));
                try
                {
                    if (model != null)
                    {
                        dbPro.Products.Remove(model);
                        dbPro.SaveChanges();
                        return RedirectToAction("Index", "Products", new { error = "Xoá sản phẩm thành công." });
                    }
                    else
                    {
                        return RedirectToAction("Index", "Products", new { error = "Sản phẩm không tồn tại." });
                    }
                }
                catch (Exception)
                {
                    return RedirectToAction("Index", "Products", new { error = "Không thể xoá sản phẩm." });
                }
        }

        public ActionResult Details(string id)
        {
                var model = dbPro.Products.SingleOrDefault(p => p.proID.Equals(id));
                return View(model);
        }
    }
}