namespace MayAnhPho.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Products
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Products()
        {
            OrderDetails = new HashSet<OrderDetails>();
        }

        [Key]
        [StringLength(50)]
        public string proID { get; set; }

        public int? pdcID { get; set; }

        public int? typeID { get; set; }

        [StringLength(200)]
        public string proName { get; set; }

        public int? proPrice { get; set; }

        public int? proDiscount { get; set; }

        public int? proQuantity { get; set; }

        public string proPhoto { get; set; }

        [StringLength(50)]
        public string proUpdateDate { get; set; }

        public string proDescription { get; set; }

        public int? proImportPrice { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OrderDetails> OrderDetails { get; set; }

        public virtual Producers Producers { get; set; }

        public virtual ProductTypes ProductTypes { get; set; }

        public virtual Rates Rates { get; set; }
    }
}
