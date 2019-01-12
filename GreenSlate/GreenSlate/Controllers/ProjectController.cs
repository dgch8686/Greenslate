using GreenSlate.BusinessLogic;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace GreenSlate.Controllers
{
    public class ProjectController : Controller
    {
        public DataAccess dataAccess = new DataAccess();
        // GET: Project
        public ActionResult Index()
        {
            ViewBag.Users = dataAccess.GetUser();
            return View();
        }



        public JsonResult GetProjects(string sidx, string sord,int userID)
        {
            var list = dataAccess.GetProjects(userID);
            var output = JsonConvert.SerializeObject(list);

            var jsonData = new
            {
                rows = list
            };
            return Json(jsonData, JsonRequestBehavior.AllowGet);
        }
    }
}