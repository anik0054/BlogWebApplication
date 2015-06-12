<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowArticleList.aspx.cs" Inherits="BlogWebApplication.UI.ShowArticleList" %>

<%@ Import Namespace="BlogWebApplication.BLL" %>
<%@ Import Namespace="BlogWebApplication.Model" %>

<% 
    ArticleManager articleManager = new ArticleManager();
    UserManager userManager = new UserManager();
    List<Article> articleList = articleManager.GetAllArticle();
    int noOfArticles = articleList.Count;
    int noOfPage = noOfArticles / 10 + 1;
%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Recurrence Blog</title>
    <!--#include file="Head.html" -->
</head>
<body>
    <div class="container">
        <div class="row">
            <!--#include file="AuthenticationButton.html" -->
        </div>
        <div class="row">
            <!--#include file="Navigation.html" -->
        </div>
        <div class="row">
            <div class="col-md-9">
                <h1 class="page-header">All Articles<small></small></h1>
                <%  
                        int selectedPage = Convert.ToInt16(Request.QueryString["page"]);
                        int page = 1;
                        if (selectedPage > 1)
                        {
                            page = selectedPage;
                        }
                        int start = (page - 1)*10 + 1;
                        int limit = (page-1)*10 + 10;
                        if (limit > noOfArticles)
                        {
                            limit = noOfArticles;
                        }
                        for (int index = start; index <= limit; index++)
                        {
                            Article article = articleList[index - 1];
                %>
                <h2>
                    <a href="ShowArticle.aspx?articleId=<%=article.Id%>"><%=article.Title %></a>
                </h2>
                <p class="lead">
                    by 
                        <% 
                        User user = userManager.GetUserById(article.UserId);
                        Response.Write(user.Name);
                        %>
                </p>
                <p><span class="glyphicon glyphicon-time"></span>Posted on <%=article.DateTime.ToLongDateString()%> at <%=article.DateTime.ToLongTimeString() %></p>
                <hr />
                <div class="row">
                    <div class="col-md-3">
                        <img class="img-responsive imageSize" src="../images/Chrysanthemum.jpg" alt="" />
                    </div>
                    <div class="col-md-8">
                        <p>
                            <%
                            int length = article.Content.Length;
                            if (length > 20)
                            {
                                length = 20;
                            }
                            Response.Write(article.Content.Substring(0, length));
                            %>
                        </p>
                        <a class="btn btn-primary" href="#">Read More <span class="glyphicon glyphicon-chevron-right"></span></a>
                    </div>
                </div>
                <hr/>
                <% 
                    }
                %>
            </div>
            <div class="col-md-3">
                <!--#include file="Search.html" -->
                <!--#include file="Category.html" -->
            </div>
        </div>
        <div class="row">
            <div class="text-center">
                <ul class="pagination">
                    <%
                        if (page == 1)
                        {
                    %>
                    <li class="active"><a href="ShowArticleList.aspx?page=<%=page%>"><%=page%> </a></li>
                    <li><a href="ShowArticleList.aspx?page=<%=page+1%>"><%=page+1%> </a></li>
                    <li><a href="ShowArticleList.aspx?page=<%=page+2%>"><%=page+2%> </a></li>
                    <%
                    }
                    else if (page == noOfPage && page!=2)
                    {
                    %>
                    <li><a href="ShowArticleList.aspx?page=<%=page-2%>"><%=page-2%> </a></li>
                    <li><a href="ShowArticleList.aspx?page=<%=page-1%>"><%=page-1%> </a></li>
                    <li class="active"><a href="ShowArticleList.aspx?page=<%=page%>"><%=page%> </a></li>
                    <%
                    }
                    else
                    {
                    %>
                    <li><a href="ShowArticleList.aspx?page=<%=page-1%>"><%=page-1%> </a></li>
                    <li class="active"><a href="ShowArticleList.aspx?page=<%=page%>"><%=page%> </a></li>
                    <li><a href="ShowArticleList.aspx?page=<%=page+1%>"><%=page+1%> </a></li>
                    <%
                    }
                    %>
                </ul>
            </div>
        </div>
        <!--#include file="Footer.html" -->
    </div>
</body>
</html>
