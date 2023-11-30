using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace KjosAssignment4.MemberInfo
{
    public partial class memberpage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Connect to the database
            string conn = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\KarateSchool.mdf;Integrated Security=True;Connect Timeout=30";

            //sql connection object
            using (SqlConnection Sqlconn = new SqlConnection(conn))
            {
                //query to get member ID
                string query = "select UserID from NetUser where UserName = '" + HttpContext.Current.Session["nUserName"].ToString() + "'";
                SqlCommand cmd = new SqlCommand(query, Sqlconn);
                cmd.Connection.Open();
                string MemberID = cmd.ExecuteScalar().ToString();
                cmd.Connection.Close();

                //query to get member's name
                query = "select MemberFirstName, MemberLastName from Member where Member_UserID = " + MemberID;
                cmd = new SqlCommand(query, Sqlconn);
                cmd.Connection.Open();
                SqlDataReader dReader = cmd.ExecuteReader();
                dReader.Read();
                string name = dReader["MemberFirstName"].ToString() + " " + dReader["MemberLastName"].ToString();
                //set name to label on page
                nameLabel.Text = name;
                cmd.Connection.Close();

                //query to get data for table 
                query = "select SectionName, InstructorFirstName, InstructorLastName, SectionFee from Instructor join Section on Instructor.InstructorID = Section.Instructor_ID where Section.Member_ID = " + MemberID;
                cmd = new SqlCommand(query, Sqlconn);
                SqlDataAdapter dAdapter = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                //Fill set with data from query
                dAdapter.Fill(ds);
                //Add date to the table
                resultGridView.DataSource = ds;
                resultGridView.DataBind();

                Sqlconn.Close();

            }
        }

        protected void LoginStatus1_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Session.Clear();
            Session.RemoveAll();
            Session.Abandon();
            FormsAuthentication.SignOut();
            Response.Redirect("~/Home.aspx", true);
        }
    }
}