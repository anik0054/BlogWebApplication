using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BlogWebApplication.DAL;
using BlogWebApplication.Model;

namespace BlogWebApplication.BLL
{
    public class CommentManager
    {
        CommentGateway commentGateway=new CommentGateway();
        public List<Comment> GetCommentByArticleId(int articleId)
        {
            return commentGateway.GetCommentByArticleId(articleId);
        }

        public void SaveComment(Comment comment)
        {
            commentGateway.SaveComment(comment);
        }
    }
}