using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace PolaganjeIspita.Client.Models
{
    public class PrijavaIspitaBO
    {
        public int Id { get; set; }
        public int Ocena { get; set; }
        public PredmetBO Predmet { get; set; }
        public StudentBO Student { get; set; }
    }//class
}//namespace

