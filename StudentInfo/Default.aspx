<!-- Authors:    Brian Lloyd, Trevor Hann
 *   Date:       Winter 2015
 *   Project:    W8 Team Project
 *   Desc:       Create a website that allows students to log in and display their information
 *              Application uses a database and listview/gridview controls
-->
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="LogOn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Log On</title>
    <link href="Styles/Main.css" rel="stylesheet" />
    <link href="Styles/LogOn.css" rel="stylesheet" />
</head>
<body>
    <img alt="Haensel University Banner" class="banner" src="Images/UniversityBanner.png" /><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnection %>" SelectCommand="SELECT * FROM [Student]"></asp:SqlDataSource>    
    <form id="form1" runat="server">
    <div>
        <label>Student ID:</label>
        <asp:TextBox ID="txtStudentID" runat="server" CssClass="entry"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvID" runat="server" ControlToValidate="txtStudentID" CssClass="validator" Display="Dynamic" ErrorMessage="Student ID is required"></asp:RequiredFieldValidator>
        <asp:CustomValidator ID="cvStudentID" runat="server" CssClass="validator" Display="Dynamic" ErrorMessage="Invalid student ID" OnServerValidate="cvStudentID_ServerValidate"></asp:CustomValidator>
        <asp:RegularExpressionValidator ID="revID" runat="server" ControlToValidate="txtStudentID" CssClass="validator" Display="Dynamic" ErrorMessage="Student ID must be 4 numbers" ValidationExpression="\d{4}"></asp:RegularExpressionValidator>
        <br />
        <label>Password:</label>
        <asp:TextBox ID="txtPassword" runat="server" CssClass="entry" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" CssClass="validator" ErrorMessage="Password is required" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:CustomValidator ID="cbPassword" runat="server" ErrorMessage="Invalid password" ControlToValidate="txtPassword" CssClass="validator" Display="Dynamic" OnServerValidate="cbPassword_ServerValidate"></asp:CustomValidator><br />
        <asp:Button ID="btnLogIn" runat="server" OnClick="btnLogIn_Click" Text="Log In" CssClass="action" />
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/LookUpID.aspx" ForeColor="#66CCFF">Look up student ID</asp:HyperLink>
    </div>
    </form>
</body>
</html>
