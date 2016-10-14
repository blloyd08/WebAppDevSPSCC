<!-- Authors:    Brian Lloyd, Trevor Hann
 *   Date:       Winter 2015
 *   Project:    W8 Team Project
 *   Desc:       Create a website that allows students to log in and display their information
 *              Application uses a database and listview/gridview controls
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LookUpID.aspx.cs" Inherits="LoopUpID" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ID Look Up</title>
    <link href="Styles/Main.css" rel="stylesheet" />
    <link href="Styles/LookUp.css" rel="stylesheet" />
</head>
<body>
    <img alt="Haensel University Banner" class="banner" src="Images/UniversityBanner.png" />
    <section>
    <form id="form1" runat="server">
        <label>First Name:</label>
        <asp:TextBox ID="txtFirstName" runat="server" CssClass="entry"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName" CssClass="validator" ErrorMessage="Required"></asp:RequiredFieldValidator>
        <br />
        <label>Last Name:</label>
        <asp:TextBox ID="txtLastName" runat="server" CssClass="entry"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName" CssClass="validator" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
        <br />
        <label>Student ID:</label>
        <asp:Label ID="lblID" runat="server" CssClass="entry"></asp:Label>
        <br />
        <br />
        <asp:Button ID="btnGetID" runat="server" OnClick="btnGetID_Click" Text="Get ID" />
        <asp:Button ID="btnBack" runat="server" Text="Back" CausesValidation="False" OnClick="btnBack_Click" />
    </form>
    </section>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnection %>" SelectCommand="SELECT [Id], [FirstName], [LastName] FROM [Student]"></asp:SqlDataSource>
</body>
</html>
