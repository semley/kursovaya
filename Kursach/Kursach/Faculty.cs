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
    using System.Linq;

    public partial class Faculty
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Faculty()
        {
            this.Pulpit = new HashSet<Pulpit>();
        }

        public int Faculty_ID { get; set; }
        public string Faculty_name { get; set; }
        public string FIO_decan { get; set; }
        public string Num_room { get; set; }
        public int Num_korpus { get; set; }
        public string Phone { get; set; }
        public string Description { get; set; }
        public string Image { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Pulpit> Pulpit { get; set; }



        public int PulpitCount
        {
            get
            {
                var pulpits = Pulpit.Where(p => p.Faculty_ID == Faculty_ID).ToList();

                // Return the count of Pulpits
                return pulpits.Count;

            }


        }
    }
}
