using MayAnhPho.Areas.Administrator.Models;
using MayAnhPho.Repository;
using System;
using System.IO;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace MayAnhPho.Models
{
    public class OrderDAO
    {
        string cs = ConfigurationManager.ConnectionStrings["AdminContext"].ConnectionString;
        AdminContext db;
        public OrderDAO()
        {
            db = new AdminContext();
        }
        public int SoLuongDonHang()
        {
            AdminContext db = new AdminContext();
            return db.Orders.Where(x => x.orderID != null).Count();
        }
        public int DonHangDaGiao()
        {
            AdminContext db = new AdminContext();
            return db.Orders.Where(x => x.orderID != null).Count();
        }

        //public List<OrderDetails> ListAllOD()
        //{
        //    List<OrderDetails> lst = new List<OrderDetails>();
        //    using (SqlConnection con = new SqlConnection(cs))
        //    {
        //        con.Open();
        //        SqlCommand com = new SqlCommand("[SelectOrderDetail]", con);
        //        com.CommandType = CommandType.StoredProcedure;
        //        SqlDataReader rdr = com.ExecuteReader();
        //        while (rdr.Read())
        //        {
        //            lst.Add(new OrderDetails
        //            {
        //                orderID = (string)rdr["orderID"],
        //                proID = (string)rdr["proID"],
        //                ordtsQuantity = (int)rdr["ordtsQuantity"],
        //                ordtsThanhTien = (int)rdr["ordtsThanhTien"]
        //            });
        //        }
        //        return lst;
        //    }
        //}

        public decimal? TongTien()
        {
            AdminContext db = new AdminContext();
            return db.OrderDetails.Where(x => x.orderID != null).Sum(x => x.ordtsThanhTien);
        }

        public decimal? TongLai()
        {
            AdminContext db = new AdminContext();
            decimal? sumLai = 0;
            int? sumGoc = 0;
            foreach (var item in db.OrderDetails)
            {
                foreach (var item2 in db.Products)
                {
                    if (item.proID == item2.proID)
                    {
                        sumGoc += item2.proImportPrice * item.ordtsQuantity;
                    }
                }
            }
            sumLai = TongTien() - sumGoc;
            return sumLai;
        }
    }
}