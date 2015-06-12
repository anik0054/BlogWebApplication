using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BlogWebApplication.BLL;
using BlogWebApplication.Model;

namespace BlogWebApplication.UI
{
    public partial class Publish : System.Web.UI.Page
    {
        ArticleManager articleManager=new ArticleManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            int articleId = Convert.ToInt16(Request.QueryString["articleId"]);
            if (Session["user"] != null)
            {
                Article article=articleManager.GetArticleById(articleId);
                article.DateTime = DateTime.Now;
                articleManager.AlterStatusOfArticle(article);
            }
            Response.Redirect("MyArticle.aspx");
        }
    }
}