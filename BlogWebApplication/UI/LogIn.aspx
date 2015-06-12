<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="BlogWebApplication.UI.LogIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <div class="panel panel-primary" style="margin-top:20px;">
                        <div class="panel-heading">
                            <h3 class="panel-title text-center">Log In</h3>
                        </div>
                        <div class="panel-body">
                            <table style="margin: 0 auto;">
                                <tr style="height: 50px;">
                                    <td width="25%">User Name </td>
                                    <td width="75%">
                                        <asp:TextBox ID="userNameTextBox" runat="server" Width="300px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr style="height: 50px;">
                                    <td>Password </td>
                                    <td>
                                        <asp:TextBox ID="passwordTextBox" TextMode="Password" runat="server" Width="300px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td><span id="alert" class="alert-danger" runat="server"></span></td>
                                </tr>
                            </table>
                            <asp:Button ID="logInButton" runat="server" Style="float: right; margin-right:12%;" class="btn btn-primary" Text="Log In" OnClick="logInButton_Click" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <span id="alertBox" class="alert-danger" runat="server"></span>
                            <div class="text-center">
                                Does not have an account ?&nbsp;<a href="UserEntry.aspx">Sign Up</a>
                            </div>
                        </div>
                    </div>

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
