<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditArticlePage.aspx.cs" Inherits="BlogWebApplication.UI.EditArticlePage" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

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
    <form id="form1" runat="server">
        <div class="container content">
            <div class="row">
                <div class="col-md-9">
                    <h1 class="page-header">Edit article</h1>
                    <asp:Label ID="articleNameLabel" runat="server" Text="Enter Article Name"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="articleNameTextBox" runat="server" Width="249px"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Label ID="Label1" runat="server" Text="Select Category"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="categoryDropDownList" runat="server" Height="22px" Width="249px">
                </asp:DropDownList>
                    <br />
                    <br />
                    Compose Article&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    <br />
                    <CKEditor:CKEditorControl ID="CKEditor1" BasePath="/ckeditor/" runat="server"></CKEditor:CKEditorControl>
                    <br />
                    <br />
                    <asp:Button ID="saveButton" runat="server" Style="float:right;" class="btn btn-primary btn-lg" Text="Save" OnClick="saveButton_Click" />
                </div>
                <div class="col-md-3">
                    <!--#include file="Search.html" -->
                    <!--#include file="Category.html" -->
                </div>
            </div>
            <!--#include file="Footer.html" -->
        </div>
    </form>
</body>
</html>
