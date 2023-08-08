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
    public class TicketController : Controller
    {
        // GET: Search
        //LoaiVe=MotChieu&startStation=1&endStation=1&startDate=05%2F08%2F2023
        public ActionResult Search(string LoaiVe, string startStation, string endStation, string startDate, string endDate)
        {

            if (LoaiVe == "MotChieu")
            {
                startDate = Functions.FormatDateMMDDYY(startDate);
                var chieuDi = ReadDataSQL.TimKiemLichTrinh(startDate, startStation, endStation);
                ViewBag.ChieuDi = chieuDi;
                ViewBag.HideKhuHoi = true;

            }
            if (LoaiVe == "KhuHoi")
            {
                startDate = Functions.FormatDateMMDDYY(startDate);
                var chieuDi = ReadDataSQL.TimKiemLichTrinh(startDate, startStation, endStation);
                ViewBag.ChieuDi = chieuDi;

                endDate = Functions.FormatDateMMDDYY(endDate);
                var chieuVe = ReadDataSQL.TimKiemLichTrinh(endDate, endStation, startStation);
                ViewBag.ChieuVe = chieuVe;

            }
            var gaTau = ReadDataSQL.LayDanhSachGaTau();
            ViewBag.GaDi = gaTau.First(item => item.MaGaTau.ToString() == startStation).TenGa;
            ViewBag.GaVe = gaTau.First(item => item.MaGaTau.ToString() == endStation).TenGa;

            return View();
        }


        public ActionResult Detail(int id)
        {


            try
            {
                if (!Functions.CustomerLogged())
                {

                    return Redirect($"/AuthCustomer/Login");
                }
                var data = ReadDataSQL.LayChiTietLichTrinh(id);
                if (data == null || data.LichTrinh == null || data.LoaiGhe == null || data.ThongTinGhe == null)
                {
                    ViewBag.Error = "Lỗi server: Lịch trình không hợp lệ";
                    return View();
                }

                ViewBag.Data = data;
                return View();
            }
            catch (Exception ex)
            {
                ViewBag.Error = "Lỗi server: " + ex.Message;
                return View();
            }
        }


        public ActionResult Checkout(int id)
        {


            try
            {
                if (!Functions.CustomerLogged())
                {

                    return Redirect($"/AuthCustomer/Login");
                }
                var data = ReadDataSQL.LayChiTietLichTrinh(id);
                if (data == null || data.LichTrinh == null || data.LoaiGhe == null || data.ThongTinGhe == null)
                {
                    ViewBag.Error = "Lỗi server: Lịch trình không hợp lệ";
                    return View();
                }
                InfoDTO infoDTO = ReadDataSQL.ThongTinCaNhan(Session["usernameCustomer"].ToString());
                ViewBag.infoDTO = infoDTO;
                ViewBag.Data = data;
                return View();
            }
            catch (Exception ex)
            {
                ViewBag.Error = "Lỗi server: " + ex.Message;
                return View();
            }
        }


        public ActionResult BookingSuccess(int id)
        {


            try
            {
                if (!Functions.CustomerLogged())
                {

                    return Redirect($"/AuthCustomer/Login");
                }
                var data = ReadDataSQL.ThongTinVe(id);
                ViewBag.data = data;
                return View();
            }
            catch (Exception ex)
            {
                ViewBag.Error = "Lỗi server: " + ex.Message;
                return View();
            }
        }

        public JsonResult XuLyDatVe(DatVeDTO datVe)
        {
            try
            {
                string username = Session["userNameCustomer"].ToString();
                double TongTien = datVe.TongTien;
                int SoVe = datVe.Tickets.Count();
                int MaLichTrinh = datVe.MaLichTrinh;

                var datVeRes = ReadDataSQL.DatVe(username, TongTien, SoVe);
                string maDateVe = datVeRes.Id;
                List<object> data = new List<object>();
                datVe.Tickets.ForEach(t =>
                {
                    var res = ReadDataSQL.ChiTietDatVe(MaLichTrinh, maDateVe, t.GiaVe, t.MaGhe);
                    data.Add(res);
                });

                return Json(new { maDateVe, error = 1, message = "Thành công" }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { data = "", error = 1, message = ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }


    }
}