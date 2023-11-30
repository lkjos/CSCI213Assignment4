<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="KjosAssignment4.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Login ID="Login1" runat="server" OnAuthenticate="Login1_Authenticate">
        </asp:Login>
        <br />
        <asp:Label ID="IncorrectLabel" runat="server" ForeColor="Red" Text="Incorrect username or password" Visible="False"></asp:Label>
    </form>
</body>
</html>
