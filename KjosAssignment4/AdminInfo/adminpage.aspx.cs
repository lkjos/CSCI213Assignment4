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

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (RadioButtonList1.SelectedIndex != 0)
            {
                
            }
        }

        protected void ddlType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlType.SelectedValue.ToString() == "Instructor")
            {
                EmailLabel.Visible = false;
                txtEmail.Visible = false;
                EmailValidator.Enabled = false;
            }
            else
            {
                EmailLabel.Visible=true;
                txtEmail.Visible=true;
                EmailValidator.Enabled=true;
            }
        }

        protected void MemberRemove_Click(object sender, EventArgs e)
        {
            GridViewRow row = MemberGridView.SelectedRow;
            var ColumnList = row.Cells;

            Member delPerson = (from x in dbcon.Members
                                where x.MemberFirstName == ColumnList[0].ToString() && x.MemberLastName == ColumnList[1].ToString()
                                && x.MemberPhoneNumber == ColumnList[2].ToString() && x.MemberEmail == ColumnList[3].ToString()
                                select x).First();
            dbcon.Members.DeleteOnSubmit(delPerson);
            dbcon.SubmitChanges();

            ShowAllRecords();
        }

        protected void InstructorRemove_Click(object sender, EventArgs e)
        {
            GridViewRow row = InstructorGridView.SelectedRow;
            var ColumnList = row.Cells;

            Instructor delPerson = (from x in dbcon.Instructors
                                    where x.InstructorFirstName == ColumnList[0].ToString() && x.InstructorLastName == ColumnList[1].ToString() && x.InstructorPhoneNumber == ColumnList[2].ToString()
                                    select x).First();
            dbcon.Instructors.DeleteOnSubmit(delPerson);
            dbcon.SubmitChanges();

            ShowAllRecords();
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            if (RadioButtonList1.SelectedIndex == 0)
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

                if (RadioButtonList1.SelectedItem.Text == "Instructor")
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

                ShowAllRecords();
            }
        }

        protected void InstructorGridView_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}