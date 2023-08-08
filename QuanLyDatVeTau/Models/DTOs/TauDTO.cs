using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyDatVeTau.Models.DTOs
{
    public class TauDTO
    {
        public long MaTau { get; set; }
        public string TenTau { get; set; }
        public int SucChua { get; set; }
    }

    public class GheTauDTO
    {
        public long MaGhe { get; set; }
        public int SoGhe { get; set; }
        public long MaLoaiGhe { get; set; }
        public long MaTau { get; set; }
        public long MaTrangThaiGhe { get; set; }
    }

    public class LoaiGheDTO
    {
        public long MaLoaiGhe { get; set; }
        public string TenLoaiGhe { get; set; }
        public string MoTa { get; set; }
        public double GiaGhe { get; set; }

    }
    public class ThongTinGhe
    {
        public int MaGhe { get; set; }
        public int SoGhe { get; set; }
        public int MaLoaiGhe { get; set; }
        public int MaTau { get; set; }
        public int MaTrangThaiGhe { get; set; }
        public string TenLoaiGhe { get; set; }
        public int GiaGhe { get; set; }
        public string TrangThai { get; set; }
    }
}