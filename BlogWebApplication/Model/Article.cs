using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BlogWebApplication.Model
{
    public class Article
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
        public DateTime DateTime { get; set; }
        public int UserId { get; set; }
        public int CategoryId { get; set; }
        public string Status { get; set; }
        public int HitCounter { get; set; }
    }
}