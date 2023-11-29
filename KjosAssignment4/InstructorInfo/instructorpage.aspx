<%@ Page Title="Instructor Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="instructorpage.aspx.cs" Inherits="KjosAssignment4.InstructorInfo.instructorpage" %>

<asp:Content ID="Body" ContentPlaceHolderID="MainContent" runat="server">

    <div>
        INSTRUCTOR PAGE<br />
        <br />
        Hi <asp:LoginName ID="LoginName1" runat="server" />
        <br />
        <br />
        <asp:LoginStatus ID="LoginStatus1" runat="server" />

    </div>

</asp:Content>
