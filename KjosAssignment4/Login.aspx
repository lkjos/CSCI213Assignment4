<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="KjosAssignment4.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="main.css"/>
    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"/>

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>
        Login Page - Assignment 4
    </title>
</head>
<body>
    <nav class="navbar navbar-expand-sm navbar-toggleable-sm navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" runat="server" href="~/">CSCI 213 Assignment 4</a>
            <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target=".navbar-collapse" title="Toggle navigation" aria-controls="navbarSupportedContent"
                aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse d-sm-inline-flex justify-content-between">
                <ul class="navbar-nav flex-grow-1">
                    <li class="nav-item"><a class="nav-link" runat="server" href="~/Home.aspx">Home</a></li>
                    <li class="nav-item"><a class="nav-link" runat="server" href="~/Login.aspx">Login</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <form id="form1" runat="server">
        <asp:Login ID="Login1" runat="server" OnAuthenticate="Login1_Authenticate" BackColor="#F7F7DE" BorderColor="#CCCC99" BorderStyle="Solid" BorderWidth="1px" DisplayRememberMe="False" Font-Names="Trebuchet MS" Font-Size="10pt">
            <LabelStyle BorderStyle="None" />
            <TextBoxStyle BorderStyle="Solid" BorderWidth="1px" />
            <TitleTextStyle BackColor="#6B696B" Font-Bold="True" ForeColor="#FFFFFF"/>
        </asp:Login>
        <br />
        <asp:Label ID="IncorrectLabel" runat="server" ForeColor="Red" Text="Incorrect username or password." Visible="False"></asp:Label>
    </form>
</body>
</html>
