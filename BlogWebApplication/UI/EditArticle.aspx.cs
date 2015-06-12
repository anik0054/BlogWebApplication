using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BlogWebApplication.Model;

namespace BlogWebApplication.UI
{
    public partial class EditArticle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int articleId = Convert.ToInt16(Request.QueryString["articleId"]);
            if (Session["user"] != null)
            {
                Session["articleId"] = articleId;
                Response.Redirect("EditArticlePage.aspx");
            }
        }
    }
}