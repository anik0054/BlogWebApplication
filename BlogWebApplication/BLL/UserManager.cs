using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BlogWebApplication.DAL;
using BlogWebApplication.Model;

namespace BlogWebApplication.BLL
{
    public class UserManager
    {
        UserGateway userGateway=new UserGateway();
        public User GetUserById(int userId)
        {
            return userGateway.GetUserById(userId);
        }

        public List<User> GetAllUser()
        {
            return userGateway.GetAllUser();
        }

        public bool SaveUser(User user)
        {
            return userGateway.SaveUser(user);
        }
    }
}