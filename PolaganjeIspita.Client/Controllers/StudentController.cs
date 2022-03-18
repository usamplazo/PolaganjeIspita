using System.Collections.Generic;
using System.Web.Mvc;
using PolaganjeIspita.Client.Models;
using PolaganjeIspita.Client.Models.Interfaces;
using PolaganjeIspita.Client.Models.LinqToSqlRepository;

namespace PolaganjeIspita.Client.Controllers
{
    public class StudentController : Controller
    {
        #region Fields

        private IStudentRepository _studentRepository;

        #endregion

        #region Constructors

        public StudentController()
        {
            _studentRepository = new StudentRepository();
        }//ctor()

        #endregion

        // GET: Student
        public ActionResult Index()
        {
            List<StudentBO> studenti = _studentRepository.GetAll();
            return View(studenti);
        }//Index()
        public ActionResult Edit(int id)
        {
            StudentBO student = _studentRepository.GetById(id);
            @ViewBag.Smerovi = _studentRepository.GetAllSmerovi();
            return View(student);
        }//Edit()
        [HttpPost]
        public ActionResult Edit(StudentBO student)
        {
            if (student.Id == 0)
            {
                _studentRepository.Add(student);
            }
            else
            {
                _studentRepository.Update(student);
            }
            return RedirectToAction("Index");
        }//Edit()
        public ActionResult Create()
        {
            @ViewBag.Smerovi = _studentRepository.GetAllSmerovi();
            return View("Edit");
        }//Create()
        public ActionResult Delete(int id)
        {
            StudentBO studentBo = _studentRepository.GetById(id);
            return View(studentBo);
        }//Delete()
        [HttpPost]
        public ActionResult Delete(StudentBO student)
        {
            _studentRepository.Delete(student);
            return RedirectToAction("Index");
        }//Delete()
    }//class
}//namespace