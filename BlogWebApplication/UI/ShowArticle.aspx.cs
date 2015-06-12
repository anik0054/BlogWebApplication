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
    public partial class ShowArticle : System.Web.UI.Page
    {
        CommentManager commentManager=new CommentManager();
        UserManager userManager=new UserManager();
        ArticleManager articleManager = new ArticleManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["currentUrl"] = null;
            if (!IsPostBack)
            {
                int articleId = Convert.ToInt16(Request.QueryString["articleId"]);
                articleManager.IncreaseCounter(articleId);
            }
        }

        protected void commentButton_Click(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                string url = HttpContext.Current.Request.Url.AbsoluteUri;
                Session["currentUrl"] = url;
                Session["commentMessage"] = "You must LogIn to comment";
                Response.Redirect("LogIn.aspx");
            }
            else
            {
                if (commentTextBox.Text == "")
                {
                    alert.InnerHtml = "Comment field cannot be empty";
                }
                else
                {
                    int articleId = Convert.ToInt16(Request.QueryString["articleId"]);
                    Comment comment = new Comment();
                    comment.Content = commentTextBox.Text;
                    comment.DateTime = DateTime.Now;
                    comment.ArticleId = articleId;
                    Article article = articleManager.GetArticleById(articleId);
                    User aUser = (User) Session["user"];
                    //User aUser = userManager.GetUserById(article.UserId);
                    comment.UserId = aUser.Id;
                    commentManager.SaveComment(comment);
                }
            }
        }
    }
}