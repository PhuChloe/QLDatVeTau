using QuanLyDatVeTau.Helpers;
using QuanLyDatVeTau.Models.DTOs;
using QuanLyDatVeTau.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuanLyDatVeTau.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {

            var today = Functions.FormatDateMMDDYY(DateTime.Now.ToString());
            var data = ReadDataSQL.LichTrinhHomNay();

            ViewBag.GaTau = ReadDataSQL.LayDanhSachGaTau();
            ViewBag.LichTrinhHomNay = data;
            ViewBag.Today = today;

            return View();
        }




    }
}