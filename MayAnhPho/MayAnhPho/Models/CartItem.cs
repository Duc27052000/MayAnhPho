using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MayAnhPho.Models
{
    public class CartItem
    {
        public Products Product { get; set; }
        public string SanPhamID { get; set; }
        public string TenSanPham { get; set; }
        public string Hinh { get; set; }
        public int? DonGia { get; set; }
        public int SoLuong { get; set; }
        public int? ThanhTien
        {
            get
            {
                return SoLuong * DonGia;
            }
        }
    }
}