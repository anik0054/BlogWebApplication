using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BlogWebApplication.BLL;
using BlogWebApplication.Model;

namespace BlogWebApplication.UI
{
    public partial class EditArticlePage : System.Web.UI.Page
    {
        ArticleManager articleManager=new ArticleManager();
        CategoryManager categoryManager = new CategoryManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null && Session["articleId"] != null)
            {
                
                if (!IsPostBack)
                {
                    List<Category> categorieList = categoryManager.GetAllCategory();
                    int articleId = Convert.ToInt16(Session["articleId"]);
                    Article article = articleManager.GetArticleById(articleId);
                    foreach (var index in categorieList)
                    {
                            categoryDropDownList.Items.Add(new ListItem(index.Name, index.Id.ToString()));
                    }
                    articleNameTextBox.Text = article.Title;
                    Category category = categoryManager.GetCategoryById(article.CategoryId);
                    categoryDropDownList.SelectedValue = category.Id.ToString();
                    CKEditor1.Text = article.Content;
                }
                
            }
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            int articleId = Convert.ToInt16(Session["articleId"]);
            Article article = articleManager.GetArticleById(articleId);
            article.Content = WebUtility.HtmlEncode(CKEditor1.Text);
            article.Title = articleNameTextBox.Text;
            article.DateTime = DateTime.Now;
            article.CategoryId = Convert.ToInt16(categoryDropDownList.SelectedValue);
            articleManager.UpdateArticle(article);
            Session["articleId"] = null;
            Response.Redirect("MyArticle.aspx");
        }
    }
}