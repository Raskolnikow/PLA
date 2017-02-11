using System;
using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;


namespace Repeater
{
    public class HomeController : Controller
    {
        Database db = null;

        public IEnumerable<Lerneinheit> Index()
        {
            int numelems = 0;

            try
            {
                db = new Database();
                numelems = db.GetNumberOfElements();
            }
            catch (System.Exception)
            {
                Console.WriteLine("Datenbankfehler");
            }

            //return string.Format("{0} Elemente sind vorhanden", numelems);
            return (db.GetLerneinheiten());
        }

        public IActionResult GetAll()
        {
            Lerneinheit le = null;
            try
            {
                db = new Database();
                le = db.GetOne(1);
            }
            catch (System.Exception)
            {
                Console.WriteLine("Datenbankfehler");
            }

            //return string.Format("{0} Elemente sind vorhanden", numelems);
            return new ObjectResult(le);
        }
    }
}


