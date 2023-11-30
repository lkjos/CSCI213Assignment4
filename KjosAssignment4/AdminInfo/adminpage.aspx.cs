using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Net.NetworkInformation;
using System.Data.SqlTypes;

namespace KjosAssignment4.AdminInfo
{
    public partial class adminpage : System.Web.UI.Page
    {
        string conn = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\KarateSchool.mdf;Integrated Security=True;Connect Timeout=30";
        LINQDataContext dbcon;

        protected void Page_Load(object sender, EventArgs e)
        {
            
            dbcon = new LINQDataContext(conn);
            ShowAllRecords();

        }

        public void ShowAllRecords()
        {
            var MemberList = from x in dbcon.Members select x;
            MemberGridView.DataSource = MemberList;
            MemberGridView.DataBind();

            var InstructorList = from x in dbcon.Instructors select x;
            InstructorGridView.DataSource = InstructorList;
            InstructorGridView.DataBind();
        }

        protected void LoginStatus1_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Session.Clear();
            Session.RemoveAll();
            Session.Abandon();
            FormsAuthentication.SignOut();
            Response.Redirect("~/Home.aspx", true);
        }

        protected void ddlType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlType.SelectedValue.ToString() == "Instructor")
            {
                EmailLabel.Visible = false;
                txtEmail.Visible = false;
            }
            else
            {
                EmailLabel.Visible=true;
                txtEmail.Visible=true;
            }
        }

        protected void MemberRemove_Click(object sender, EventArgs e)
        {
            int row = MemberGridView.SelectedIndex;
            var columns = MemberGridView.Rows[row].Cells;

            Member delPerson = (from x in dbcon.Members
                                where (x.MemberFirstName == columns[1].Text.ToString() && x.MemberLastName == columns[2].Text.ToString() && x.MemberPhoneNumber == columns[3].Text.ToString())
                                select x).First();
            dbcon.Members.DeleteOnSubmit(delPerson);
            dbcon.SubmitChanges();

            ShowAllRecords();
        }

        protected void InstructorRemove_Click(object sender, EventArgs e)
        {
            int row = InstructorGridView.SelectedIndex;
            var columns = InstructorGridView.Rows[row].Cells;

            Instructor delPerson = (from x in dbcon.Instructors
                                    where (x.InstructorFirstName == columns[1].Text.ToString() && x.InstructorLastName == columns[2].Text.ToString() && x.InstructorPhoneNumber == columns[3].Text.ToString())
                                    select x).First();
            dbcon.Instructors.DeleteOnSubmit(delPerson);
            dbcon.SubmitChanges();

            ShowAllRecords();
        }

        protected void SubmitNewUser_Click(object sender, EventArgs e)
        {
            if (ValidateNewUser())
            {
                NetUser myUser = new NetUser();
                myUser.UserName = txtUserName.Text;
                myUser.UserPassword = txtPassword.Text;
                myUser.UserType = ddlType.SelectedItem.Text;

                dbcon.NetUsers.InsertOnSubmit(myUser);
                dbcon.SubmitChanges();

                NetUser newUser = (from x in dbcon.NetUsers
                                   where x.UserName == txtUserName.Text
                                   select x).First();

                if (ddlType.SelectedItem.Text == "Instructor")
                {
                    Instructor newPerson = new Instructor();
                    newPerson.InstructorID = newUser.UserID;
                    newPerson.InstructorFirstName = txtFirstName.Text;
                    newPerson.InstructorLastName = txtLastName.Text;
                    newPerson.InstructorPhoneNumber = txtPhoneNumber.Text;

                    dbcon.Instructors.InsertOnSubmit(newPerson);
                    dbcon.SubmitChanges();
                }
                else
                {
                    Member newPerson = new Member();
                    newPerson.Member_UserID = newUser.UserID;
                    newPerson.MemberFirstName = txtFirstName.Text;
                    newPerson.MemberLastName = txtLastName.Text;
                    newPerson.MemberDateJoined = DateTime.Now;
                    newPerson.MemberPhoneNumber = txtPhoneNumber.Text;
                    newPerson.MemberEmail = txtEmail.Text;

                    dbcon.Members.InsertOnSubmit(newPerson);
                    dbcon.SubmitChanges();
                }

                ClearInputs();
                ShowAllRecords();
            }
        }

        public bool ValidateNewUser()
        {
            UserNameValidator.Visible = false;
            PasswordValidator.Visible = false;
            FirstNameValidator.Visible = false;
            LastNameValidator.Visible = false;
            PhoneNumberValidator.Visible = false;
            EmailValidator.Visible = false;

            bool isValid = true;
            if (txtUserName.Text == "") { UserNameValidator.Visible = true; isValid = false; }
            if (txtPassword.Text == "") { PasswordValidator.Visible = true; isValid = false; }
            if (txtFirstName.Text == "") { FirstNameValidator.Visible = true; isValid = false; }
            if (txtLastName.Text == "") { LastNameValidator.Visible = true; isValid = false; }
            if (txtPhoneNumber.Text == "") { PhoneNumberValidator.Visible = true; isValid = false; }
            if (ddlType.SelectedItem.Text == "Member")
            {
                if (txtEmail.Text == "") { EmailValidator.Visible = true; isValid = false; }
            }
            
            return isValid;
        }

        public void ClearInputs()
        {
            txtUserName.Text = "";
            txtPassword.Text = "";
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtPhoneNumber.Text = "";
            txtEmail.Text = "";

            txtMemberFirstName.Text = "";
            txtMemberLastName.Text = "";
            txtInstructorFirstName.Text = "";
            txtInstructorLastName.Text = "";
        }

        protected void SubmitSection_Click(object sender, EventArgs e)
        {
            if (ValidateNewSection())
            {
                try{
                    Member member = (from x in dbcon.Members
                                     where (x.MemberFirstName == txtMemberFirstName.Text && x.MemberLastName == txtMemberLastName.Text)
                                     select x).First();

                    Instructor instructor = (from x in dbcon.Instructors
                                             where (x.InstructorFirstName == txtInstructorFirstName.Text && x.InstructorLastName == txtInstructorLastName.Text)
                                             select x).First();

                    Section lastSection = (from x in dbcon.Sections orderby x.SectionID descending select x).First();
                    Section newSection = new Section();
                    newSection.SectionID = Convert.ToInt32(lastSection.SectionID) + 1;
                    newSection.SectionName = ddlSection.Text;
                    if (ddlSection.Text == "Karate Age-Uke")
                    {
                        newSection.SectionFee = 500;
                    }
                    else
                    {
                        newSection.SectionFee = 600;
                    }
                    newSection.SectionStartDate = DateTime.Now;
                    newSection.Member_ID = member.Member_UserID;
                    newSection.Instructor_ID = instructor.InstructorID;

                    dbcon.Sections.InsertOnSubmit(newSection);
                    dbcon.SubmitChanges();

                    ClearInputs();
                    ShowAllRecords();
                } catch (Exception ex) { }
            }
        }

        public bool ValidateNewSection()
        {
            MemberFirstNameValidator.Visible = false;
            MemberLastNameValidator.Visible = false;
            InstructorFirstNameValidator.Visible = false;
            InstructorLastNameValidator.Visible = false;

            bool isValid = true;
            if (txtMemberFirstName.Text == "") { MemberFirstNameValidator.Visible = true; isValid = false; }
            if (txtMemberLastName.Text == "") { MemberLastNameValidator.Visible = true; isValid = false; }
            if (txtInstructorFirstName.Text == "") { InstructorFirstNameValidator.Visible = true; isValid = false; }
            if (txtInstructorLastName.Text == "") { InstructorLastNameValidator.Visible = true; isValid = false; }
            
            return isValid;
        }

    }
}