<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogOut.aspx.cs" Inherits="BlogWebApplication.UI.LogOut" %>
<%@ Import Namespace="BlogWebApplication.UI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <%
            Session.Abandon();
            Response.Redirect("Home.aspx");    
         %>
    </div>
    </form>
</body>
</html>
