//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Kursach
{
    using System;
    using System.Collections.Generic;
    
    public partial class Pulpit
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Pulpit()
        {
            this.Subject = new HashSet<Subject>();
            this.Teacher = new HashSet<Teacher>();
        }
    
        public int Pulpit_ID { get; set; }
        public int Faculty_ID { get; set; }
        public string Pulpit_name { get; set; }
        public string FIO_manager { get; set; }
        public string Num_room { get; set; }
        public string Num_korpus { get; set; }
        public string Phone { get; set; }
        public int Kol_teacher { get; set; }
        public string Description { get; set; }
        public string Image { get; set; }
    
        public virtual Faculty Faculty { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Subject> Subject { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Teacher> Teacher { get; set; }
    }
}
