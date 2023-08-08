using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyDatVeTau.Models.DTOs
{
    public class GaTauDTO
    {
        public int MaGaTau { get; set; }
        public string TenGa { get; set; }
    }


    public class DemGhe
    {
        public long MaLoaiGhe { get; set; }
        public long MaTau { get; set; }
        public int SoLuong { get; set; }
        public string TenLoaiGhe { get; set; }
    }
}