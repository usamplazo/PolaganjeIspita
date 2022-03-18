using System.Collections.Generic;

namespace PolaganjeIspita.Client.Models.Interfaces
{
    public interface IStudentRepository
    {
        List<StudentBO> GetAll();
        void Add(StudentBO studentBo);
        StudentBO GetById(int idStudenta);
        bool Delete(StudentBO studentBo);
        void Update(StudentBO studentBo);
        List<SmerBO> GetAllSmerovi();
    }//interface
}//namespace
