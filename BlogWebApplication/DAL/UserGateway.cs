using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using BlogWebApplication.Model;

namespace BlogWebApplication.DAL
{
    public class UserGateway
    {
        public User GetUserById(int userId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["BlogConnectionString"].ConnectionString;
            SqlConnection sqlConnection = new SqlConnection(connectionString);
            string query = "SELECT * FROM UserTable WHERE Id='" + userId + "'";
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            sqlConnection.Open();
            SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
            User user = new User();
            while (sqlDataReader.Read())
            {
                user.Id = int.Parse(sqlDataReader["Id"].ToString());
                user.UserName = sqlDataReader["UserName"].ToString();
                user.Password = sqlDataReader["Password"].ToString();
                user.Name = sqlDataReader["Name"].ToString();
                user.Email = sqlDataReader["Email"].ToString();
            }
            sqlConnection.Close();
            return user;
        }

        public List<User> GetAllUser()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["BlogConnectionString"].ConnectionString;
            SqlConnection sqlConnection = new SqlConnection(connectionString);
            string query = "SELECT * FROM UserTable";
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            sqlConnection.Open();
            SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
            List<User> userList=new List<User>();
            while (sqlDataReader.Read())
            {
                User user = new User();
                user.Id = int.Parse(sqlDataReader["Id"].ToString());
                user.UserName = sqlDataReader["UserName"].ToString();
                user.Password = sqlDataReader["Password"].ToString();
                user.Name = sqlDataReader["Name"].ToString();
                user.Email = sqlDataReader["Email"].ToString();
                userList.Add(user);
            }
            sqlConnection.Close();
            return userList;
        }

        public bool SaveUser(User user)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["BlogConnectionString"].ConnectionString;
            SqlConnection sqlConnection = new SqlConnection(connectionString);
            string query = "INSERT INTO UserTable(UserName,Password,Name,Email) VALUES('" + user.UserName + "','" + user.Password + "','" + user.Name + "','" + user.Email + "')";
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            sqlConnection.Open();
            int row=sqlCommand.ExecuteNonQuery();
            sqlConnection.Close();
            if (row == 1)
            {
                return true;
            }
            return false;
        }
    }
}