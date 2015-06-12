<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WebUserControl1.ascx.cs" Inherits="BlogWebApplication.UI.WebUserControl1" %>

<%
    Session["temp"] = "yes";
%>
<p>
    <% Response.Write(Session["temp"]);%>
</p>