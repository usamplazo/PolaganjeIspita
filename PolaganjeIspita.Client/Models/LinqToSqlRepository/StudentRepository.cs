using System;
using System.Collections.Generic;
using System.Linq;
using PolaganjeIspita.Client.Models.Interfaces;

namespace PolaganjeIspita.Client.Models.LinqToSqlRepository
{
    public class StudentRepository:IStudentRepository
    {
        #region Fields

        private StudentiDataContext _studentiDataContext;

        #endregion
        #region Constructors
        public StudentRepository()
        {
            _studentiDataContext = new StudentiDataContext();
        }//ctor()

        #endregion
        #region Methods
        public List<StudentBO> GetAll()
        {
            List<StudentBO> studenti = new List<StudentBO>();

            foreach (Student student in _studentiDataContext.Students)
            {
                StudentBO studentBo = new StudentBO();
                studentBo.Id = student.StudentID;
                studentBo.Ime = student.Ime;
                studentBo.Prezime = student.Prezime;
                studentBo.GodinaUpisa = student.GodinaUpisa;
                studentBo.Smer = new SmerBO(){Id = student.Smer.SmerID, Naziv = student.Smer.Naziv.Trim()};
                studenti.Add(studentBo);
            }

            return studenti;
        }//GetAll()
        public void Add(StudentBO studentBo)
        {
            Student student = new Student
            {
                Ime = studentBo.Ime,
                Prezime = studentBo.Prezime,
                GodinaUpisa = (short) studentBo.GodinaUpisa,
                SmerID = studentBo.Smer.Id,
                DatumRodjenja = "datum",
                Skolarina = 9,
                StudentID = GetHashCode()
            };
            _studentiDataContext.Students.InsertOnSubmit(student);

            try
            {
                _studentiDataContext.SubmitChanges();
            }
            catch (Exception e)
            {
                Console.WriteLine("Neuspesan insert studenta: " +e);
                throw;
            }
        
        }//Add()
        public StudentBO GetById(int idStudenta)
        {
            Student student = _studentiDataContext.Students.FirstOrDefault(t => t.StudentID == idStudenta);
            StudentBO studentBo = new StudentBO();
            if (student == null) return studentBo;
            studentBo.Id = student.StudentID;
            studentBo.Ime = student.Ime;
            studentBo.Prezime = student.Prezime;
            studentBo.GodinaUpisa = student.GodinaUpisa;
            studentBo.Smer = new SmerBO() { Id = student.Smer.SmerID, Naziv = student.Smer.Naziv };
            return studentBo;
        }//GetById()
        public bool Delete(StudentBO studentBo)
        {
            Student student = _studentiDataContext.Students.FirstOrDefault(t => t.StudentID == studentBo.Id);
            _studentiDataContext.Students.DeleteOnSubmit(student);
                try
                {
                    _studentiDataContext.SubmitChanges();
                    return true;
                }
                catch (Exception e)
                {
                    Console.WriteLine("Student vec postoji u tabeli Prijava: "+e);
                    return false;
                }
        }//Delete()
        public List<SmerBO> GetAllSmerovi()
        {
            List<SmerBO> smerovi = new List<SmerBO>();
            foreach (Smer smer in _studentiDataContext.Smers)
            {
                SmerBO smerBo = new SmerBO(){Id = smer.SmerID, Naziv = smer.Naziv};
                smerovi.Add(smerBo);
            }

            return smerovi;
        }//GetAllSmerovi()
        public void Update(StudentBO studentBo)
        {
            Student studentZaAzuranje = _studentiDataContext.Students.FirstOrDefault(t => t.StudentID == studentBo.Id);
            if (studentZaAzuranje == null) return;
            studentZaAzuranje.Ime = studentBo.Ime;
            studentZaAzuranje.Prezime = studentBo.Prezime;
            studentZaAzuranje.GodinaUpisa = (short) studentBo.GodinaUpisa;
            studentZaAzuranje.SmerID = studentBo.Smer.Id;

            try
            {
                _studentiDataContext.SubmitChanges();
            }
            catch (Exception e)
            {
                Console.WriteLine("Neuspesan update studenta: "+e);
            }
     
        }//Update()

        #endregion
    }//class
}//namespace