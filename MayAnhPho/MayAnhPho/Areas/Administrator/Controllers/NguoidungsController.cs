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
    public class NguoidungsController : Controller
    {
        private AdminContext db = new AdminContext();

        // GET: Administrator/Nguoidungs
        public ActionResult Index()
        {
                return View(db.Nguoidung.ToList());
        }


        // GET: Administrator/Nguoidungs/Delete/5
        //public ActionResult Delete(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Nguoidung nguoidung = db.Nguoidung.Find(id);
        //    if (nguoidung == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(nguoidung);
        //}

        // POST: Administrator/Nguoidungs/Delete/5
        [HandleError]
        public ActionResult Delete(int id)
        {

                var model = db.Nguoidung.SingleOrDefault(h => h.MaNguoiDung.Equals(id));
                try
                {
                    if (model != null)
                    {
                        db.Nguoidung.Remove(model);
                        db.SaveChanges();
                        return RedirectToAction("Index", "Nguoidungs", new { error = "Xoá thành công." });
                    }
                    else
                    {
                        return RedirectToAction("Index", "Nguoidungs", new { error = "Người dùng không tồn tại." });
                    }
                }
                catch (Exception)
                {
                    return RedirectToAction("Index", "Nguoidungs", new { error = "Không thể xoá người dùng này." });
                }
        }
        public ActionResult Create()
        {
            ViewBag.nguoidungListCreate = new SelectList(db.PhanQuyen, "IDQuyen", "TenQuyen");
            return View();

        }

        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Hoten,Email,Dienthoai,Matkhau,IDQuyen,Diachi")] Administrator.Models.Nguoidung nguoidung)
        {
            ViewBag.nguoidungListCreate = new SelectList(db.PhanQuyen, "IDQuyen", "TenQuyen");
            try
                {
                    if (ModelState.IsValid)
                    {
                        db.Nguoidung.Add(nguoidung);
                        db.SaveChanges();
                    }
                    return RedirectToAction("Index");
                }
                catch (Exception ex)
                {
                    ViewBag.CreateTypeError = "Không thể thêm.";
                    return View(nguoidung);
                }
        }

        // GET: Administrator/Administrators/Edit/5
        public ActionResult Edit(int id)
        {
            ViewBag.nguoidungListEdit = new SelectList(db.PhanQuyen, "IDQuyen", "TenQuyen");
            return View(db.Nguoidung.SingleOrDefault(e => e.MaNguoiDung.Equals(id)));
        }

        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HandleError]
        [HttpPost]
        public ActionResult Edit(Models.Nguoidung editND)
        {
            ViewBag.nguoidungListEdit = new SelectList(db.PhanQuyen, "IDQuyen", "TenQuyen");
            try
            {
                if (ModelState.IsValid)
                {
                    db.Entry(editND).State = System.Data.Entity.EntityState.Modified;
                    db.SaveChanges();
                }
                return RedirectToAction("Index");
            }
            catch (Exception)
            {
                ViewBag.EditTypeError = "Không thể cập nhật.";
            }
            return View();
        }
    }
}
