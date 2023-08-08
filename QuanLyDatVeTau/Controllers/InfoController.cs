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
    public class InfoController : Controller
    {
        // GET: Info
        public ActionResult Index()
        {
            if (!Functions.CustomerLogged())
            {

                return Redirect("/AuthCustomer/Login");
            }

            InfoDTO infoDTO = ReadDataSQL.ThongTinCaNhan(Session["usernameCustomer"].ToString());
            ViewBag.infoDTO = infoDTO;
            return View();
        }
    }
}