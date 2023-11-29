<%@ Page Title="Member Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="memberpage.aspx.cs" Inherits="KjosAssignment4.MemberInfo.memberpage" %>

<asp:Content ID="Body" ContentPlaceHolderID="MainContent" runat="server">

    <div>
        MEMBER PAGE<br />
        <br />
        Hi <asp:LoginName ID="LoginName1" runat="server" />
        <br />
        <br />
        <asp:LoginStatus ID="LoginStatus1" runat="server" />

    </div>

</asp:Content>
