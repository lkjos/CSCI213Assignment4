﻿<%@ Page Title="Instructor Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="instructorpage.aspx.cs" Inherits="KjosAssignment4.InstructorInfo.instructorpage" %>

<asp:Content ID="Body" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <div>
            Welcome,
            <asp:Label ID="NameLabel" runat="server" Text="name"></asp:Label>
&nbsp;!<br />
            <br />
            <asp:GridView ID="resultGridView" runat="server" CellPadding="4" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" >
                <AlternatingRowStyle BackColor="White" />
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#F7F7DE" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                <SortedAscendingHeaderStyle BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                <SortedDescendingHeaderStyle BackColor="#575357" />
            </asp:GridView>
            <br />
            <asp:LoginStatus ID="LoginStatus1" runat="server" OnLoggingOut="LoginStatus1_LoggingOut" />

        </div>
    </main>

</asp:Content>
