<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="BlogWebApplication.UI.Home" %>

<%@ Import Namespace="BlogWebApplication.BLL" %>
<%@ Import Namespace="BlogWebApplication.Model" %>
<%@ Register Src="~/UI/WebUserControl1.ascx" TagPrefix="uc1" TagName="WebUserControl1" %>


<% 
    ArticleManager articleManager = new ArticleManager();
    UserManager userManager = new UserManager();
    CategoryManager acategoryManager = new CategoryManager();
    List<Article> articleList = articleManager.GetAllArticle();
    int noOfArticles = articleList.Count;
    int noOfPage = noOfArticles / 10 + 1;
%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Recurrence Blog</title>
    <!--#include file="Head.html" -->
</head>
<body>
    <div id="fb-root"></div>
    <script>(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.3";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

    <header>

        <!--#include file="AuthenticationButton.html" -->


    </header>
    <div class="container">
        <div class="row">
            <!--#include file="Navigation.html" -->
        </div>
    </div>
    <div class="container content">

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
                    int start = (page - 1) * 10 + 1;
                    int limit = (page - 1) * 10 + 10;
                    if (limit > noOfArticles)
                    {
                        limit = noOfArticles;
                    }
                    for (int index = start; index <= limit; index++)
                    {
                        Article article = articleList[index - 1];
                %>
                <h4>
                    <a href="ShowArticle.aspx?articleId=<%=article.Id%>"><%=article.Title %></a>
                </h4>
                <% 
                        User user = userManager.GetUserById(article.UserId);
                        Category category = acategoryManager.GetCategoryById(article.CategoryId);
                %>
                <p>Author Name : <%=user.Name %> &nbsp;&nbsp;<span class="glyphicon glyphicon-time"></span>Posted on : <%=article.DateTime.ToLongDateString()%> at <%=article.DateTime.ToLongTimeString() %> Category : <%=category.Name %></p>
                <hr />
                <div class="row">
                    <div class="col-md-3">
                        <a href="ShowArticle.aspx?articleId=<%=article.Id%>">
                            <%
                        string source = article.Content;
                        var reg = new Regex("src=(?:\"|\')?(?<imgSrc>[^>]*[^/].(?:jpg|bmp|gif|png))(?:\"|\')?");
                        var match = reg.Match(source);
                        if (match.Success)
                        {
                            var encod = match.Groups["imgSrc"].Value;
                            %>
                            <img src="<%=encod %>" alt="" style="width: 200px" height="170" />
                            <%
                        }
                        else
                        {
                            %>
                            <img class="img-responsive" src="../images/default_blog_large.png" alt="" width="200" height="200" />
                            <% 
                        }    
                            %>
                        </a>
                    </div>
                    <div class="col-md-9 article">
                        <p class="text-justify">
                            <%
                        string stripped = Regex.Replace(article.Content, "<.*?>", string.Empty);
                        int length = stripped.Length;
                        if (length > 500)
                        {
                            length = 500;
                        }
                        Response.Write(stripped.Substring(0, length));
                            %>
                        .....
                        </p>
                        <a class="btn btn-primary" href="ShowArticle.aspx?articleId=<%=article.Id%>">Read More <span class="glyphicon glyphicon-chevron-right"></span></a>
                    </div>
                </div>
                <hr />
                <% }
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
                        if (page == 1 && page == noOfPage)
                        {
                    %>
                    <li class="disabled"> <a class="glyphicon glyphicon-arrow-left" > Newer Posts </a> </li> 
                    <li> <a class="active"><%=page%> </a></li>
                    <li class="disabled"> <a> Older Posts &nbsp;&nbsp;<span class="disabled glyphicon glyphicon-arrow-right"></span></a> </li> 
                    <%
                    }
                    else if (page == 1)
                    {
                    %>
                    <li class="disabled"> <a class="glyphicon glyphicon-arrow-left" > Newer Posts </a> </li> 
                    <li> <a class="active"><%=page%> </a></li>
                    <li> <a href="Home.aspx?page=<%=page+1%>"> Older Posts &nbsp;&nbsp;<span class="disabled glyphicon glyphicon-arrow-right"></span></a> </li> 
                    <%
                    }
                    else if (page == noOfPage)
                    {
                    %>
                    <li> <a class="glyphicon glyphicon-arrow-left" href="Home.aspx?page=<%=page-1%>"> Newer Posts </a> </li> 
                    <li> <a class="active"><%=page%> </a></li>
                    <li class="disabled"> <a> Older Posts &nbsp;&nbsp;<span class="disabled glyphicon glyphicon-arrow-right"></span></a> </li> 
                    <%
                    }
                    else
                    {
                    %>
                    <li> <a class="glyphicon glyphicon-arrow-left" href="Home.aspx?page=<%=page-1%>"> Newer Posts </a> </li> 
                    <li> <a class="active"><%=page%> </a></li>
                    <li> <a href="Home.aspx?page=<%=page+1%>"> Older Posts &nbsp;&nbsp;<span class="disabled glyphicon glyphicon-arrow-right"></span></a> </li> 
                    <%
                    }
                    %>
                </ul>
            </div>
        </div>
        <uc1:WebUserControl1 runat="server" ID="WebUserControl1" />

    </div>
</body>
</html>
