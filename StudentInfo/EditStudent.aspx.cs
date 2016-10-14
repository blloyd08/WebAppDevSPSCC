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

public partial class EditStudent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogOut_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}