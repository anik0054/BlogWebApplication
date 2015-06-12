using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BlogWebApplication.BLL;
using BlogWebApplication.Model;

namespace BlogWebApplication.UI
{
    public partial class UserEntry : System.Web.UI.Page
    {
        UserManager userManager=new UserManager();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void signUpButton_Click(object sender, EventArgs e)
        {
            User user=new User();
            user.Name = nameTextBox.Text;
            user.Email = emailTextBox.Text;
            user.UserName = userNameTextBox.Text;
            user.Password = passwordTextBox.Text;
            if (user.Name == ""||user.Email==""||user.UserName==""||user.Password=="")
            {
                alert.InnerHtml = "Fields cannot be empty";
            }
            else if(!Regex.IsMatch(user.Email,
                @"^(?("")("".+?(?<!\\)""@)|(([0-9a-z]((\.(?!\.))|[-!#\$%&'\*\+/=\?\^`\{\}\|~\w])*)(?<=[0-9a-z])@))" +
                @"(?(\[)(\[(\d{1,3}\.){3}\d{1,3}\])|(([0-9a-z][-\w]*[0-9a-z]*\.)+[a-z0-9][\-a-z0-9]{0,22}[a-z0-9]))$",
                RegexOptions.IgnoreCase))
            {
                alert.InnerHtml = "Email is not valid";
            }
            else
            {
                bool existFlag=false;
                List<User> userList=userManager.GetAllUser();
                foreach (var index in userList)
                {
                    if (index.UserName == user.UserName)
                    {
                        alert.InnerHtml = "User name already exists";
                        existFlag = true;
                        break;
                    }
                }
                if (existFlag == false)
                {
                    if (userManager.SaveUser(user))
                    {
                        Session["newAccount"] = "Your account has been successfully created. Log In to continue";
                        Response.Redirect("LogIn.aspx");
                    }
                }
            }
        }
    }
}