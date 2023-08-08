using QuanLyDatVeTau.Helpers;
using QuanLyDatVeTau.Models.DTOs;
using QuanLyDatVeTau.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Mvc;

namespace QuanLyDatVeTau.Controllers
{
    public class AuthCustomerController : Controller
    {
        // GET: Auth
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

            if (login.Status == 1 && login.Role == 2)
            {

                Session["usernameCustomer"] = login.Username;
                Session["roleCustomer"] = login.Role;
                return RedirectToAction("Index", "Home");

            }
            else
            {
                TempData["ErrorMessage"] = "Sai tên đăng nhập hoặc mật khẩu";

                // Chuyển hướng đến trang đăng nhập
                return RedirectToAction("Login");

            }
        }

        // GET: Auth
        public ActionResult Register()
        {
            if (TempData["ErrorMessage"] != null)
            {
                ViewBag.ErrorMessage = TempData["ErrorMessage"];
            }
            return View();
        }

        static bool IsValidVietnamesePhoneNumber(string phoneNumber)
        {
            // Regex pattern cho số điện thoại Việt Nam
            string pattern = @"^(84|0[3|5|7|8|9])+([0-9]{8})\b";

            // Kiểm tra định dạng số điện thoại bằng Regex
            return Regex.IsMatch(phoneNumber, pattern);
        }
        [HttpPost]
        public ActionResult HandleRegister(InfoDTO infoDTO)
        {

            if (!IsValidVietnamesePhoneNumber(infoDTO.Phone))
            {
                TempData["ErrorMessage"] = "Số điện thoại không hợp lệ";

                // Chuyển hướng đến trang đăng nhập
                return RedirectToAction("Register");
            }

            infoDTO.Password = Functions.ToMD5(infoDTO.Password);

            var login = ReadDataSQL.DangKy(infoDTO.Username, infoDTO.Password, infoDTO.Phone, infoDTO.Email, infoDTO.FullName, infoDTO.Gender.ToString());

            if (login.Status == 1)
            {

                // Chuyển hướng đến trang đăng nhập
                return RedirectToAction("Login");

            }
            else
            {
                TempData["ErrorMessage"] = login.Message;

                // Chuyển hướng đến trang đăng nhập
                return RedirectToAction("Register");

            }
        }




        public ActionResult Logout()
        {
            if (Functions.CustomerLogged())
            {
                // Xóa giá trị "username" và "role" của Session
                Session.Remove("usernameCustomer");
                Session.Remove("roleCustomer");
                // Chuyển hướng đến trang đăng nhập hoặc trang chính của ứng dụng
                return RedirectToAction("Index", "Home");
            }
            return RedirectToAction("Index", "Home");

        }
    }


}