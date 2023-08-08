using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyDatVeTau.Models.DTOs
{
    public class DatVeDTO
    {
        public double TongTien { get; set; }
        public int MaLichTrinh { get; set; }
        public List<Ticket> Tickets { get; set; }
    }
    public class Ticket
    {
        public int MaGhe { get; set; }
        public int GiaVe { get; set; }
    }
    public class TicketRes
    {
        public int Status { get; set; }
        public string Message { get; set; }
        public string Id { get; set; }
    }

    public class ThongTinVe
    {
        public DatVeModel Ve { get; set; }
        public List<ChiTietDatVeModel> ChiTiet { get; set; }

    }
    public class DatVeModel
    {
        public int MaDatVe { get; set; }
        public string NgayDat { get; set; }
        public string TenTrangThai { get; set; }
        public decimal TongTien { get; set; }
        public int SoVe { get; set; }
        public string PTTT { get; set; }
        public string NguoiDat { get; set; }
    }
    public class ChiTietDatVeModel
    {
        public int MaChiTietDatVe { get; set; }
        public int MaLichTrinh { get; set; }
        public int MaDatVe { get; set; }
        public decimal GiaVe { get; set; }
        public string NgayTao { get; set; }
        public int MaGhe { get; set; }
        public int MaTau { get; set; }
        public int MaGaDi { get; set; }
        public string TenGaDi { get; set; }
        public string NgayDi { get; set; }
        public int MaGaDen { get; set; }
        public string TenGaDen { get; set; }
        public string NgayDen { get; set; }
        public int SoGhe { get; set; }
        public string TenLoaiGhe { get; set; }
        public double GiaGhe { get; set; }

    }

}