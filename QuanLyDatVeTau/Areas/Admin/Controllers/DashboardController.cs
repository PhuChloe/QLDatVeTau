using QuanLyDatVeTau.Helpers;
using QuanLyDatVeTau.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuanLyDatVeTau.Areas.Admin.Controllers
{
    public class DashboardController : Controller
    {
        // GET: Admin/Dashboard
        public ActionResult Index()
        {
            if (!Functions.AdminLogged())
            {

                return Redirect("/Admin/Auth/Login");
            }

            return View();
        }


        public ActionResult LichTrinh()
        {
            if (!Functions.AdminLogged())
            {

                return Redirect("/Admin/Auth/Login");
            }

            return View();
        }
        public ActionResult ThemLichTrinh()
        {
            if (!Functions.AdminLogged())
            {

                return Redirect("/Admin/Auth/Login");
            }

            return View();
        }


        public ActionResult GaTau()
        {
            if (!Functions.AdminLogged())
            {

                return Redirect("/Admin/Auth/Login");
            }

            return View();
        }



        [HttpGet]
        public JsonResult LayLichTrinh()
        {
            try
            {
                var lichTrinh = ReadDataSQL.LayDanhSachLichTrinh();
                return Json(lichTrinh, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(ex.Message, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpGet]
        public JsonResult LayGaTau()
        {
            try
            {
                var gaTau = ReadDataSQL.LayDanhSachGaTau();
                return Json(gaTau, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(ex.Message, JsonRequestBehavior.AllowGet);
            }
        }






    }
}