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
    public class QuanLyTauController : Controller
    {
        // GET: Admin/QuanLyTau
        public ActionResult DanhSachTau()
        {
            if (!Functions.AdminLogged())
            {

                return Redirect("/Admin/Auth/Login");
            }

            return View();
        }

        public ActionResult ThemTau()
        {
            if (!Functions.AdminLogged())
            {

                return Redirect("/Admin/Auth/Login");
            }

            List<LoaiGheDTO> data = ReadDataSQL.DanhSachLoaiGhe();
            ViewBag.LoaiGhe = data;
            return View();
        }

        [HttpGet]
        public JsonResult LayDanhSachTau()
        {
            try
            {
                var data = ReadDataSQL.LayDanhSachTau();
                return Json(data, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(ex.Message, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpGet]
        public JsonResult DanhSachLoaiGhe()
        {
            try
            {
                var data = ReadDataSQL.DanhSachLoaiGhe();
                return Json(data, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(ex.Message, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpGet]
        public JsonResult DemGheTau()
        {
            try
            {
                var data = ReadDataSQL.DemGheTau();
                return Json(data, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(ex.Message, JsonRequestBehavior.AllowGet);
            }
        }


        [HttpPost]
        public JsonResult XuLyThemTau(ThemTauDTO themTauDTO)
        {
            try
            {

                var tauMoi = ReadDataSQL.ThemTau(themTauDTO.TenTau, themTauDTO.SucChua);

                long maTau = tauMoi.MaTau;


                List<object> res = new List<object>();
                res.Add(tauMoi);
                int count = 1;
                themTauDTO.CacLoaiGheTau.ForEach(item =>
                {

                    for (int i = 0; i < item.SoLuong; i++)
                    {
                        var themGhe = ReadDataSQL.ThemGhe(i + count, item.MaLoaiGhe, maTau);
                        res.Add(themGhe);
                    }

                    count += item.SoLuong;

                });


                return Json(res, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(ex.Message, JsonRequestBehavior.AllowGet);
            }
        }



        [HttpPost]
        public JsonResult XuLyThemLichTrinh(LichTrinhDTO lichTrinhDTO)
        {
            try
            {

                var res = ReadDataSQL.ThemLichTrinh(lichTrinhDTO);
                return Json(res, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { STATUS = 0, MESSAGE = ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }
    }

    public class ThemTauDTO
    {
        public string TenTau { get; set; }
        public int SucChua { get; set; }
        public List<GheTau> CacLoaiGheTau { get; set; }
    }

    public class GheTau
    {

        public long MaLoaiGhe { get; set; }
        public int SoLuong { get; set; }
    }
}