using System.Collections.Generic;

namespace PolaganjeIspita.Client.Models
{
    public class SmerBO
    {
        #region MyRegion

        #endregion
        #region Properties

        public string Naziv { get; set; }
        public int Id { get; set; }

        #endregion

        public override string ToString()
        {
            return Naziv;
        }
    }//class
}//namespace