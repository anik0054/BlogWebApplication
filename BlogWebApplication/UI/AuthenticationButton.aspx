
<%@ Import Namespace="BlogWebApplication.Model" %>

<div class="col-md-12" style="background: white; padding-top: 10px; padding-bottom: 10px;">
    <div class="col-md-10"></div>
    <%
    if (Session["user"] == null)
    {
    %>
        <div class="col-md-1">
            <a href="UserEntry.aspx">
                <button type="button" class="btn btn-primary">Sign Up</button>
            </a>
        </div>
        <div class="col-md-1">
            <a href="LogIn.aspx">
                <button type="button" class="btn btn-primary">Log In</button>
            </a>
        </div>
    <%
    }
    else
    {
    User user = (User)Session["user"];
    %>
        <div class="col-md-1"></div>
        <div class="col-md-1">
            <div class="btn-group">
                <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                    <%=user.UserName%> <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="#">Log Out</a></li>
                </ul>
            </div>
        </div>
    <%
    }
    %>
</div>
