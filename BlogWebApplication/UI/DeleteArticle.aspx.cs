using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BlogWebApplication.BLL;

namespace BlogWebApplication.UI
{
    public partial class DeleteArticle : System.Web.UI.Page
    {
        ArticleManager articleManager=new ArticleManager();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                int articleId = Convert.ToInt16(Request.QueryString["articleId"]);
                articleManager.DeleteArticleById(articleId);
                Session["articleId"] = null;
                Response.Redirect("MyArticle.aspx");
            }
        }
    }
}