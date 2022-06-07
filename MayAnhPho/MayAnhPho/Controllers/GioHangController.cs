using MayAnhPho.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MayAnhPho.Controllers
{
    public class GioHangController : Controller
    {
        UserContext db = new UserContext();
        // GET: MayAnhPho/GioHang
        public ActionResult Index()
        {
            //Kiểm tra đang đăng nhập
            if (Session["use"] == null || Session["use"].ToString() == "")
            {
                return RedirectToAction("Dangnhap", "User");
            }
            else
            {
                List<CartItem> giohang = Session["giohang"] as List<CartItem>;
                return View(giohang);
            }           

        }
        public ActionResult ThemVaoGio(string SanPhamID)
        {
            //Kiểm tra đang đăng nhập
            if (Session["use"] == null || Session["use"].ToString() == "")
            {
                return RedirectToAction("Dangnhap", "User");
            }
            else
            {
                if (Session["giohang"] == null) // Nếu giỏ hàng chưa được khởi tạo
                {
                    Session["giohang"] = new List<CartItem>();  // Khởi tạo Session["giohang"] là 1 List<CartItem>
                }

                List<CartItem> giohang = Session["giohang"] as List<CartItem>;  // Gán qua biến giohang dễ code

                // Kiểm tra xem sản phẩm khách đang chọn đã có trong giỏ hàng chưa

                if (giohang.FirstOrDefault(m => m.SanPhamID == SanPhamID) == null) // ko co sp nay trong gio hang
                {
                    Models.Products sp = db.Products.Find(SanPhamID);  // tim sp theo sanPhamID

                    CartItem newItem = new CartItem()
                    {
                        SanPhamID = SanPhamID,
                        TenSanPham = sp.proName,
                        SoLuong = 1,
                        Hinh = sp.proPhoto,
                        DonGia = (sp.proPrice - (sp.proPrice * sp.proDiscount) / 100)

                    };  // Tạo ra 1 CartItem mới

                    giohang.Add(newItem);  // Thêm CartItem vào giỏ 
                }
                else
                {
                    // Nếu sản phẩm khách chọn đã có trong giỏ hàng thì không thêm vào giỏ nữa mà tăng số lượng lên.
                    CartItem cardItem = giohang.FirstOrDefault(m => m.SanPhamID == SanPhamID);
                    cardItem.SoLuong++;
                }

                // Action này sẽ chuyển hướng về trang chi tiết sp khi khách hàng đặt vào giỏ thành công. Bạn có thể chuyển về chính trang khách hàng vừa đứng bằng lệnh return Redirect(Request.UrlReferrer.ToString()); nếu muốn.
                return Redirect(Request.UrlReferrer.ToString());
            }
            
        }
        //Sửa số lượng
        public ActionResult SuaSoLuong(string SanPhamID, int soluongmoi)
        {
            // tìm carditem muon sua
            List<CartItem> giohang = Session["giohang"] as List<CartItem>;
            CartItem itemSua = giohang.FirstOrDefault(m => m.SanPhamID.Equals(SanPhamID));
            if (itemSua != null)
            {
                if (soluongmoi < 1 || soluongmoi > 100)
                {

                }
                else
                {
                    @ViewBag.GioError = "";
                    itemSua.SoLuong = soluongmoi;
                }
            }
            return RedirectToAction("Index");

        }
        //Xoá khỏi giỏ
        public ActionResult XoaKhoiGio(string SanPhamID)
        {
            List<CartItem> giohang = Session["giohang"] as List<CartItem>;
            CartItem itemXoa = giohang.FirstOrDefault(m => m.SanPhamID.Equals(SanPhamID));
            if (itemXoa != null)
            {
                giohang.Remove(itemXoa);
            }
            return RedirectToAction("Index");
        }
    }
}