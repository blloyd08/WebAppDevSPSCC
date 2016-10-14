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

public partial class Info : System.Web.UI.Page
{
    private Student student;
    protected void Page_Load(object sender, EventArgs e)
    {
        student = (Student)HttpContext.Current.Session["student"];
        lblID.Text = HttpContext.Current.Session["StudentID"].ToString();
        lblName.Text = student.FirstName + " " + student.LastName;
        lblAddress.Text = student.Address;
        lblCity.Text = student.City;
        lblState.Text = student.State;
        lblZip.Text = student.Zip;
        lblEmail.Text = student.Email;
    }
    protected void btnLogInPage_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
    protected void gvCourses_SelectedIndexChanged(object sender, EventArgs e)
    {

    }


    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (ddlCourses.Items.Count >0){//Make sure items still in drop down list
            sdsAvailableCourses.Insert();//Insert new record
            gvCourses.DataBind();//Update grid view
            ddlCourses.DataBind();//Update drop down list
        }
        
    }
    protected void SqlDataSource1_Deleted(object sender, SqlDataSourceStatusEventArgs e)
    {
        ddlCourses.DataBind();
    }
}