namespace MayAnhPho.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Rates
    {
        [Key]
        [StringLength(50)]
        public string proID { get; set; }

        public int? rateStar { get; set; }

        public virtual Products Products { get; set; }
    }
}
