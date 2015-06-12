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
    public partial class LogIn : System.Web.UI.Page
    {
        UserManager userManager=new UserManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["newAccount"] != null)
            {
                alertBox.InnerHtml = Session["newAccount"].ToString();
                Session["newAccount"]=null;
            }
            if (Session["articleMessage"] != null)
            {
                alertBox.InnerHtml = Session["articleMessage"].ToString();
            }
            if (Session["commentMessage"] != null)
            {
                alertBox.InnerHtml = Session["commentMessage"].ToString();
            }
        }

        protected void logInButton_Click(object sender, EventArgs e)
        {
            List<User> userList = userManager.GetAllUser();
            User user=new User();
            bool flag = false;
            foreach (var index in userList)
            {                
                if (index.UserName == userNameTextBox.Text)
                {
                    if (index.Password == passwordTextBox.Text)
                    {
                        user.Id = index.Id;
                        user.UserName = index.UserName;
                        user.Email = index.Email;
                        user.Password = index.Password;
                        flag = true;
                    }
                    break;
                }
            }
            if (flag == true)
            {
                Session["user"] = user;
                if (Session["currentUrl"] == null)
                {
                    if (Session["articleMessage"] != null)
                    {
                        Session["articleMessage"] = null;
                        Response.Redirect("ArticleEntry.aspx");
                    }
                    else
                    {
                        Response.Redirect("Home.aspx");
                    }
                }
                else
                {
                    Response.Redirect(Session["currentUrl"].ToString());
                }
               
            }
            else
            {
                alert.InnerHtml = "User Name and/or Password mismatch";
            }
        }
    }
}