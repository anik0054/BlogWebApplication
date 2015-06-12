<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Demo.aspx.cs" Inherits="BlogWebApplication.UI.Demo" %>
<%@ Import Namespace="BlogWebApplication.BLL" %>
<%@ Import Namespace="BlogWebApplication.Model" %>
<%
    CategoryManager categoryManager=new CategoryManager();
    ArticleManager articleManager1=new ArticleManager();
    List<Category>categoryList = categoryManager.GetAllCategory();
    List<Article>getArticleListSortedByDateTime = articleManager1.GetAllArticleSortedByDateTime();
    List<Article>getArticleListSortedByHitCounter = articleManager1.GetArticleListSortedByHitCounter();
            int count = categoryList.Count;
%>
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Blog Categories</h3>
                </div>
                <div class="panel-body">

                    <ul class="list-unstyled">
                        <%
                        foreach (var item in categoryList)
                        {

                        List<Article>listOfArtical = articleManager1.GetArticleListByCategoryId(item.Id);
                            %>
                            <li role="presentation"><a href="ShowArticlesByCategory.aspx?categoryId=<%=item.Id %>"><%=item.Name %><span class="badge" style="float: right"><%= listOfArtical.Count %></span></a></li>
                            <%
                            }
                            %>
                    </ul>
                </div>
            </div>

            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Most Recent Articles</h3>
                </div>
                <div class="panel-body">
                    <%
                    int articlelimit = 5;
                    if (getArticleListSortedByDateTime.Count < 5)
                    {
                    articlelimit = getArticleListSortedByDateTime.Count;
                    }
                    for (int index=1;index<=articlelimit;index++)
                    {
                    %>
                    <div class="media">
                        <div class="media-left media-middle">
                            <a href="ShowArticle.aspx?articleId=<%=getArticleListSortedByDateTime[index-1].Id%>">
                                <!--<img class="media-object" src="..." alt="...">-->
                                <%
                                   string source = getArticleListSortedByDateTime[index - 1].Content;
                                   var reg = new Regex("src=(?:\"|\')?(?<imgSrc>[^>]*[^/].(?:jpg|bmp|gif|png))(?:\"|\')?");
                                   var match = reg.Match(source);
                                   if (match.Success)
                                   {
                                       var encod = match.Groups["imgSrc"].Value;
                                %>
                                <img class="media-object" src="<%= encod %>" height="64" width="64"/>
                                <%
                                   }
                                   else
                                   {
                                %>
                                <img class="media-object" src="../images/commentor.png" height="64" width="64"/>
                                <%
                                   }
                                %>
                            </a>
                        </div>
                        <div class="media-body">
                            <a href="ShowArticle.aspx?articleId=<%=getArticleListSortedByDateTime[index-1].Id%>">
                                <h4 class="media-heading"><%=getArticleListSortedByDateTime[index-1].Title %></h4>
                            </a>
                            <p>
                                <%
                                string content = getArticleListSortedByDateTime[index - 1].Content;
                                string stripped=Regex.Replace(content, "<.*?>", string.Empty);
                                int length = stripped.Length;
                                if (length > 10)
                                {
                                length = 10;
                                }
                                Response.Write(stripped.Substring(0,length));
                                %>
                            </p>
                        </div>
                    </div>
                    <%
                    }
                    %>
                </div>
            </div>

            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Most Viewed Articles</h3>
                </div>
                <div class="panel-body">
                    <%
                    articlelimit = 5;
                    if (getArticleListSortedByHitCounter.Count < 5)
                    {
                    articlelimit = getArticleListSortedByHitCounter.Count;
                    }
                    for (int index = 1; index <= articlelimit; index++)
                    {
                    %>
                    <div class="media">
                        <div class="media-left media-middle">
                            <a href="ShowArticle.aspx?articleId=<%=getArticleListSortedByHitCounter[index-1].Id %>">
                                <!--<img class="media-object" src="..." alt="...">-->
                                <%
                                   string source = getArticleListSortedByHitCounter[index - 1].Content;
                                   var reg = new Regex("src=(?:\"|\')?(?<imgSrc>[^>]*[^/].(?:jpg|bmp|gif|png))(?:\"|\')?");
                                   var match = reg.Match(source);
                                   if (match.Success)
                                   {
                                       var encod = match.Groups["imgSrc"].Value;
                                %>
                                <img class="media-object" src="<%= encod %>" height="64" width="64"/>
                                <%
                                   }
                                   else
                                   {
                                %>
                                <img class="media-object" src="../images/commentor.png" height="64" width="64"/>
                                <%
                                   }
                                %>
                            </a>
                        </div>
                        <div class="media-body">
                            <a href="ShowArticle.aspx?articleId=<%=getArticleListSortedByHitCounter[index-1].Id %>">
                                <h4 class="media-heading"><%=getArticleListSortedByHitCounter[index-1].Title %></h4>
                            </a>
                            <p>
                                <% 
                                string content = getArticleListSortedByHitCounter[index - 1].Content;
                                string stripped = Regex.Replace(content, "<.*?>", string.Empty);
                                int length = stripped.Length;
                                if (length > 10)
                                {
                                    length = 10;
                                }
                                Response.Write(stripped.Substring(0, length));
                                %>
                            </p>
                        </div>
                    </div>
                    <%
                    }
                    %>
                </div>
            </div>
