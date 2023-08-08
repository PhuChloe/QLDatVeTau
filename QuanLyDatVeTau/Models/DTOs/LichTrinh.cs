using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyDatVeTau.Models.DTOs
{
    public class LichTrinhDTO
    {
        public int maTau { get; set; }
        public int maGaDi { get; set; }
        public int maGaDen { get; set; }
        public DateTime ngayDi { get; set; }
        public DateTime ngayDen { get; set; }
        public TimeSpan thoiGianDi { get; set; }
        public TimeSpan thoiGianDen { get; set; }
    }

    public class ChiTietLichTrinh
    {
        public LichTrinh LichTrinh { get; set; }
        public List<DemGhe> LoaiGhe { get; set; }
        public List<ThongTinGhe> ThongTinGhe { get; set; }
    }

}