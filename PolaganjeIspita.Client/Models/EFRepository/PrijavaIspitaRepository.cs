using System;
using System.Collections.Generic;
using System.Linq;
using PolaganjeIspita.Client.Models.Interfaces;

namespace PolaganjeIspita.Client.Models.EFRepository
{
    public class PrijavaIspitaRepository:IPrijavaIspitaRepository
    {
       private StEntities studentiEntities = new StEntities();

        #region Methods
        public IEnumerable<PredmetBO> GetAllPredmeti()
        {
            List<PredmetBO> predmeti = new List<PredmetBO>();

                foreach (PredmetModel predmet in studentiEntities.Predmet)
                {
                    PredmetBO predmetBo = new PredmetBO();
                    predmetBo.Id = predmet.PredmetID;
                    predmetBo.Naziv = predmet.Naziv;
                    predmeti.Add(predmetBo);
                }

            return predmeti;
        }//GetAllPredmeti()
        public IEnumerable<PrijavaIspitaBO> GetAll()
        {
            List<PrijavaIspitaBO> prijaveIspita = new List<PrijavaIspitaBO>();
            foreach (PrijavaModel prijavaModel in studentiEntities.Prijava)
            {
                PrijavaIspitaBO prijavaIspitaBo = new PrijavaIspitaBO();
                prijavaIspitaBo.Ocena = prijavaModel.Ocena;
                prijavaIspitaBo.Predmet = new PredmetBO()
                {
                    Id = prijavaModel.Predmet.PredmetID,
                    Naziv = prijavaModel.Predmet.Naziv
                };
                prijavaIspitaBo.Student = new StudentBO()
                {
                    Id = prijavaModel.Student.StudentID,
                   Ime = prijavaModel.Student.Ime,
                   Prezime = prijavaModel.Student.Prezime,
                   Smer = new SmerBO()
                   {
                       Id = prijavaModel.Student.Smer.SmerID,
                       Naziv = prijavaModel.Student.Smer.Naziv,
                   }
                };

                prijaveIspita.Add(prijavaIspitaBo);
            }
            return prijaveIspita;
        }//GetAll()
        public IEnumerable<PrijavaIspitaBO> GetByPredmetId(int predmetId)
        {
            List<PrijavaIspitaBO> prijaveIspita = new List<PrijavaIspitaBO>();
            foreach (PrijavaModel prijavaModel in studentiEntities.Prijava.Where(t=>t.PredmetID == predmetId))
            {
                PrijavaIspitaBO prijavaIspitaBo = new PrijavaIspitaBO();
                prijavaIspitaBo.Ocena = prijavaModel.Ocena;
                prijavaIspitaBo.Predmet = new PredmetBO()
                {
                    Id = prijavaModel.Predmet.PredmetID,
                    Naziv = prijavaModel.Predmet.Naziv
                };
                prijavaIspitaBo.Student = new StudentBO()
                {
                    Id = prijavaModel.Student.StudentID,
                    Ime = prijavaModel.Student.Ime,
                    Prezime = prijavaModel.Student.Prezime,
                    Smer = new SmerBO()
                    {
                        Id = prijavaModel.Student.Smer.SmerID,
                        Naziv = prijavaModel.Student.Smer.Naziv,
                    }
                };

                prijaveIspita.Add(prijavaIspitaBo);
            }
            return prijaveIspita;
        }//GetByPredmetId()
        public IEnumerable<PrijavaIspitaBO> GetByStudentId(int studentId)
        {
            List<PrijavaIspitaBO> prijaveIspita = new List<PrijavaIspitaBO>();
            foreach (PrijavaModel prijavaModel in studentiEntities.Prijava.Where(t=>t.StudentID==studentId))
            {
                PrijavaIspitaBO prijavaIspitaBo = new PrijavaIspitaBO();
                prijavaIspitaBo.Ocena = prijavaModel.Ocena;
                prijavaIspitaBo.Predmet = new PredmetBO()
                {
                    Id = prijavaModel.Predmet.PredmetID,
                    Naziv = prijavaModel.Predmet.Naziv
                };
                prijavaIspitaBo.Student = new StudentBO()
                {
                    Id = prijavaModel.Student.StudentID,
                    Ime = prijavaModel.Student.Ime,
                    Prezime = prijavaModel.Student.Prezime,
                    Smer = new SmerBO()
                    {
                        Id = prijavaModel.Student.Smer.SmerID,
                        Naziv = prijavaModel.Student.Smer.Naziv,
                    }
                };

                prijaveIspita.Add(prijavaIspitaBo);
            }
            return prijaveIspita;
        }//GetByStudentId()
        public void Add(PrijavaIspitaBO prijavaIspita)
        {
            PrijavaModel prijavaModel = new PrijavaModel();
            prijavaModel.StudentID = prijavaIspita.Student.Id;
            prijavaModel.PredmetID = prijavaIspita.Predmet.Id;
            prijavaModel.Ocena = prijavaIspita.Ocena;
            studentiEntities.Prijava.Add(prijavaModel);
            studentiEntities.SaveChanges();
        }//Add()
        public void Update(PrijavaIspitaBO prijavaIspita)
        {
            throw new NotImplementedException();
        }//Update()
        #endregion
    }//class
}//namsepace