using System.Web.Mvc;
using PolaganjeIspita.Client.Models.EFRepository;
using PolaganjeIspita.Client.Models.Interfaces;

namespace PolaganjeIspita.Client.Controllers
{
    public class PrijavaIspitaController : Controller
    {
        #region Fields

        private IPrijavaIspitaRepository _prijavaIspitaRepository;

        #endregion

        #region Constructors
        public PrijavaIspitaController()
        {
            _prijavaIspitaRepository = new PrijavaIspitaRepository();
        }//.ctor()
        #endregion

        #region Methods

        public ActionResult Index()
        {
            ViewBag.Predmeti = _prijavaIspitaRepository.GetAllPredmeti();
            return View();
        }//Index()
        public ActionResult GetIspiteByPredmet(int id)
        {

            if (id == 0)
            {
                return PartialView("ListaIspita", _prijavaIspitaRepository.GetAll());
            }

            return PartialView("ListaIspita", _prijavaIspitaRepository.GetByPredmetId(id));

        }//GetIspiteByPredmet()
        public ActionResult GetIspiteByStudent(int id)
        {
            return PartialView("ListaIspita", _prijavaIspitaRepository.GetByStudentId(id));

        }//GetIspiteByStudent()


        #endregion

    }//class
}//namespace