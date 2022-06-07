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
    public class CategoriesController : Controller
    {
        private AdminContext dbCate = new AdminContext();

        // GET: Administrator/Categories
        [HandleError]
        public ActionResult Index(string error, string sortOrder, string searchString)
        {
                //Các biến sắp xếp
                ViewBag.SapTheoTen = String.IsNullOrEmpty(sortOrder) ? "ten_desc" : "";
                ViewBag.SapTheoId = sortOrder == "cateID" ? "cateID_desc" : "cateID";
                var model = dbCate.Categories.ToList();
                if (!String.IsNullOrEmpty(searchString))
                {
                    model = model.Where(p => p.cateName.Contains(searchString)).ToList();
                }
                switch (sortOrder)
                {
                    case "ten_desc":
                        model = model.OrderByDescending(s => s.cateName).ToList();
                        break;
                    case "cateID":
                        model = model.OrderBy(s => s.cateID).ToList();
                        break;
                    case "cateID_desc":
                        model = model.OrderByDescending(s => s.cateID).ToList();
                        break;
                    default:
                        model = model.OrderBy(s => s.cateName).ToList();
                        break;
                }
                return View(model);
                //ViewBag.CateError = error;
        }

        [HandleError]
        public ActionResult Create()
        {
                return View();
        }

        [HandleError]
        [HttpPost]
        public ActionResult Create(Models.Categories createCate, HttpPostedFileBase file)
        {
                if (file != null)
                {
                    if (file.ContentLength > 0)
                    {
                        try
                        {
                            string nameFile = Path.GetFileName(file.FileName);
                            file.SaveAs(Path.Combine(Server.MapPath("/Image"), nameFile));
                            createCate.catePhoto = "/Image/" + nameFile;
                        }
                        catch (Exception)
                        {
                            ViewBag.CreateCategory = "Không thể chọn ảnh.";
                        }
                    }
                    try
                    {
                        if (dbCate.Categories.SingleOrDefault(cr => cr.cateName.Equals(createCate.cateName)) == null)
                        {
                            dbCate.Categories.Add(createCate);
                            dbCate.SaveChanges();
                            ViewBag.CreateCategory = "Thêm danh mục thành công.";
                        }
                        else
                        {
                            ViewBag.CreateCategory = "Tên danh mục đã tồn tại.";
                        }
                    }
                    catch (Exception)
                    {
                        ViewBag.CreateCategory = "Không thể thêm danh mục.";
                    }
                }
                else
                {
                    ViewBag.HinhAnh = "Vui lòng chọn hình ảnh.";
                }
                return View();
        }

        [HandleError]
        public ActionResult Edit(int id)
        {
                var model = dbCate.Categories.SingleOrDefault(c => c.cateID.Equals(id));
                return View(model);
        }

        [HandleError]
        [HttpPost]
        public ActionResult Edit(Models.Categories editCate, HttpPostedFileBase file)
        {
                if (file != null)
                {
                    if (file.ContentLength > 0)
                    {
                        try
                        {
                            string nameFile = Path.GetFileName(file.FileName);
                            file.SaveAs(Path.Combine(Server.MapPath("/Image"), nameFile));
                            editCate.catePhoto = "/Image/" + nameFile;
                        }
                        catch (Exception)
                        {
                            ViewBag.EditCategory = "Không thể chọn ảnh.";
                        }
                    }
                }
                try
                {
                    if (ModelState.IsValid)
                    {
                        if (dbCate.Categories.SingleOrDefault(cr => cr.cateName.Equals(editCate.cateName)) == null)
                        {
                            dbCate.Entry(editCate).State = System.Data.Entity.EntityState.Modified;
                            dbCate.SaveChanges();
                            ViewBag.EditCategory = "Cập nhật danh mục thành công.";
                        }
                        else
                        {
                            ViewBag.EditCategory = "Tên danh mục đã tồn tại.";
                        }
                    }
                }
                catch (Exception)
                {
                    ViewBag.EditCategory = "Không thể cập nhật danh mục.";
                }
                return View();
        }

        [HandleError]
        public ActionResult Delete(int id)
        {
                var model = dbCate.Categories.SingleOrDefault(h => h.cateID.Equals(id));
                try
                {
                    if (model != null)
                    {
                        dbCate.Categories.Remove(model);
                        dbCate.SaveChanges();
                        return RedirectToAction("Index", "Categories", new { error = "Xoá danh mục thành công." });
                    }
                    else
                    {
                        return RedirectToAction("Index", "Categories", new { error = "Danh mục không tồn tại." });
                    }
                }
                catch (Exception)
                {
                    return RedirectToAction("Index", "Categories", new { error = "Không thể xoá danh mục." });
                }
        }
    }
}