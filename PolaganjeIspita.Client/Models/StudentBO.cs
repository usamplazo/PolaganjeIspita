using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace PolaganjeIspita.Client.Models
{
    public class StudentBO
    {
        #region Properties
        //[Required(ErrorMessage = "Morate selektovati predmet.")]
        public int Id { get; set; }
        [Required(ErrorMessage = "hdjfkjsdfhskdjfds")]
        public string Ime { get; set; }
        public string Prezime { get; set; }
        public int GodinaUpisa { get; set; }
        public SmerBO Smer { get; set; }

        public string ImePrezime
        {
            get { return Ime + " " + Prezime; }
        }

        #endregion

        //public override string ToString()
        //{
        //    return Ime + " " + Prezime;
        //}
    }//class
}//namespace