//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PolaganjeIspita.Client.Models.EFRepository
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class StEntities : DbContext
    {
        public StEntities()
            : base("name=StEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<PredmetModel> Predmet { get; set; }
        public virtual DbSet<PrijavaModel> Prijava { get; set; }
        public virtual DbSet<SmerModel> Smer { get; set; }
        public virtual DbSet<StudentModel> Student { get; set; }
    
        public virtual ObjectResult<Ispiti_Result> Ispiti()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Ispiti_Result>("Ispiti");
        }
    
        public virtual ObjectResult<ProfQuery_Result> ProfQuery(string prof)
        {
            var profParameter = prof != null ?
                new ObjectParameter("Prof", prof) :
                new ObjectParameter("Prof", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<ProfQuery_Result>("ProfQuery", profParameter);
        }
    
        public virtual ObjectResult<spIspiti_Result> spIspiti()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<spIspiti_Result>("spIspiti");
        }
    
        public virtual ObjectResult<spJedanPredmet_Result> spJedanPredmet(string predmetId)
        {
            var predmetIdParameter = predmetId != null ?
                new ObjectParameter("predmetId", predmetId) :
                new ObjectParameter("predmetId", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<spJedanPredmet_Result>("spJedanPredmet", predmetIdParameter);
        }
    
        public virtual ObjectResult<spSviPredmeti_Result> spSviPredmeti()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<spSviPredmeti_Result>("spSviPredmeti");
        }
    }
}
