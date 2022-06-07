using MayAnhPho.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MayAnhPho.Controllers
{
    public class ThanhToanController : Controller
    {
        UserContext db = new UserContext();
        // GET: MayAnhPho/ThanhToan
        public ActionResult Index()
        {
            List<CartItem> giohang = Session["giohang"] as List<CartItem>;
            return View(giohang);
        }

        [HttpPost]
        public ActionResult StepEnd()
        {
            //Nhận reqest từ trang index
            string phone = Request.Form["phone"];
            string fullname = Request.Form["fullname"];
            string email = Request.Form["email"];
            string address = Request.Form["address"];
            string note = Request.Form["note"];
            //kiểm tra xem có customer chưa và cập nhật lại
            Customers newCus = new Customers();
            var cus = db.Customers.FirstOrDefault(p => p.cusPhone.Equals(phone));
            if (cus != null)
            {
                //nếu có số điện thoại trong db rồi
                //cập nhật thông tin và lưu
                cus.cusFullName = fullname;
                cus.cusEmail = email;
                cus.cusAddress = address;
                db.Entry(cus).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
            }
            else
            {
                //nếu chưa có sđt trong db
                //thêm thông tin và lưu
                newCus.cusPhone = phone;
                newCus.cusFullName = fullname;
                newCus.cusEmail = email;
                newCus.cusAddress = address;
                db.Customers.Add(newCus);
                db.SaveChanges();
            }
            //Thêm thông tin vào order và orderdetail
            List<CartItem> giohang = Session["giohang"] as List<CartItem>;
            //thêm order mới
            Orders newOrder = new Orders();
            string newIDOrder = (Int32.Parse(db.Orders.OrderByDescending(p => p.orderID).FirstOrDefault().orderID.Replace("HD", "")) + 1).ToString();
            newOrder.orderID = "HD" + newIDOrder;
            newOrder.cusPhone = phone;
            newOrder.orderMessage = note;
            newOrder.orderDateTime = DateTime.Now.ToString();
            newOrder.orderStatus = "0";
            db.Orders.Add(newOrder);
            db.SaveChanges();

            //thêm details
            for (int i = 0; i < giohang.Count; i++)
            {
                OrderDetails newOrdts = new OrderDetails();

                newOrdts.orderID = newOrder.orderID;
                newOrdts.proID = giohang.ElementAtOrDefault(i).SanPhamID;
                newOrdts.ordtsQuantity = giohang.ElementAtOrDefault(i).SoLuong;
                newOrdts.ordtsThanhTien = giohang.ElementAtOrDefault(i).ThanhTien;
                db.OrderDetails.Add(newOrdts);
                db.SaveChanges();

                ProductsDAO proDAO = new ProductsDAO();
                Products newPro = new Products();

                var soLuong = proDAO.ListAll().Where(x => x.proID == newOrdts.proID).ToList();
                foreach (var soluong in soLuong)
                {
                    newPro.proID = soluong.proID;
                    newPro.pdcID = soluong.pdcID;
                    newPro.typeID = soluong.typeID;
                    newPro.proName = soluong.proName;
                    newPro.proPrice = soluong.proPrice;
                    newPro.proDiscount = soluong.proDiscount;
                    newPro.proQuantity = soluong.proQuantity - giohang.ElementAtOrDefault(i).SoLuong;
                    newPro.proPhoto = soluong.proPhoto;
                    newPro.proUpdateDate = soluong.proUpdateDate;
                    newPro.proDescription = soluong.proDescription;
                    newPro.proImportPrice = soluong.proImportPrice;
                    proDAO.Update(newPro);
                }
            }
            Session["MHD"] = "HD"+newIDOrder;
            Session["Phone"] = phone;
            //xoá sạch giỏ hàng
            giohang.Clear();
            return RedirectToAction("HoaDon", "ThanhToan");
        }

        public ActionResult HoaDon()
        {
            return View();
        }
    }
}