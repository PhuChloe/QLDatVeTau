using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyDatVeTau.Models.DTOs
{
    public class LichTrinh
    {
        public long MaLichTrinh { get; set; }
        public long MaTau { get; set; }
        public long MaGaDi { get; set; }
        public string TenGaDi { get; set; }
        public long MaGaDen { get; set; }
        public string TenGaDen { get; set; }
        public string NgayDi { get; set; }
        public string NgayDen { get; set; }
        public string NgayTao { get; set; }
        public string NguoiTao { get; set; }
        public string TenTau { get; set; }
    }
    public class VeTau
    {
        public long MaVeTau { get; set; }
        public int VeKhuHoi { get; set; }
        public long MaLichTrinhDi { get; set; }
        public long? MaLichTrinhVe { get; set; }
        public decimal GiaVe { get; set; }
        public int MaLoaiVe { get; set; }
        public string NgayTao { get; set; }
        public string NgayCapNhat { get; set; }
        public int NguoiTao { get; set; }
        public string TenGaDi { get; set; }
        public string TenGaDen { get; set; }
        public string NgayDi { get; set; }
        public string NgayDen { get; set; }
        public TimeSpan ThoiGianDi { get; set; }
        public TimeSpan ThoiGianDen { get; set; }
        public string ThoiGianDiStr { get; set; }
        public string ThoiGianDenStr { get; set; }
        public string LoaiVe { get; set; }
        public string NgayKhuHoi { get; set; }
        public string NgayVe { get; set; }

    }

    public class GaTau
    {
        public long MaGaTau { get; set; }
        public string TenGa { get; set; }
        public string NgayTao { get; set; }
        public string NgayCapNhat { get; set; }
        public bool? DaXoa { get; set; }
    }
}