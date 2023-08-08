using QuanLyDatVeTau.Helpers;
using QuanLyDatVeTau.Models.DTOs;
using QuanLyDatVeTau.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuanLyDatVeTau.Areas.Admin.Controllers
{
    public class AuthController : Controller
    {
        /// GET: Auth
        public ActionResult Login()
        {
            if (TempData["ErrorMessage"] != null)
            {
                ViewBag.ErrorMessage = TempData["ErrorMessage"];
            }
            return View();
        }

        [HttpPost]
        public ActionResult HandleLogin(UserLogin userLogin)
        {

            userLogin.Password = Functions.ToMD5(userLogin.Password);
            var login = ReadDataSQL.DangNhap(userLogin.Username, userLogin.Password);

            if (login.Status == 1 && login.Role == 1)
            {
                Session["usernameAdmin"] = login.Username;
                Session["roleAdmin"] = login.Role; //1 là admin 2 là customer

                // Chuyển hướng đến trang chủ của ứng dụng
                return RedirectToAction("Index", "Dashboard");
            }
            else
            {
                TempData["ErrorMessage"] = "Sai tên đăng nhập hoặc mật khẩu";

                // Chuyển hướng đến trang đăng nhập
                return RedirectToAction("Login");

            }
        }

        public ActionResult Logout()
        {
            if (Functions.CheckLoginStatus() != 0)
            {
                // Xóa giá trị "username" và "role" của Session
                Session.Remove("usernameAdmin");
                Session.Remove("roleAdmin");
                // Chuyển hướng đến trang đăng nhập hoặc trang chính của ứng dụng
                return RedirectToAction("Login");
            }
            return RedirectToAction("Login");

        }



    }
}