namespace MayAnhPho.Areas.Administrator.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class OrderDetails
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(20)]
        public string orderID { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(50)]
        public string proID { get; set; }

        public int? ordtsQuantity { get; set; }

        public int? ordtsThanhTien { get; set; }

        public virtual Orders Orders { get; set; }

        public virtual Products Products { get; set; }
    }
}
