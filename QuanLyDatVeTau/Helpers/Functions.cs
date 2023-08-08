using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace QuanLyDatVeTau.Helpers
{
    public static class Functions
    {
        public static string ToMD5(this String s)
        {
            var bytes = Encoding.UTF8.GetBytes(s);
            var hash = MD5.Create().ComputeHash(bytes);
            return Convert.ToBase64String(hash);
        }
        public static int CheckLoginStatus()
        {
            HttpContext context = HttpContext.Current;
            if (context.Session["role"] == null)
            {
                // Chưa đăng nhập
                return 0;
            }
            else if ((int)context.Session["role"] == 1)
            {
                // Người dùng đăng nhập với vai trò là admin
                return 1;
            }
            else if ((int)context.Session["role"] == 2)
            {
                // Người dùng đăng nhập với vai trò là user
                return 2;
            }
            else
            {
                // Trường hợp khác
                return 0;
            }
        }

        public static bool CustomerLogged()
        {
            HttpContext context = HttpContext.Current;
            if (context.Session["roleCustomer"] == null) return false;
            return (int)context.Session["roleCustomer"] == 2;
        }
        public static bool AdminLogged()
        {
            HttpContext context = HttpContext.Current;
            if (context.Session["roleAdmin"] == null) return false;
            if ((int)context.Session["roleAdmin"] == 1) return true;

            return false;
        }

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

                return null;
            }
        }

        public static string FormatDateMMDDYY(string sDate)
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

    }
}