<%@ Page Title="Admin Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="adminpage.aspx.cs" Inherits="KjosAssignment4.AdminInfo.adminpage" %>

<asp:Content ID="Body" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <div>
            ADMIN PAGE<br />
            <br />
            Hi <asp:LoginName ID="LoginName1" runat="server" />
            <br />
            <br />
            <asp:LoginStatus ID="LoginStatus1" runat="server" OnLoggingOut="LoginStatus1_LoggingOut" />

        </div>
    </main>

</asp:Content>
