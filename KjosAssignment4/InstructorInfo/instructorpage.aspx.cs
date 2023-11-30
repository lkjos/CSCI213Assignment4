using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace KjosAssignment4.InstructorInfo
{
    public partial class instructorpage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Connect to the database
            string conn = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\KarateSchool.mdf;Integrated Security=True;Connect Timeout=30";
            
            //sql connection object
            using (SqlConnection Sqlconn = new SqlConnection(conn))
            {
                //query to get instructor ID
                string query = "select UserID from NetUser where UserName = '" + HttpContext.Current.Session["nUserName"].ToString() + "'";
                SqlCommand cmd = new SqlCommand(query, Sqlconn);
                cmd.Connection.Open();
                string InstructorID = cmd.ExecuteScalar().ToString();
                cmd.Connection.Close();

                //query to get instructor's name
                query = "select InstructorFirstName, InstructorLastName from Instructor where InstructorID = " + InstructorID;
                cmd = new SqlCommand(query, Sqlconn);
                cmd.Connection.Open();
                SqlDataReader dReader = cmd.ExecuteReader();
                dReader.Read();
                string name = dReader["InstructorFirstName"].ToString() + " " + dReader["InstructorLastName"].ToString();
                //set name to label on page
                NameLabel.Text = name;
                cmd.Connection.Close();

                //query to get data for table
                query = "select SectionName, MemberFirstName, MemberLastName from Member join Section on Member.Member_UserID = Section.Member_ID where Section.Instructor_ID = " + InstructorID;
                cmd = new SqlCommand(query, Sqlconn);
                SqlDataAdapter dAdapter = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                //Fill set with data from query
                dAdapter.Fill(ds);
                //Add data to the table
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