using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using BlogWebApplication.Model;

namespace BlogWebApplication.DAL
{
    public class CommentGateway
    {
        public List<Comment> GetCommentByArticleId(int articleId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["BlogConnectionString"].ConnectionString;
            SqlConnection sqlConnection = new SqlConnection(connectionString);
            string query = "SELECT * FROM CommentTable WHERE ArticleId='"+articleId+"'";
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            sqlConnection.Open();
            SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
            List<Comment> commentList = new List<Comment>();
            while (sqlDataReader.Read())
            {
                Comment comment = new Comment();
                comment.Id = int.Parse(sqlDataReader["Id"].ToString());
                comment.Content = sqlDataReader["Content"].ToString();
                comment.DateTime = (DateTime)sqlDataReader["Datetime"];
                comment.ArticleId = int.Parse(sqlDataReader["ArticleId"].ToString());
                comment.UserId = int.Parse(sqlDataReader["UserId"].ToString());
                commentList.Add(comment);
            }
            sqlConnection.Close();
            return commentList;
        }

        public void SaveComment(Comment comment)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["BlogConnectionString"].ConnectionString;
            SqlConnection sqlConnection = new SqlConnection(connectionString);
            string query = "INSERT INTO CommentTable(Content,DateTime,ArticleId,UserId) VALUES('" + comment.Content + "','" + comment.DateTime + "','" + comment.ArticleId + "','" + comment.UserId + "')";
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            sqlConnection.Open();
            int row = sqlCommand.ExecuteNonQuery();
            sqlConnection.Close();
        }
    }
}