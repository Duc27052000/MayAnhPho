using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace MayAnhPho.Models
{
    public partial class UserContext : DbContext
    {
        public UserContext()
            : base("name=UserContext")
        {
        }

        public virtual DbSet<Categories> Categories { get; set; }
        public virtual DbSet<Customers> Customers { get; set; }
        public virtual DbSet<Nguoidung> Nguoidung { get; set; }
        public virtual DbSet<OrderDetails> OrderDetails { get; set; }
        public virtual DbSet<Orders> Orders { get; set; }
        public virtual DbSet<Producers> Producers { get; set; }
        public virtual DbSet<Products> Products { get; set; }
        public virtual DbSet<ProductTypes> ProductTypes { get; set; }
        public virtual DbSet<PhanQuyen> PhanQuyen { get; set; }
        public virtual DbSet<Rates> Rates { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Customers>()
                .Property(e => e.cusPhone)
                .IsUnicode(false);

            modelBuilder.Entity<Customers>()
                .Property(e => e.cusEmail)
                .IsUnicode(false);

            modelBuilder.Entity<Nguoidung>()
                .Property(e => e.Dienthoai)
                .IsFixedLength();

            modelBuilder.Entity<Nguoidung>()
                .Property(e => e.Matkhau)
                .IsUnicode(false);

            modelBuilder.Entity<OrderDetails>()
                .Property(e => e.orderID)
                .IsUnicode(false);

            modelBuilder.Entity<OrderDetails>()
                .Property(e => e.proID)
                .IsUnicode(false);

            modelBuilder.Entity<Orders>()
                .Property(e => e.orderID)
                .IsUnicode(false);

            modelBuilder.Entity<Orders>()
                .Property(e => e.cusPhone)
                .IsUnicode(false);

            modelBuilder.Entity<Orders>()
                .Property(e => e.orderDateTime)
                .IsUnicode(false);

            modelBuilder.Entity<Orders>()
                .HasMany(e => e.OrderDetails)
                .WithRequired(e => e.Orders)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Producers>()
                .Property(e => e.pdcPhone)
                .IsUnicode(false);

            modelBuilder.Entity<Producers>()
                .Property(e => e.pdcEmail)
                .IsUnicode(false);

            modelBuilder.Entity<Products>()
                .Property(e => e.proID)
                .IsUnicode(false);

            modelBuilder.Entity<Products>()
                .Property(e => e.proUpdateDate)
                .IsUnicode(false);

            modelBuilder.Entity<Products>()
                .HasMany(e => e.OrderDetails)
                .WithRequired(e => e.Products)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Products>()
                .HasOptional(e => e.Rates)
                .WithRequired(e => e.Products);

            modelBuilder.Entity<Rates>()
                .Property(e => e.proID)
                .IsUnicode(false);
        }
    }
}
