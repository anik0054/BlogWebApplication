
<%@ Import Namespace="BlogWebApplication.BLL" %>
<%@ Import Namespace="BlogWebApplication.Model" %>
<%
    CategoryManager categoryManager=new CategoryManager();
    List<Category> categoryList = categoryManager.GetAllCategory();
    int count = categoryList.Count;
    int leftItems = count/2;
    if (count%2 != 0)
    {
        leftItems++;
    }
%>
<div class="well">
    <h4>Blog Categories</h4>
    <div class="row">
        <div class="col-lg-6">
            <ul class="list-unstyled">
                <%
                    for (int index = 1; index <= leftItems; index++)
                    {
                %>
                <li><a href="#"><%= categoryList[index - 1].Name %></a>
                </li>
                <%
                    }
                %>
            </ul>
        </div>
        <!-- /.col-lg-6 -->
        <div class="col-lg-6">
            <ul class="list-unstyled">
                <%
                    for (int index = leftItems+1; index <= count; index++)
                    {
                %>
                <li><a href="#"><%= categoryList[index - 1].Name %></a>
                </li>
                <%
                    }
                %>
            </ul>
        </div>
        <!-- /.col-lg-6 -->
    </div>
    <!-- /.row -->
</div>
