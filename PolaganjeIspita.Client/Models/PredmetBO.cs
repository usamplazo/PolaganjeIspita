using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace PolaganjeIspita.Client.Models
{
    public class PredmetBO
    {
        //[Required(ErrorMessage = "Morate selektovati predmet.")]
        public int Id { get; set; }
        public string Naziv { get; set; }
    }//class
}//namespace