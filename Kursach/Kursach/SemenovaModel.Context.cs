﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class Semenova_UniversityKursachEntities : DbContext
    {
        private static Semenova_UniversityKursachEntities _context;
        public static Semenova_UniversityKursachEntities GetContext()
        {
            if (_context == null)
                _context = new Semenova_UniversityKursachEntities();
            return _context;
        }


        public Semenova_UniversityKursachEntities()
            : base("name=Semenova_UniversityKursachEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Faculty> Faculty { get; set; }
        public virtual DbSet<Load> Load { get; set; }
        public virtual DbSet<Pulpit> Pulpit { get; set; }
        public virtual DbSet<Subject> Subject { get; set; }
        public virtual DbSet<Teacher> Teacher { get; set; }
    }
}