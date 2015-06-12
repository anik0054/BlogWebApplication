using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BlogWebApplication.DAL;
using BlogWebApplication.Model;

namespace BlogWebApplication.BLL
{
    public class CategoryManager
    {
        CategoryGateway categoryGateway=new CategoryGateway();
        public List<Category> GetAllCategory()
        {
            return categoryGateway.GetAllCategory();
        }

        public Category GetCategoryById(int categoryId)
        {
            return categoryGateway.GetCategoryById(categoryId);
        }
    }
}