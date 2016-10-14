/*  Authors:    Brian Lloyd, Trevor Hann
 *  Date:       Winter 2015
 *  Project:    W8 Team Project
 *  Desc:       Create a website that allows students to log in and display their information
 *              Application uses a database and listview/gridview controls
 */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class LoopUpID : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnGetID_Click(object sender, EventArgs e)
    {
        //Query database for student matching first name and last name
        DataView studentsTable = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        studentsTable.RowFilter = string.Format("FirstName= '{0}' AND LastName='{1}'", txtFirstName.Text,txtLastName.Text);
       
        //Check if records found matching
        if (studentsTable.Count > 0)
        {
            //Query database for student matching first name and last name
            DataRowView row =  studentsTable[0];
            string studentID = row[0].ToString();
            lblID.ForeColor = System.Drawing.Color.White;
            lblID.Text = studentID;
            Session["SID"] = studentID;
        }
        else //Student not found
        {
            lblID.ForeColor = System.Drawing.Color.Red;
            lblID.Text = "Student not found";
        }
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx");
    }
}