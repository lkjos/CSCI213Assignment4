<%@ Page Title="Admin Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="adminpage.aspx.cs" Inherits="KjosAssignment4.AdminInfo.adminpage" %>

<asp:Content ID="Body" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .label {margin-left:10px; margin-right:50px; width:100px;}
    </style>
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
            <asp:GridView ID="InstructorGridView" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" SelectedIndex="0" AutoGenerateSelectButton="True">
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
            <br />
            <div>
                <h2>Add new User:</h2>
                <asp:Label ID="Label6" runat="server" Text="User Type:" CssClass="label" Width="100px"></asp:Label><asp:DropDownList ID="ddlType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlType_SelectedIndexChanged">
                    <asp:ListItem Selected="True">Member</asp:ListItem>
                    <asp:ListItem>Instructor</asp:ListItem>
                </asp:DropDownList>
                
                <br />
                <asp:Label ID="Label5" runat="server" Text="User Name:" CssClass="label" Width="100px"></asp:Label><asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                <asp:Label ID="UserNameValidator" runat="server" ForeColor="Red" Text="* Required" Visible="False"></asp:Label>

                <br />
                <asp:Label ID="Label4" runat="server" Text="Password:" CssClass="label" Width="100px"></asp:Label><asp:TextBox ID="txtPassword" runat="server" CssClass="textbox"></asp:TextBox>
                <asp:Label ID="PasswordValidator" runat="server" ForeColor="Red" Text="* Required" Visible="False"></asp:Label>

                <br />
                <asp:Label ID="Label3" runat="server" Text="First Name:" CssClass="label" Width="100px"></asp:Label><asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                <asp:Label ID="FirstNameValidator" runat="server" ForeColor="Red" Text="* Required" Visible="False"></asp:Label>

                <br />
                <asp:Label ID="Label2" runat="server" Text="Last Name:" CssClass="label" Width="100px"></asp:Label><asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                <asp:Label ID="LastNameValidator" runat="server" ForeColor="Red" Text="* Required" Visible="False"></asp:Label>

                <br />

                <asp:Label ID="Label1" runat="server" Text="Phone Number:" CssClass="label" Width="100px"></asp:Label><asp:TextBox ID="txtPhoneNumber" runat="server"></asp:TextBox>
                <asp:Label ID="PhoneNumberValidator" runat="server" ForeColor="Red" Text="* Required" Visible="False"></asp:Label>

                <br />

                <asp:Label ID="EmailLabel" runat="server" Text="Email:" CssClass="label" Width="100px"></asp:Label><asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                <asp:Label ID="EmailValidator" runat="server" ForeColor="Red" Text="* Required" Visible="False"></asp:Label>

                <br />

                <br />
                <asp:Button ID="SubmitNewUser" runat="server" OnClick="SubmitNewUser_Click" Text="Submit" CssClass="button" />

                <br />
                <br />
                <h2>Assign Member to Section:</h2>
                <asp:Label ID="Label7" runat="server" Text="Member First Name:" CssClass="label" Width="150px"></asp:Label><asp:TextBox ID="txtMemberFirstName" runat="server"></asp:TextBox>
                <asp:Label ID="MemberFirstNameValidator" runat="server" ForeColor="Red" Text="* Required" Visible="False"></asp:Label>
                <br />
                <asp:Label ID="Label8" runat="server" Text="Member Last Name:" CssClass="label" Width="150px"></asp:Label><asp:TextBox ID="txtMemberLastName" runat="server"></asp:TextBox>
                <asp:Label ID="MemberLastNameValidator" runat="server" ForeColor="Red" Text="* Required" Visible="False"></asp:Label>
                <br />
                <asp:Label ID="Label9" runat="server" Text="Section:" CssClass="label" Width="150px"></asp:Label>
                <asp:DropDownList ID="ddlSection" runat="server">
                    <asp:ListItem Selected="True">Karate Age-Uke</asp:ListItem>
                    <asp:ListItem>Karate Chudan-Uke</asp:ListItem>
                </asp:DropDownList>
                <br />
                <asp:Label ID="Label10" runat="server" Text="Instructor First Name:" CssClass="label" Width="150px"></asp:Label><asp:TextBox ID="txtInstructorFirstName" runat="server"></asp:TextBox>
                <asp:Label ID="InstructorFirstNameValidator" runat="server" ForeColor="Red" Text="* Required" Visible="False"></asp:Label>
                <br />
                <asp:Label ID="Label11" runat="server" Text="Instructor Last Name:" CssClass="label" Width="150px"></asp:Label><asp:TextBox ID="txtInstructorLastName" runat="server"></asp:TextBox>
                <asp:Label ID="InstructorLastNameValidator" runat="server" ForeColor="Red" Text="* Required" Visible="False"></asp:Label>

            
                <br />
                <br />
                <asp:Button ID="SubmitSection" runat="server" Text="Submit" OnClick="SubmitSection_Click" />
                <br />
                <br />

            
            <asp:LoginStatus ID="LoginStatus1" runat="server" OnLoggingOut="LoginStatus1_LoggingOut" />

        </div>
    </main>

    </div>

</asp:Content>
