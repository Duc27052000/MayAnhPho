using MayAnhPho.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MayAnhPho.Models
{
    public class ProductsDAO
    {
        string cs = ConfigurationManager.ConnectionStrings["UserContext"].ConnectionString;
        public List<Products> ListAll()
        {
            List<Products> lst = new List<Products>();
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("SelectSanPham", con);
                com.CommandType = CommandType.StoredProcedure;
                SqlDataReader rdr = com.ExecuteReader();
                while (rdr.Read())
                {
                    lst.Add(new Products
                    {
                        proID = (string)rdr["proID"],
                        pdcID = (int)rdr["pdcID"],
                        typeID = (int)rdr["typeID"],
                        proName = rdr["proName"].ToString(),
                        proPrice = (int)rdr["proPrice"],
                        proDiscount = (int)rdr["proDiscount"],
                        proQuantity = (int)rdr["proQuantity"],
                        proPhoto = rdr["proPhoto"].ToString(),
                        proUpdateDate = rdr["proUpdateDate"].ToString(),
                        proDescription = rdr["proDescription"].ToString(),
                        proImportPrice = (int)rdr["proImportPrice"]
                    });
                }
                return lst;
            }
        }

        public int Update(Products sanp)
        {
            int i;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("InsertUpdateSanPham", con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@proID", sanp.proID);
                com.Parameters.AddWithValue("@pdcID", sanp.pdcID);
                com.Parameters.AddWithValue("@typeID", sanp.typeID);
                com.Parameters.AddWithValue("@proName", sanp.proName);
                com.Parameters.AddWithValue("@proPrice", sanp.proPrice);
                com.Parameters.AddWithValue("@proDiscount", sanp.proDiscount);
                com.Parameters.AddWithValue("@proQuantity", sanp.proQuantity);
                com.Parameters.AddWithValue("@proPhoto", sanp.proPhoto);
                com.Parameters.AddWithValue("@proUpdateDate", sanp.proUpdateDate);
                com.Parameters.AddWithValue("@proDescription", sanp.proDescription);
                com.Parameters.AddWithValue("@proImportPrice", sanp.proImportPrice);
                com.Parameters.AddWithValue("@Action", "Update");
                i = com.ExecuteNonQuery();
            }
            return i;
        }

        public List<Products> LaySoLuongConLai(int top)
        {
            UserContext db = new UserContext();
            return db.Products.Where(x => x.proQuantity > 0).OrderBy(x => x.proQuantity).Take(top).ToList();

        }
    }
}