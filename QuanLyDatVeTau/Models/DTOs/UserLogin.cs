using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyDatVeTau.Models.DTOs
{
    public class UserLogin
    {
        public string Username { get; set; }
        public string Password { get; set; }
    }

    public class UserLoginDTO
    {
        public string Username { get; set; }
        public int Role { get; set; }
        public int Status { get; set; }
        public string Message { get; set; }
    }
    public class InfoDTO
    {
        public int Id { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string FullName { get; set; }
        public int Gender { get; set; }
        public int Role { get; set; }
        public int Status { get; set; }
    }
}