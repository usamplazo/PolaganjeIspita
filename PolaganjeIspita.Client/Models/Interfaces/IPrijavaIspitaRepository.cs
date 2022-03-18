using System.Collections.Generic;

namespace PolaganjeIspita.Client.Models.Interfaces
{
    public interface IPrijavaIspitaRepository
    {
        IEnumerable<PredmetBO> GetAllPredmeti();
        IEnumerable<PrijavaIspitaBO> GetAll();
        IEnumerable<PrijavaIspitaBO> GetByPredmetId(int predmetId);
        IEnumerable<PrijavaIspitaBO> GetByStudentId(int studentId);
        void Add(PrijavaIspitaBO prijavaIspita);
        void Update(PrijavaIspitaBO prijavaIspita);
    }//interface
}//namespace
