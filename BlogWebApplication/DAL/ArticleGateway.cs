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
    public class ArticleGateway
    {
        public void SaveArticle(Article article)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["BlogConnectionString"].ConnectionString;
            SqlConnection sqlConnection = new SqlConnection(connectionString);
            string query = "INSERT INTO ArticleTable(Title,Content,DateTime,UserId,CategoryId,Status,HitCounter) VALUES('" +article.Title+"','"+ article.Content + "','" + article.DateTime + "','" + article.UserId + "','" + article.CategoryId + "','" + article.Status + "','" + article.HitCounter + "')";
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            sqlConnection.Open();
            sqlCommand.ExecuteNonQuery();
            sqlConnection.Close();
        }

        public Article GetArticleById(int id)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["BlogConnectionString"].ConnectionString;
            SqlConnection sqlConnection = new SqlConnection(connectionString);
            string query = "SELECT * FROM ArticleTable WHERE Id='" + id + "'";
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            sqlConnection.Open();
            SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
            Article article = new Article();
            while (sqlDataReader.Read())
            {
                article.Id = int.Parse(sqlDataReader["Id"].ToString());
                article.Title = sqlDataReader["Title"].ToString();
                article.Content = WebUtility.HtmlDecode(sqlDataReader["Content"].ToString());
                article.DateTime = (DateTime) sqlDataReader["Datetime"];
                article.UserId = int.Parse(sqlDataReader["UserId"].ToString());
                article.CategoryId = int.Parse(sqlDataReader["CategoryId"].ToString());
                article.Status = sqlDataReader["Status"].ToString();
                article.HitCounter = int.Parse(sqlDataReader["HitCounter"].ToString());
            }
            sqlConnection.Close();
            return article;
        }

        public List<Article> GetAllPublishedArticle()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["BlogConnectionString"].ConnectionString;
            SqlConnection sqlConnection = new SqlConnection(connectionString);
            string query = "SELECT * FROM ArticleTable WHERE Status='Published' ORDER BY DateTime DESC";
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            sqlConnection.Open();
            SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
            List<Article> articleList=new List<Article>();
            while (sqlDataReader.Read())
            {
                Article article = new Article();
                article.Id = int.Parse(sqlDataReader["Id"].ToString());
                article.Title = sqlDataReader["Title"].ToString();
                article.Content = WebUtility.HtmlDecode(sqlDataReader["Content"].ToString());
                article.DateTime = (DateTime)sqlDataReader["Datetime"];
                article.UserId = int.Parse(sqlDataReader["UserId"].ToString());
                article.CategoryId = int.Parse(sqlDataReader["CategoryId"].ToString());
                article.Status = sqlDataReader["Status"].ToString();
                article.HitCounter = int.Parse(sqlDataReader["HitCounter"].ToString());
                articleList.Add(article);
            }
            sqlConnection.Close();
            return articleList;
        }

        public List<Article> GetArticleListByCategoryId(int categoryId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["BlogConnectionString"].ConnectionString;
            SqlConnection sqlConnection = new SqlConnection(connectionString);
            string query = "SELECT * FROM ArticleTable WHERE Status='Published' AND CategoryId='" + categoryId + "' ORDER BY DateTime DESC";
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            sqlConnection.Open();
            SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
            List<Article> articleList = new List<Article>();
            while (sqlDataReader.Read())
            {
                Article article = new Article();
                article.Id = int.Parse(sqlDataReader["Id"].ToString());
                article.Title = sqlDataReader["Title"].ToString();
                article.Content = WebUtility.HtmlDecode(sqlDataReader["Content"].ToString());
                article.DateTime = (DateTime)sqlDataReader["Datetime"];
                article.UserId = int.Parse(sqlDataReader["UserId"].ToString());
                article.CategoryId = int.Parse(sqlDataReader["CategoryId"].ToString());
                article.Status = sqlDataReader["Status"].ToString();
                article.HitCounter = int.Parse(sqlDataReader["HitCounter"].ToString());
                articleList.Add(article);
            }
            sqlConnection.Close();
            return articleList;
        }

        public void IncreaseCounter(int articleId)
        {
            Article article = GetArticleById(articleId);
            int hitCounterValue=article.HitCounter;
            hitCounterValue++;
            string connectionString = ConfigurationManager.ConnectionStrings["BlogConnectionString"].ConnectionString;
            SqlConnection sqlConnection = new SqlConnection(connectionString);
            string query = "UPDATE ArticleTable SET HitCounter = '"+hitCounterValue+"' WHERE Id='"+articleId+"'";
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            sqlConnection.Open();
            int row = sqlCommand.ExecuteNonQuery();
            sqlConnection.Close();
        }

        public List<Article> GetAllArticleSortedByDateTime()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["BlogConnectionString"].ConnectionString;
            SqlConnection sqlConnection = new SqlConnection(connectionString);
            string query = "SELECT * FROM ArticleTable WHERE Status='Published' ORDER BY DateTime DESC";
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            sqlConnection.Open();
            SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
            List<Article> articleList = new List<Article>();
            while (sqlDataReader.Read())
            {
                Article article = new Article();
                article.Id = int.Parse(sqlDataReader["Id"].ToString());
                article.Title = sqlDataReader["Title"].ToString();
                article.Content = WebUtility.HtmlDecode(sqlDataReader["Content"].ToString());
                article.DateTime = (DateTime)sqlDataReader["Datetime"];
                article.UserId = int.Parse(sqlDataReader["UserId"].ToString());
                article.CategoryId = int.Parse(sqlDataReader["CategoryId"].ToString());
                article.Status = sqlDataReader["Status"].ToString();
                article.HitCounter = int.Parse(sqlDataReader["HitCounter"].ToString());
                articleList.Add(article);
            }
            sqlConnection.Close();
            return articleList;
        }

        public List<Article> GetArticleListSortedByHitCounter()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["BlogConnectionString"].ConnectionString;
            SqlConnection sqlConnection = new SqlConnection(connectionString);
            string query = "SELECT * FROM ArticleTable WHERE Status='Published' ORDER BY HitCounter DESC";
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            sqlConnection.Open();
            SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
            List<Article> articleList = new List<Article>();
            while (sqlDataReader.Read())
            {
                Article article = new Article();
                article.Id = int.Parse(sqlDataReader["Id"].ToString());
                article.Title = sqlDataReader["Title"].ToString();
                article.Content = WebUtility.HtmlDecode(sqlDataReader["Content"].ToString());
                article.DateTime = (DateTime)sqlDataReader["Datetime"];
                article.UserId = int.Parse(sqlDataReader["UserId"].ToString());
                article.CategoryId = int.Parse(sqlDataReader["CategoryId"].ToString());
                article.Status = sqlDataReader["Status"].ToString();
                article.HitCounter = int.Parse(sqlDataReader["HitCounter"].ToString());
                articleList.Add(article);
            }
            sqlConnection.Close();
            return articleList;
        }

        public List<Article> GetAllArticleBySeach(string searchText)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["BlogConnectionString"].ConnectionString;
            SqlConnection sqlConnection = new SqlConnection(connectionString);
            string query = "SELECT * FROM ArticleTable Title LIKE '%" + searchText + "%' OR Content LIKE '%" + searchText + "%' WHERE Status='Published' ";
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            sqlConnection.Open();
            SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
            List<Article> articleList = new List<Article>();
            while (sqlDataReader.Read())
            {
                Article article = new Article();
                article.Id = int.Parse(sqlDataReader["Id"].ToString());
                article.Title = sqlDataReader["Title"].ToString();
                article.Content = WebUtility.HtmlDecode(sqlDataReader["Content"].ToString());
                article.DateTime = (DateTime)sqlDataReader["Datetime"];
                article.UserId = int.Parse(sqlDataReader["UserId"].ToString());
                article.CategoryId = int.Parse(sqlDataReader["CategoryId"].ToString());
                article.Status = sqlDataReader["Status"].ToString();
                article.HitCounter = int.Parse(sqlDataReader["HitCounter"].ToString());
                articleList.Add(article);
            }
            sqlConnection.Close();
            return articleList;
        }

        public List<Article> GetArticleByUserId(int userId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["BlogConnectionString"].ConnectionString;
            SqlConnection sqlConnection = new SqlConnection(connectionString);
            string query = "SELECT * FROM ArticleTable WHERE UserId='" + userId + "' ORDER BY DateTime DESC";
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            sqlConnection.Open();
            SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
            List<Article> articleList = new List<Article>();
            while (sqlDataReader.Read())
            {
                Article article = new Article();
                article.Id = int.Parse(sqlDataReader["Id"].ToString());
                article.Title = sqlDataReader["Title"].ToString();
                article.Content = WebUtility.HtmlDecode(sqlDataReader["Content"].ToString());
                article.DateTime = (DateTime)sqlDataReader["Datetime"];
                article.UserId = int.Parse(sqlDataReader["UserId"].ToString());
                article.CategoryId = int.Parse(sqlDataReader["CategoryId"].ToString());
                article.Status = sqlDataReader["Status"].ToString();
                article.HitCounter = int.Parse(sqlDataReader["HitCounter"].ToString());
                articleList.Add(article);
            }
            sqlConnection.Close();
            return articleList;
        }

        public void AlterStatusOfArticle(Article article)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["BlogConnectionString"].ConnectionString;
            SqlConnection sqlConnection = new SqlConnection(connectionString);
            string temp = "";
            if (article.Status == "Unpublished")
            {
                temp = "Published";
            }
            else
            {
                temp = "Unpublished";
            }
            string query = "UPDATE ArticleTable SET Status = '" + temp + "', DateTime = '" +article.DateTime+ "' WHERE Id='" + article.Id + "'";
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            sqlConnection.Open();
            int row = sqlCommand.ExecuteNonQuery();
            sqlConnection.Close();

        }

        public void UpdateArticle(Article article)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["BlogConnectionString"].ConnectionString;
            SqlConnection sqlConnection = new SqlConnection(connectionString);
            string query = "UPDATE ArticleTable SET Title = '" + article.Title + "',Content='"+article.Content+"',DateTime='"+article.DateTime+"',CategoryId='"+article.CategoryId+"' WHERE Id='" + article.Id + "'";
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            sqlConnection.Open();
            int row = sqlCommand.ExecuteNonQuery();
            sqlConnection.Close();
        }

        public void DeleteArticleById(int articleId)
        {
            DeleteCommentByArticleId(articleId);

            string connectionString = ConfigurationManager.ConnectionStrings["BlogConnectionString"].ConnectionString;
            SqlConnection sqlConnection = new SqlConnection(connectionString);
            string query = "DELETE FROM ArticleTable WHERE Id = '" + articleId + "'";
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            sqlConnection.Open();
            int row = sqlCommand.ExecuteNonQuery();
            sqlConnection.Close();
        }

        public void DeleteCommentByArticleId(int articleId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["BlogConnectionString"].ConnectionString;
            SqlConnection sqlConnection = new SqlConnection(connectionString);
            string query = "DELETE FROM CommentTable WHERE ArticleId = '" + articleId + "'";
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            sqlConnection.Open();
            int row = sqlCommand.ExecuteNonQuery();
            sqlConnection.Close();
        }
    }
}