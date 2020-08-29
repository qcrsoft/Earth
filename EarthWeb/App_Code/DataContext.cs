using System.Data.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class DataContext : DbContext
{
    public DataContext() : base("DBConnectionString")
    {
        Database.SetInitializer<DataContext>(null);
    }

    protected override void OnModelCreating(DbModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);
        //modelBuilder.Conventions.Remove<OneToManyCascadeDeleteConvention>();
        //modelBuilder.Conventions.Remove<ManyToManyCascadeDeleteConvention>();
        //modelBuilder.Entity<Manager>().Property(x => x.Latitude).HasPrecision(18, 10);
    }

    public DbSet<Manager> Managers { get; set; }
}
