using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using QuanLyDatVeTau.Models.DTOs;
using QuanLyDatVeTau.Helpers;

namespace QuanLyDatVeTau.Services
{
    public static class ReadDataSQL
    {

        #region Đặt vé
        public static TicketRes DatVe(string Username, double TongTien, int SoVe)
        {
            try
            {

                string strConnection = ConfigurationManager.AppSettings["QLBanVeTau"].ToString();


                DataSet ds = new DataSet();

                using (SqlConnection conn = new SqlConnection(strConnection))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("sp_DatVe", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@Username", Username));
                    cmd.Parameters.Add(new SqlParameter("@TongTien", TongTien));
                    cmd.Parameters.Add(new SqlParameter("@SoVe", SoVe));

                    SqlDataAdapter dataAdapt = new SqlDataAdapter
                    {
                        SelectCommand = cmd
                    };

                    dataAdapt.Fill(ds);
                }
                if (ds == null) return null;

                DataTable dataTable = ds.Tables[0];
                var res = Functions.DataTableToList<TicketRes>(dataTable);

                var data = res[0];

                return data;

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);

            }

        }

        public static TicketRes ChiTietDatVe(int MaLichTrinh, string MaDatVe, double GiaVe, int MaGhe)
        {
            try
            {

                string strConnection = ConfigurationManager.AppSettings["QLBanVeTau"].ToString();


                DataSet ds = new DataSet();

                using (SqlConnection conn = new SqlConnection(strConnection))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("sp_ChiTietDatVe", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@MaLichTrinh", MaLichTrinh));
                    cmd.Parameters.Add(new SqlParameter("@MaDatVe", MaDatVe));
                    cmd.Parameters.Add(new SqlParameter("@GiaVe", GiaVe));
                    cmd.Parameters.Add(new SqlParameter("@MaGhe", MaGhe));

                    SqlDataAdapter dataAdapt = new SqlDataAdapter
                    {
                        SelectCommand = cmd
                    };

                    dataAdapt.Fill(ds);
                }
                if (ds == null) return null;

                DataTable dataTable = ds.Tables[0];
                var res = Functions.DataTableToList<TicketRes>(dataTable);

                var data = res[0];

                return data;

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);

            }

        }

        public static ThongTinVe ThongTinVe(int id)
        {
            try
            {
                ThongTinVe thongTin = new ThongTinVe();
                string strConnection = ConfigurationManager.AppSettings["QLBanVeTau"].ToString();


                DataSet ds = new DataSet();

                using (SqlConnection conn = new SqlConnection(strConnection))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("sp_ThongTinVe", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@MaDatVe", id));


                    SqlDataAdapter dataAdapt = new SqlDataAdapter
                    {
                        SelectCommand = cmd
                    };

                    dataAdapt.Fill(ds);
                }
                if (ds == null) return null;



                var ve = Functions.DataTableToList<DatVeModel>(ds.Tables[0]);

                if (ve.Count > 0)
                {
                    thongTin.Ve = ve[0];
                    thongTin.ChiTiet = Functions.DataTableToList<ChiTietDatVeModel>(ds.Tables[1]);
                    return thongTin;
                }

                return null;

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);

            }

        }

        #endregion

        #region Tìm kiếm lịch trình

        //lịch trình hôm nay
        public static List<LichTrinh> LichTrinhHomNay()
        {
            try
            {

                string strConnection = ConfigurationManager.AppSettings["QLBanVeTau"].ToString();
                DataSet ds = new DataSet();
                using (SqlConnection conn = new SqlConnection(strConnection))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("sp_LichTrinhHomNay", conn);

                    SqlDataAdapter dataAdapt = new SqlDataAdapter
                    {
                        SelectCommand = cmd
                    };
                    dataAdapt.Fill(ds);
                }
                if (ds == null) return null;

                DataTable dataTable = ds.Tables[0];
                var data = Functions.DataTableToList<LichTrinh>(dataTable);
                return data;

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);

            }

        }

        //tìm lịch theo ga tàu và theo ngày
        public static List<LichTrinh> TimKiemLichTrinh(string ngayDi, string maGaDi, string maGaDen)
        {
            try
            {

                string strConnection = ConfigurationManager.AppSettings["QLBanVeTau"].ToString();
                DataSet ds = new DataSet();
                using (SqlConnection conn = new SqlConnection(strConnection))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("sp_TimLichTrinh", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@MaGaDi", maGaDi));
                    cmd.Parameters.Add(new SqlParameter("@MaGaDen", maGaDen));
                    cmd.Parameters.Add(new SqlParameter("@NgayDi", ngayDi));

                    SqlDataAdapter dataAdapt = new SqlDataAdapter
                    {
                        SelectCommand = cmd
                    };
                    dataAdapt.Fill(ds);
                }
                if (ds == null) return null;

                DataTable dataTable = ds.Tables[0];
                var data = Functions.DataTableToList<LichTrinh>(dataTable);
                return data;

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);

            }

        }



        public static ChiTietLichTrinh LayChiTietLichTrinh(int maLichTrinh)
        {
            try
            {
                ChiTietLichTrinh data = new ChiTietLichTrinh
                {
                    LichTrinh = new LichTrinh(),
                    LoaiGhe = new List<DemGhe>(),
                    ThongTinGhe = new List<ThongTinGhe>()
                };

                string strConnection = ConfigurationManager.AppSettings["QLBanVeTau"].ToString();
                DataSet ds = new DataSet();
                using (SqlConnection conn = new SqlConnection(strConnection))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("sp_ChiTietLichTrinh", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@MaLichTrinh", maLichTrinh));
                    SqlDataAdapter dataAdapt = new SqlDataAdapter
                    {
                        SelectCommand = cmd
                    };
                    dataAdapt.Fill(ds);
                }
                if (ds == null) return null;

                var lichTrinh = Functions.DataTableToList<LichTrinh>(ds.Tables[0]);
                if (lichTrinh != null && lichTrinh.Count() > 0)
                {
                    data.LichTrinh = Functions.DataTableToList<LichTrinh>(ds.Tables[0])[0];
                    data.LoaiGhe = Functions.DataTableToList<DemGhe>(ds.Tables[1]);
                    data.ThongTinGhe = Functions.DataTableToList<ThongTinGhe>(ds.Tables[2]);

                }

                return data;

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);

            }

        }

        #endregion


        #region Đăng nhập/Đăng ký/Thông tin cá nhân
        public static UserLoginDTO DangNhap(string username, string password)
        {
            try
            {

                string strConnection = ConfigurationManager.AppSettings["QLBanVeTau"].ToString();


                DataSet ds = new DataSet();

                using (SqlConnection conn = new SqlConnection(strConnection))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("sp_DangNhap", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@Username", username));
                    cmd.Parameters.Add(new SqlParameter("@Password", password));

                    SqlDataAdapter dataAdapt = new SqlDataAdapter
                    {
                        SelectCommand = cmd
                    };

                    dataAdapt.Fill(ds);
                }
                if (ds == null) return null;

                DataTable dataTable = ds.Tables[0];
                var res = Functions.DataTableToList<UserLoginDTO>(dataTable);

                var data = res[0];

                return data;

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);

            }

        }

        public static UserLoginDTO DangKy(string username, string password, string phone, string email, string fullName, string gender)
        {
            try
            {

                string strConnection = ConfigurationManager.AppSettings["QLBanVeTau"].ToString();


                DataSet ds = new DataSet();

                using (SqlConnection conn = new SqlConnection(strConnection))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("sp_DangKyTaiKhoan", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@Username", username));
                    cmd.Parameters.Add(new SqlParameter("@Password", password));
                    cmd.Parameters.Add(new SqlParameter("@Phone", phone));
                    cmd.Parameters.Add(new SqlParameter("@Email", email));
                    cmd.Parameters.Add(new SqlParameter("@FullName", fullName));
                    cmd.Parameters.Add(new SqlParameter("@Gender", gender));

                    SqlDataAdapter dataAdapt = new SqlDataAdapter
                    {
                        SelectCommand = cmd
                    };

                    dataAdapt.Fill(ds);
                }
                if (ds == null) return null;

                DataTable dataTable = ds.Tables[0];
                var res = Functions.DataTableToList<UserLoginDTO>(dataTable);

                var data = res[0];

                return data;

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);

            }

        }

        public static InfoDTO ThongTinCaNhan(string username)
        {
            try
            {

                string strConnection = ConfigurationManager.AppSettings["QLBanVeTau"].ToString();


                DataSet ds = new DataSet();

                using (SqlConnection conn = new SqlConnection(strConnection))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("sp_ThongTinCaNhan", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@Username", username));


                    SqlDataAdapter dataAdapt = new SqlDataAdapter
                    {
                        SelectCommand = cmd
                    };

                    dataAdapt.Fill(ds);
                }
                if (ds == null) return null;

                DataTable dataTable = ds.Tables[0];
                var res = Functions.DataTableToList<InfoDTO>(dataTable);

                var data = res[0];

                return data;

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);

            }

        }
        #endregion


        #region Lấy danh sách ga tàu
        public static List<GaTauDTO> LayDanhSachGaTau()
        {
            GaTauDTO veTau = new GaTauDTO();
            try
            {

                string strConnection = ConfigurationManager.AppSettings["QLBanVeTau"].ToString();
                DataSet ds = new DataSet();
                using (SqlConnection conn = new SqlConnection(strConnection))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("sp_DanhSachGaTau", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    SqlDataAdapter dataAdapt = new SqlDataAdapter
                    {
                        SelectCommand = cmd
                    };
                    dataAdapt.Fill(ds);
                }
                if (ds == null) return null;

                DataTable dataTable = ds.Tables[0];
                var data = Functions.DataTableToList<GaTauDTO>(dataTable);

                return data;

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);

            }

        }
        #endregion


        #region Admin xem và thêm lịch trình

        public static List<LichTrinh> LayDanhSachLichTrinh()
        {
            try
            {
                string strConnection = ConfigurationManager.AppSettings["QLBanVeTau"].ToString();
                DataSet ds = new DataSet();
                using (SqlConnection conn = new SqlConnection(strConnection))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("sp_DanhSachLichTrinh", conn);
                    cmd.CommandType = CommandType.StoredProcedure;


                    SqlDataAdapter dataAdapt = new SqlDataAdapter
                    {
                        SelectCommand = cmd
                    };
                    dataAdapt.Fill(ds);
                }

                if (ds == null || ds.Tables.Count == 0) return null;

                DataTable dataTable = ds.Tables[0];
                var data = Functions.DataTableToList<LichTrinh>(dataTable);

                return data;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }

        public static ResponseCreateDTO ThemLichTrinh(LichTrinhDTO lichTrinhDTO)
        {
            try
            {
                string strConnection = ConfigurationManager.AppSettings["QLBanVeTau"].ToString();
                DataSet ds = new DataSet();
                using (SqlConnection conn = new SqlConnection(strConnection))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("sp_ThemLichTrinh", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@MaTau", lichTrinhDTO.maTau));
                    cmd.Parameters.Add(new SqlParameter("@MaGaDi", lichTrinhDTO.maGaDi));
                    cmd.Parameters.Add(new SqlParameter("@MaGaDen", lichTrinhDTO.maGaDen));
                    cmd.Parameters.Add(new SqlParameter("@NgayDi", lichTrinhDTO.ngayDi));
                    cmd.Parameters.Add(new SqlParameter("@NgayDen", lichTrinhDTO.ngayDen));
                    cmd.Parameters.Add(new SqlParameter("@NguoiTao", "admin"));
                    SqlDataAdapter dataAdapt = new SqlDataAdapter
                    {
                        SelectCommand = cmd
                    };
                    dataAdapt.Fill(ds);
                }

                if (ds == null || ds.Tables.Count == 0) return null;

                DataTable dataTable = ds.Tables[0];
                var data = Functions.DataTableToList<ResponseCreateDTO>(dataTable);
                if (data.Count > 0)
                    return data[0];
                else return null;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }

        #endregion


        #region Admin xem/thêm tàu
        public static List<TauDTO> LayDanhSachTau()
        {
            try
            {
                string strConnection = ConfigurationManager.AppSettings["QLBanVeTau"].ToString();
                DataSet ds = new DataSet();
                using (SqlConnection conn = new SqlConnection(strConnection))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("sp_LayDanhSachTau", conn);
                    cmd.CommandType = CommandType.StoredProcedure;


                    SqlDataAdapter dataAdapt = new SqlDataAdapter
                    {
                        SelectCommand = cmd
                    };
                    dataAdapt.Fill(ds);
                }

                if (ds == null || ds.Tables.Count == 0) return null;

                DataTable dataTable = ds.Tables[0];
                var data = Functions.DataTableToList<TauDTO>(dataTable);
                return data;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }

        public static TauDTO ThemTau(string tenTau, int sucChua)
        {
            try
            {
                string strConnection = ConfigurationManager.AppSettings["QLBanVeTau"].ToString();
                DataSet ds = new DataSet();
                using (SqlConnection conn = new SqlConnection(strConnection))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("sp_ThemTau", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@TenTau", tenTau));
                    cmd.Parameters.Add(new SqlParameter("@SucChua", sucChua));
                    SqlDataAdapter dataAdapt = new SqlDataAdapter
                    {
                        SelectCommand = cmd
                    };
                    dataAdapt.Fill(ds);
                }

                if (ds == null || ds.Tables.Count == 0) return null;

                DataTable dataTable = ds.Tables[0];
                var data = Functions.DataTableToList<TauDTO>(dataTable);
                if (data.Count > 0)
                    return data[0];
                else return null;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }
        #endregion


        #region Admin thêm ghế cho tàu, lấy danh sách loại ghế, đếm ghế tàu
        public static GheTauDTO ThemGhe(int soGhe, long maLoaiGhe, long maTau)
        {
            try
            {
                string strConnection = ConfigurationManager.AppSettings["QLBanVeTau"].ToString();
                DataSet ds = new DataSet();
                using (SqlConnection conn = new SqlConnection(strConnection))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("sp_ThemGheTau", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@SoGhe", soGhe));
                    cmd.Parameters.Add(new SqlParameter("@MaLoaiGhe", maLoaiGhe));
                    cmd.Parameters.Add(new SqlParameter("@MaTau", maTau));
                    SqlDataAdapter dataAdapt = new SqlDataAdapter
                    {
                        SelectCommand = cmd
                    };
                    dataAdapt.Fill(ds);
                }

                if (ds == null || ds.Tables.Count == 0) return null;

                DataTable dataTable = ds.Tables[0];
                var data = Functions.DataTableToList<GheTauDTO>(dataTable);
                if (data.Count > 0)
                    return data[0];
                else return null;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }

        public static List<LoaiGheDTO> DanhSachLoaiGhe()
        {
            try
            {
                string strConnection = ConfigurationManager.AppSettings["QLBanVeTau"].ToString();
                DataSet ds = new DataSet();
                using (SqlConnection conn = new SqlConnection(strConnection))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("sp_DanhSachLoaiGhe", conn);
                    cmd.CommandType = CommandType.StoredProcedure;


                    SqlDataAdapter dataAdapt = new SqlDataAdapter
                    {
                        SelectCommand = cmd
                    };
                    dataAdapt.Fill(ds);
                }

                if (ds == null || ds.Tables.Count == 0) return null;

                DataTable dataTable = ds.Tables[0];
                var data = Functions.DataTableToList<LoaiGheDTO>(dataTable);
                return data;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }

        public static List<DemGhe> DemGheTau()
        {
            try
            {
                string strConnection = ConfigurationManager.AppSettings["QLBanVeTau"].ToString();
                DataSet ds = new DataSet();
                using (SqlConnection conn = new SqlConnection(strConnection))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("sp_DemGhe", conn);
                    cmd.CommandType = CommandType.StoredProcedure;


                    SqlDataAdapter dataAdapt = new SqlDataAdapter
                    {
                        SelectCommand = cmd
                    };
                    dataAdapt.Fill(ds);
                }

                if (ds == null || ds.Tables.Count == 0) return null;

                DataTable dataTable = ds.Tables[0];
                var data = Functions.DataTableToList<DemGhe>(dataTable);
                return data;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }
        #endregion


    }
}


