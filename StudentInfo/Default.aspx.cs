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
using System.Data.SqlClient;
using System.Data;

public partial class LogOn : System.Web.UI.Page
{
    private Student student;
    const string admin = "9999";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["SID"] != null)
        {
            txtStudentID.Text = Session["SID"].ToString();
            txtPassword.Focus();
        }
    }

    //Look up StudentID and Password in DB.
    protected void btnLogIn_Click(object sender, EventArgs e)
    {
        Session.Remove("SID");//Remove student id session variable

        if (txtStudentID.Text == admin && txtPassword.Text == admin)//If logging into admin
        {
            Response.Redirect("EditStudent.aspx");
        }else if(passwordISValid(txtStudentID.Text,txtPassword.Text)){//Verify password valid for student
        //Get data from DB
        DataView studentsTable = getStudentData(txtStudentID.Text);
        DataRowView row = (DataRowView)studentsTable[0];
                //Save data in student object
                student = new Student();
                student.Address = row["Address"].ToString();
                student.City = row["City"].ToString();
                student.Email = row["Email"].ToString();
                student.Zip = row["Zip"].ToString();
                student.FirstName = row["FirstName"].ToString();
                student.LastName = row["LastName"].ToString();
                student.State = row["State"].ToString();
                student.StudentID = row["Id"].ToString();

                //Save student to session and redirect
                Session["Student"] = student;
                Session["StudentID"] = student.StudentID;//Used for Data List DataBinding
                Response.Redirect("Info.aspx");
        }
    }

    //Query Student table, return query results
    protected DataView getStudentData(String studentID)
    {
        DataView studentsTable = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        studentsTable.RowFilter = string.Format("Id= {0}", studentID);
        return studentsTable;
    }

    //Student ID Custom Validator. Check if student ID is registered
    protected void cvStudentID_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (getStudentData(txtStudentID.Text).Count == 0) args.IsValid = false;//Check number of records returned
    }

    //Check if password matches database password
    protected bool passwordISValid(string studentID,string password)
    {
        bool returnVal = false;//Value to be returned

        DataView studentsTable = getStudentData(studentID);
        if (studentsTable.Count > 0)//Confirm records matching student exist
        {
            DataRowView row = (DataRowView)studentsTable[0];
            if (row["Password"].ToString() == password)//Compare passwords
                returnVal = true;
        }
        return returnVal;
    }

    //Password custom validator. Check if textbox password matches DB password
    protected void cbPassword_ServerValidate(object source, ServerValidateEventArgs args)
    {
            args.IsValid = passwordISValid(txtStudentID.Text, txtPassword.Text);
    }
}