<!-- Authors:    Brian Lloyd, Trevor Hann
 *   Date:       Winter 2015
 *   Project:    W8 Team Project
 *   Desc:       Create a website that allows students to log in and display their information
 *              Application uses a database and listview/gridview controls
-->
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Info.aspx.cs" Inherits="Info" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Info</title>
    <link href="Styles/Main.css" rel="stylesheet" />
    <link href="Styles/Info.css" rel="stylesheet" />
</head>
<body>
    <img alt="Haensel University Banner" class="banner" src="Images/UniversityBanner.png" />
    <form id="form1" runat="server">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnection %>" DeleteCommand="DELETE FROM [Classes] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Classes] ([ClassID], [StudentID]) VALUES (@ClassID, @StudentID)" SelectCommand="SELECT Classes.ID,Class.Name,Class.Description FROM [Classes] INNER JOIN Class ON Classes.ClassID = Class.ClassID WHERE ([StudentID] = @StudentID)" UpdateCommand="UPDATE [Classes] SET [ClassID] = @ClassID, [StudentID] = @StudentID WHERE [ID] = @ID" OnDeleted="SqlDataSource1_Deleted">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ClassID" Type="Int32" />
                <asp:Parameter Name="StudentID" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="StudentID" SessionField="StudentID" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="ClassID" Type="Int32" />
                <asp:Parameter Name="StudentID" Type="Int32" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    <div>
        <label>Student ID:</label>
        <asp:Label ID="lblID" runat="server" CssClass="results"></asp:Label>
        <br />
        <label>Name:</label><asp:Label ID="lblName" runat="server" CssClass="results"></asp:Label>
        <br />
        <label>Address:</label>
        <br /><asp:Label ID="lblAddress" runat="server" CssClass="address"></asp:Label>
        <br /><asp:Label ID="lblCity" runat="server" CssClass="address"></asp:Label>,
        <asp:Label ID="lblState" runat="server" CssClass="results" ></asp:Label>
        <asp:Label ID="lblZip" runat="server" CssClass="results" ></asp:Label>
        <br />
        <label>Email:</label> 
        <asp:Label ID="lblEmail" runat="server" CssClass="results"></asp:Label>
        <br />
        <label>
        <br />
        Courses </label>
        <asp:DropDownList ID="ddlCourses" runat="server" DataSourceID="sdsAvailableCourses" DataTextField="Name" DataValueField="ClassID">
        </asp:DropDownList>
        <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
&nbsp;<asp:GridView ID="gvCourses" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="gvCourses_SelectedIndexChanged" Width="326px" ForeColor="Black" GridLines="Vertical" DataKeyNames="ID">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" visible="false"/>
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
        <br />
       <asp:Button ID="btnLogInPage" runat="server" CausesValidation="False" OnClick="btnLogInPage_Click" Text="Log Out" />
                    <asp:SqlDataSource ID="sdsAvailableCourses" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnection %>" SelectCommand="SELECT ClassID, Name FROM Class WHERE ClassID NOT IN (SELECT ClassID FROM Classes WHERE StudentID = @SID)" InsertCommand="INSERT INTO Classes(ClassID, StudentID) VALUES (@ClassID, @SID)">
            <InsertParameters>
                <asp:SessionParameter Name="SID" SessionField="StudentID" />
                <asp:ControlParameter ControlID="ddlCourses" Name="ClassID" PropertyName="SelectedValue" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="SID" SessionField="StudentID" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
