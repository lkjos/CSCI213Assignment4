<%@ Page Title="Admin Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="adminpage.aspx.cs" Inherits="KjosAssignment4.AdminInfo.adminpage" %>

<asp:Content ID="Body" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <div>
            Hello Admin :D<br />
            <br />
            Members:<br />
            <asp:GridView ID="MemberGridView" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" DataSourceID="MemberTableLINQ">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="MemberFirstName" HeaderText="MemberFirstName" ReadOnly="True" SortExpression="MemberFirstName" />
                    <asp:BoundField DataField="MemberLastName" HeaderText="MemberLastName" ReadOnly="True" SortExpression="MemberLastName" />
                    <asp:BoundField DataField="MemberPhoneNumber" HeaderText="MemberPhoneNumber" ReadOnly="True" SortExpression="MemberPhoneNumber" />
                    <asp:BoundField DataField="MemberDateJoined" HeaderText="MemberDateJoined" ReadOnly="True" SortExpression="MemberDateJoined" />
                </Columns>
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
            <asp:LinqDataSource ID="MemberTableLINQ" runat="server" ContextTypeName="LINQDataContext" EntityTypeName="" Select="new (MemberFirstName, MemberLastName, MemberPhoneNumber, MemberDateJoined)" TableName="Members">
            </asp:LinqDataSource>
            <br />
            Instructors:<asp:GridView ID="InstructorGridView" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" DataSourceID="InstructorTableLINQ">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="InstructorFirstName" HeaderText="InstructorFirstName" SortExpression="InstructorFirstName" ReadOnly="True" />
                    <asp:BoundField DataField="InstructorLastName" HeaderText="InstructorLastName" SortExpression="InstructorLastName" ReadOnly="True" />
                    <asp:BoundField DataField="InstructorPhoneNumber" HeaderText="InstructorPhoneNumber" SortExpression="InstructorPhoneNumber" ReadOnly="True" />
                </Columns>
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
            <asp:LinqDataSource ID="InstructorTableLINQ" runat="server" ContextTypeName="LINQDataContext" EntityTypeName="" Select="new (InstructorFirstName, InstructorLastName, InstructorPhoneNumber)" TableName="Instructors">
            </asp:LinqDataSource>
            <br />
            <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                <asp:ListItem Selected="True">Add</asp:ListItem>
                <asp:ListItem>Remove</asp:ListItem>
                <asp:ListItem>Assign to Section</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <br />
            <asp:LoginStatus ID="LoginStatus1" runat="server" OnLoggingOut="LoginStatus1_LoggingOut" />

        </div>
    </main>

</asp:Content>
