/* Authors:    Brian Lloyd, Trevor Hann
 * Date:       Winter 2015
 * Project:    W8 Team Project
 * Desc:       Create a website that allows students to log in and display their information
 *              Application uses a database and listview/gridview controls
*/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Student
/// </summary>
public class Student
{
    public string StudentID { get; set; }
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public string Address { get; set; }
    public string City { get; set; }
    public string State { get; set; }
    public string Zip { get; set; }
    public string Email { get; set; }
}