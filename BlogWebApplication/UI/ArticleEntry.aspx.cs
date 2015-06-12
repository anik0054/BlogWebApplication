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
    public partial class ArticleEntry : System.Web.UI.Page
    {
        CategoryManager categoryManager=new CategoryManager();
        ArticleManager articleManager=new ArticleManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Session["articleMessage"] = "You must LogIn to write an article";
                Response.Redirect("LogIn.aspx");
            }
            List<Category> categorieList = categoryManager.GetAllCategory();
            if (!IsPostBack)
            {
                foreach (var index in categorieList)
                {
                    categoryDropDownList.Items.Add(new ListItem(index.Name, index.Id.ToString()));
                }
            }
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            if (articleNameTextBox.Text == "" || CKEditor1.Text == "")
            {
                alert.InnerHtml = "Fields cannot be empty";
            }
            else
            {
                User user = (User) Session["user"];
                Article article = new Article();
                article.Content = WebUtility.HtmlEncode(CKEditor1.Text);
                article.Title = articleNameTextBox.Text;
                article.DateTime = DateTime.Now;
                article.UserId = user.Id;
                article.CategoryId = Convert.ToInt16(categoryDropDownList.SelectedValue);
                article.Status = "Unpublished";
                article.HitCounter = 0;
                articleManager.SaveArticle(article);
                Response.Redirect("MyArticle.aspx");
            }
        }
    }
}