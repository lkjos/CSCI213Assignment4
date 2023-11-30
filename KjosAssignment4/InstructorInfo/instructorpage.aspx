<%@ Page Title="Instructor Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="instructorpage.aspx.cs" Inherits="KjosAssignment4.InstructorInfo.instructorpage" %>

<asp:Content ID="Body" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <div>
            INSTRUCTOR PAGE<br />
            <br />
            Hi <asp:LoginName ID="LoginName1" runat="server" />
            <br />
            <br />
            <asp:LoginStatus ID="LoginStatus1" runat="server" OnLoggingOut="LoginStatus1_LoggingOut" />

        </div>
    </main>

</asp:Content>
