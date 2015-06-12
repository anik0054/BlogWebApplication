using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using BlogWebApplication.DAL;
using BlogWebApplication.Model;

namespace BlogWebApplication.BLL
{
    public class ArticleManager
    {
        ArticleGateway articleGateway=new ArticleGateway();

        public void SaveArticle(Article article)
        {
            articleGateway.SaveArticle(article);
        }

        public Article GetArticleById(int id)
        {
            return articleGateway.GetArticleById(id);
        }

        public List<Article> GetAllArticle()
        {
            return articleGateway.GetAllPublishedArticle();
        }

        public List<Article> GetArticleListByCategoryId(int categoryId)
        {
            return articleGateway.GetArticleListByCategoryId(categoryId);
        }

        public void IncreaseCounter(int articleId)
        {
            articleGateway.IncreaseCounter(articleId);
        }

        public List<Article> GetAllArticleSortedByDateTime()
        {
            return articleGateway.GetAllArticleSortedByDateTime();
        }

        public List<Article> GetArticleListSortedByHitCounter()
        {
            return articleGateway.GetArticleListSortedByHitCounter();
        }

        public List<Article> GetAllArticleBySeach(string searchText)
        {
            List<Article> articleList=articleGateway.GetAllPublishedArticle();
            List<Article> filteredArticleList=new List<Article>();
            foreach (var index in articleList)
            {
                string title = index.Title.ToLower();
                string content = Regex.Replace(index.Content, "<[^>]+>|&nbsp;", String.Empty).ToLower();
                UserManager userManager = new UserManager();
                User user = userManager.GetUserById(index.UserId);
                string userName = user.Name.ToLower();
                if (title.Contains(searchText.ToLower()) || content.Contains(searchText.ToLower()) || userName.Contains(searchText.ToLower()))
                {
                    filteredArticleList.Add(index);
                }
            }
            return filteredArticleList;
        }

        public List<Article> GetArticleByUserId(int userId)
        {
            return articleGateway.GetArticleByUserId(userId);
        }

        public void AlterStatusOfArticle(Article article)
        {
            articleGateway.AlterStatusOfArticle(article);
        }

        public void UpdateArticle(Article article)
        {
            articleGateway.UpdateArticle(article);
        }

        public void DeleteArticleById(int articleId)
        {
            articleGateway.DeleteArticleById(articleId);
        }
    }
}