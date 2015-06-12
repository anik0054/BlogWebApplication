using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BlogWebApplication.Model
{
    public class Comment
    {
        public int Id { set; get; }
        public string Content { get; set; }
        public DateTime DateTime { get; set; }
        public int ArticleId { get; set; }
        public int UserId { get; set; }
    }
}