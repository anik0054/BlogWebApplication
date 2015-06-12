using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using BlogWebApplication.Model;

namespace BlogWebApplication.DAL
{
    public class CategoryGateway
    {
        public List<Category> GetAllCategory()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["BlogConnectionString"].ConnectionString;
            SqlConnection sqlConnection = new SqlConnection(connectionString);
            string query = "SELECT * FROM CategoryTable";
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            sqlConnection.Open();
            SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
            List<Category> categorieList = new List<Category>();
            while (sqlDataReader.Read())
            {
                Category category = new Category();
                category.Id = int.Parse(sqlDataReader["Id"].ToString());
                category.Name = sqlDataReader["Name"].ToString();
                categorieList.Add(category);
            }
            sqlConnection.Close();
            return categorieList;
        }

        public Category GetCategoryById(int categoryId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["BlogConnectionString"].ConnectionString;
            SqlConnection sqlConnection = new SqlConnection(connectionString);
            string query = "SELECT * FROM CategoryTable WHERE Id='"+categoryId+"'";
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            sqlConnection.Open();
            SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
            Category category = new Category();
            while (sqlDataReader.Read())
            {
                category.Id = int.Parse(sqlDataReader["Id"].ToString());
                category.Name = sqlDataReader["Name"].ToString();
            }
            sqlConnection.Close();
            return category;
        }
    }
}