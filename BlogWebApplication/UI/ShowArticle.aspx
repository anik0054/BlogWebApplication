<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowArticle.aspx.cs" Inherits="BlogWebApplication.UI.ShowArticle" %>

<%
    int articleId = Convert.ToInt16(Request.QueryString["articleId"]);
    ArticleManager articleManager=new ArticleManager();
    UserManager userManager=new UserManager();
    CommentManager commentManager=new CommentManager();
    Article article=articleManager.GetArticleById(articleId);
    User aUser = userManager.GetUserById(article.UserId);
    List<Comment> commenList = commentManager.GetCommentByArticleId(article.Id);
%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Recurrence Blog</title>
    <!--#include file="Head.html" -->
</head>
<body>
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
                <div class="col-md-9" style="text-align: justify;">
                    <h3>
                        <%=article.Title %>
                    </h3>
                    <h6 class="lead">
                        by <%=aUser.Name %>
                    </h6>
                    <hr />
                    <p>
                        <span class="glyphicon glyphicon-time"></span>
                        Posted on <%=article.DateTime.ToLongDateString() %>at <%=article.DateTime.ToLongTimeString() %>
                    </p>
                    <hr/>
                   <%=article.Content%>
                    <hr />
                    <div class="well">
                        <h4>Leave a Comment:</h4>
                        <form role="form" runat="server">
                            <div class="form-group">
                                <asp:TextBox ID="commentTextBox" runat="server" Height="96px" Width="700px"></asp:TextBox>
                            </div>
                            <asp:Button ID="commentButton" runat="server" Text="Comment" OnClick="commentButton_Click" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <span id="alert" class="alert-danger" runat="server"></span>
                        </form>
                    </div>
                    <hr/>
                    <%
                        foreach (var index in commenList)
                        {
                            User commentorUser = userManager.GetUserById(index.UserId);
                    %>
                    <div class="media">
                        <a class="pull-left" href="#">
                            <img class="media-object" src="../images/comment.png" alt="" width="64px" height="64px">
                        </a>                   
                        <div class="media-body">
                            <h4 class="media-heading"><%= commentorUser.Name %>
                                <small><%= index.DateTime.ToLongDateString() %>at <%= index.DateTime.ToLongTimeString() %></small>
                            </h4>
                            <%= index.Content %>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>
                <div class="col-md-3">
                    <!--#include file="Search.html" -->
                    <!--#include file="Category.html" -->
                </div>
            </div>
            <!--#include file="Footer.html" -->
        </div>
</body>
</html>
