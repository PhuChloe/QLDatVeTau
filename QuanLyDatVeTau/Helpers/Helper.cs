/*
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text.RegularExpressions;
using System.Web;
using System.Xml;
using System.Xml.Serialization;
using Microsoft.Ajax.Utilities;


namespace CRM
{

    public static class PAGES
    {
        public static string BI_Dashboard = "BI_Dashboard";// 1241,//	Dashboard
        public static string BI_ReportByYear = "BI_ReportByYear";//1242,//	Theo thời gian
        public static string BI_ReportByCategory = "BI_ReportByCategory";//1244,//	Theo nhóm hàng
        public static string BI_ReportChannel = "BI_ReportChannel";// 1245,//	Theo kênh
        public static string BI_ReportItem = "BI_ReportItem";// 1246,//	Theo mặt hàng
        public static string BI_ReportPayment = "BI_ReportPayment";// 1247,//	Theo hình thức TT
        public static string BI_ReportPromo = "BI_ReportPromo";// 1248,//	Theo CT KM
        public static string BI_ReportMentor = "BI_ReportMentor";// 1251, //Memtor system
    }

    public static class CONTROLS
    {
        public static string BI_ViewReport = "BI_ViewReport";// 13681,//xem báo cáo
        public static string Mentor_System = "Mentor_System";//13684, //mentor
    }

    public enum USER_ROLE
    {
        ADMIN = 1,
        SALER = 2,
        DEPLOYER = 3
    }
    public enum ORDER_STATUS
    {
        WAITING = 7,//CHỜ DUYET
        APPROVED = 2, //DUYET
        EDIT = 23,//Y.C SUA
        NOTAPPROVED = 3,//HUY
        NEW = 1,//MOI
        CLOSE = 10,//ĐÓNG
        DONE = 9//GIAO HANG
    }
    public enum QUOTES_STATUS
    {
        NEW = 1,//MỚI, CHỜ DUYỆT
        APPROVE = 2,//DUYỆT
        NOTAPPROVED = 3//KHÔNG DUYỆT
    }

    public static class Helper
    {

        public static bool CheckPermission(string PageAutoId, string ControlId)
        {
            try
            {
                if (MasterSession.UserLogin == null) return false;
                if (MasterSession.UserLogin.IsDefault) return true;
                if (MasterSession.UserLogin.Controls == null) return false;
                if (MasterSession.UserLogin.Controls.Count == 0) return false;
                var page = MasterSession.UserLogin.Configs.Where(x => x.Key == PageAutoId).FirstOrDefault();
                if (page == null) return false;
                var control = MasterSession.UserLogin.Configs.Where(x => x.Key == ControlId).FirstOrDefault();
                if (control == null) return false;
                int iPageAutoId = int.Parse(page.Value.ToString());
                int iControlId = int.Parse(control.Value.ToString());

                var found = MasterSession.UserLogin.Controls.Where(x => x.PageAutoId == iPageAutoId && x.ControlAutoID == iControlId).FirstOrDefault();
                if (found == null) return false;
                return true;
            }
            catch (Exception ex) { return false; }
        }
        public static bool IsNotify()
        {
            try
            {
                return bool.Parse(ConfigurationManager.AppSettings["IsNotify"].ToString());
            }
            catch (Exception ex)
            {
                return false;
            }
        }


        public static int AdminRole()
        {
            return 1;
        }
        public static bool UserHaveApproved()
        {

            return true;
        }

        public static int ORG_AUTOID()
        {
            try
            {
                return MasterSession.UserLogin.BranchId;
            }
            catch (Exception ex) { return 3; }
        }
        public static List<string> RandomColor(int max)
        {
            var colors = new List<string>();
            for (int i = 0; i < max; i++)
            {
                var random = new Random(100 + i); // Don't put this here!
                colors.Add(String.Format("#{0:X6}", random.Next(0x1000000)));
            }
            return colors;
        }

        //dd/mm/yyyy => to mm/dd/yyyy
        public static string formatDate(string sDate)
        {
            try
            {
                if (string.IsNullOrEmpty(sDate)) return DateTime.Now.ToString("MM/dd/yyyy");
                //dd/mm/yyyy
                string[] stemp = sDate.Split('/');
                return stemp[1] + "/" + stemp[0] + "/" + stemp[2];
            }
            catch (Exception) { return DateTime.Now.ToString("MM/dd/yyyy"); }

        }
        public static string formatDateToDMY(string sDateMDY)
        {
            string dDefault = DateTime.Now.ToString("dd/MM/yyyy");
            if (string.IsNullOrEmpty(sDateMDY)) return dDefault;
            try
            {
                string[] s = sDateMDY.Split('/');
                //mm/dd/yyyy=> dd/mm/yyyy
                return s[1] + "/" + s[0] + "/" + s[2];
            }
            catch (Exception ex) { return dDefault; }
        }

        //07/05/2023 2:00:00 CH -> 05/07/2023 14:00:00 
        public static string FormatDateTimeToAMPM(string input)
        {
            try
            {
                DateTime dt = DateTime.Parse(input);
                return dt.ToString("dd/MM/yyyy HH:mm tt", CultureInfo.InvariantCulture);
            }
            catch (Exception ex) { return input; }

        }
        public static DateTime CurrentDate()
        {
            return DateTime.Now;
        }
        private static Random random = new Random();
        public static string RandomString()
        {
            int length = 5;
            const string chars = "abcdefghijklmnopqrstuvwxyz0123456789";
            string str = new string(Enumerable.Repeat(chars, length)
               .Select(s => s[random.Next(s.Length)]).ToArray());
            return str;
        }

        public static string RandomCode()
        {
            int length = 3;
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            string str = new string(Enumerable.Repeat(chars, length)
               .Select(s => s[random.Next(s.Length)]).ToArray());
            try
            {
                DataTable dt = DataObject.GetDataCommand("exec proc_CRM_Deal_GetCode");
                if (dt.Rows.Count > 0)
                    return dt.Rows[0]["Code"].ToString();
                else
                    return str;
            }
            catch (Exception) { return str; }
        }
        public static string RandomQuoteCode(int dealid)
        {
            int length = 3;
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            string str = new string(Enumerable.Repeat(chars, length)
               .Select(s => s[random.Next(s.Length)]).ToArray());
            try
            {
                DataTable dt = DataObject.GetDataCommand("exec proc_CRM_Quote_GetCode " + dealid);
                if (dt.Rows.Count > 0)
                    return dt.Rows[0]["Code"].ToString();
                else
                    return str;
            }
            catch (Exception) { return str; }
        }

        public static int UserId()
        {
            try
            {
                return MasterSession.UserLogin.UserID;
            }
            catch
            { return 1; }
        }
        /// <summary>
        /// Converts a DataTable to a list with generic objects
        /// </summary>
        /// <typeparam name="T">Generic object</typeparam>
        /// <param name="table">DataTable</param>
        /// <returns>List with generic objects</returns>
        public static List<T> DataTableToList<T>(this DataTable table) where T : class, new()
        {

            try
            {
                List<T> list = new List<T>();

                foreach (var row in table.AsEnumerable())
                {
                    T obj = new T();

                    foreach (var prop in obj.GetType().GetProperties())
                    {
                        try
                        {
                            PropertyInfo propertyInfo = obj.GetType().GetProperty(prop.Name);
                            propertyInfo.SetValue(obj, Convert.ChangeType(row[prop.Name], propertyInfo.PropertyType), null);
                        }
                        catch
                        {
                            continue;
                        }
                    }

                    list.Add(obj);
                }

                return list;
            }
            catch (Exception ex)
            {
                LogHelper.SaveLog("DataTableToList", ex.ToString());
                return null;
            }
        }

        public static string Today()
        {
            return DateTime.Now.ToString("MM/dd/yyyy");

        }
        public static string Yesterday()
        {
            DateTime d = DateTime.Now.AddDays(-1);
            return d.ToString("MM/dd/yyyy");
        }
        public static string LastWeek()
        {
            DateTime d = DateTime.Now.AddDays(-6);
            return d.ToString("MM/dd/yyyy");
        }
        public static string LastMonth()
        {

            *//*
            switch  (Now.Month)
            {
                case 1:
                case 3:
                case 5:
                case 7:
                case 8:
                case 10:
                case 12:
                    Day = 31;
                    break;
                case 4:
                case 6:
                case 9:
                case 11:
                    Day = 30;
                    break;
                case 2:
                    if ((((Year % 4 == 0) & (Year % 100 != 0) | (Year % 400 == 0))))
                        Day = 29;
                    else
                        Day = 28;
                    break;
            }
            *//*

            DateTime dDate = DateTime.Now.AddDays(-30);
            return dDate.ToString("MM/dd/yyyy");

        }

        public static string ThisMonth()
        {
            DateTime Now = DateTime.Now;
            int Day = Now.Day;
            int Year = Now.Year;
            int Month = Now.Month;
            DateTime dDate = new DateTime(Year, Month, 1);
            return dDate.ToString("MM/dd/yyyy");
        }

        public static T DataTableClass<T>(this DataTable table) where T : class, new()
        {
            try
            {
                foreach (var row in table.AsEnumerable())
                {
                    T obj = new T();

                    foreach (var prop in obj.GetType().GetProperties())
                    {
                        try
                        {
                            PropertyInfo propertyInfo = obj.GetType().GetProperty(prop.Name);
                            propertyInfo.SetValue(obj, Convert.ChangeType(row[prop.Name], propertyInfo.PropertyType), null);
                        }
                        catch
                        {
                            continue;
                        }
                    }
                    return obj;
                }

                return null;
            }
            catch (Exception ex)
            {
             
                return null;
            }
        }




        public static bool IsAllPropertiesNullOrEmpty(object obj)
        {
            foreach (var prop in obj.GetType().GetProperties())
            {

                if (prop.GetValue(obj) != null && prop.GetValue(obj).ToString() != string.Empty)
                {
                    return false;
                }
            }
            return true;
        }
        public static TimeSpan? ParseTime(string input)
        {
            TimeSpan dummyOutput;
            bool check = TimeSpan.TryParse(input, out dummyOutput);
            if (check) return dummyOutput;
            return null;

        }
        public static string FormatStringAsNumber(string input)
        {
            try
            {
                if (input.IsNullOrWhiteSpace()) return null;

                string strNum = input.Replace(',', '.');

                // Nếu chuỗi bắt đầu bằng dấu ngoặc đơn, chuyển đổi nó thành số âm
                if (strNum.StartsWith("(") && strNum.EndsWith(")"))
                {
                    strNum = "-" + strNum.Substring(1, strNum.Length - 2);
                }
                return strNum;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public static bool NumberValid(string input)
        {

            try
            {
                // chỉ chấp nhận chuỗi gồm chữ số và dấu chấm phân tách phần nguyên và phần thập phân.
                string pattern = @"^-?[0-9]*\.?[0-9]+$";
                bool isValid = Regex.IsMatch(input, pattern);
                if (isValid)
                {
                    double number;
                    bool isNumber = double.TryParse(input, out number);
                    if (isNumber)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
                else
                {
                    return false;
                }

            }
            catch (Exception ex)
            {
                return false;
            }


        }
        public static bool IsValidDateTime(string input)
        {

            DateTime temp;
            return DateTime.TryParse(input, out temp);
        }
        public static string SerializeXML<T>(T obj)
        {
            XmlSerializer xsSubmit = new XmlSerializer(typeof(T));
            using (var sww = new StringWriter())
            {
                using (XmlTextWriter writer = new XmlTextWriter(sww) { Formatting = Formatting.Indented })
                {
                    xsSubmit.Serialize(writer, obj);
                    return sww.ToString();
                }
            }
        }
    }
}*/