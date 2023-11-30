<%@ Page Title="Admin Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="adminpage.aspx.cs" Inherits="KjosAssignment4.AdminInfo.adminpage" %>

<asp:Content ID="Body" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <div>
            Hello Admin !<br />
            <br />
            Members:<br />
            <asp:GridView ID="MemberGridView" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" AutoGenerateSelectButton="True" SelectedIndex="0">
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
                <SelectedRowStyle BackColor="#3399FF" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                <SortedAscendingHeaderStyle BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                <SortedDescendingHeaderStyle BackColor="#575357" />
            </asp:GridView>
            <p>
                &nbsp;<asp:Button ID="MemberRemove" runat="server" Text="Remove Selected Member" OnClick="MemberRemove_Click" />
            <br />
            Instructors:</p>
            <asp:GridView ID="InstructorGridView" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" SelectedIndex="0" AutoGenerateSelectButton="True" OnSelectedIndexChanged="InstructorGridView_SelectedIndexChanged">
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
                <SelectedRowStyle BackColor="#3399FF" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                <SortedAscendingHeaderStyle BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                <SortedDescendingHeaderStyle BackColor="#575357" />
            </asp:GridView>
            <asp:Button ID="InstructorRemove" runat="server" Text="Remove Selected Instructor" OnClick="InstructorRemove_Click" />
            <br />
            <br />
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                <asp:ListItem Selected="True">Add</asp:ListItem>
                <asp:ListItem>Assign to Section</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <br />
            <div>

                &nbsp;&nbsp;Employee Type:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:DropDownList ID="ddlType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlType_SelectedIndexChanged">
                    <asp:ListItem Selected="True">Member</asp:ListItem>
                    <asp:ListItem>Instructor</asp:ListItem>
                </asp:DropDownList>
                
                <br />
                &nbsp;&nbsp;User Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtUserName" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>

                <br />
                &nbsp;&nbsp;Password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPassword" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>

                <br />
                &nbsp;&nbsp;First Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirstName" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>

                <br />
                &nbsp;&nbsp;Last Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLastName" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>

                <br />

                &nbsp;&nbsp;Phone Number:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtPhoneNumber" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>

                <br />

                &nbsp;&nbsp;<asp:Label ID="EmailLabel" runat="server" Text="Email:"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="EmailValidator" runat="server" ControlToValidate="txtEmail" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>

                <br />

                <br />
                <asp:Button ID="SubmitButton" runat="server" OnClick="SubmitButton_Click" Text="Submit" />

            </div>
            
            <asp:LoginStatus ID="LoginStatus1" runat="server" OnLoggingOut="LoginStatus1_LoggingOut" />

        </div>
    </main>

</asp:Content>
