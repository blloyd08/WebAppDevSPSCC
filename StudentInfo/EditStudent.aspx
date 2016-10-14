<!-- Authors:    Brian Lloyd, Trevor Hann
 *   Date:       Winter 2015
 *   Project:    W8 Team Project
 *   Desc:       Create a website that allows students to log in and display their information
 *              Application uses a database and listview/gridview controls
-->
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditStudent.aspx.cs" Inherits="EditStudent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Admin</title>
    <link href="Styles/Main.css" rel="stylesheet" />
    <link href="Styles/EditStudents.css" rel="stylesheet" />
</head>
<body>
    <img src="Images/UniversityBanner.png" class="banner" />
    <form id="form1" runat="server">
    
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem">
            <AlternatingItemTemplate>
                <tr style="background-color:#FFF8DC;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Eval("FirstName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                    </td>
                    <td>
                        <asp:Label ID="StateLabel" runat="server" Text='<%# Eval("State") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ZipLabel" runat="server" Text='<%# Eval("Zip") %>' />
                    </td>
                    <td>
                        <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PasswordLabel" runat="server" Text='<%# Eval("Password") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color:#008A8C;color: #FFFFFF;">
                    <td>
                        <asp:Button ID="UpdateButton" ValidationGroup="edit" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' width="50px" />
                    </td>
                    <td>
                        <asp:TextBox ID="FirstNameTextBox" runat="server" Text='<%# Bind("FirstName") %>' width="90px"/>
                        <asp:RequiredFieldValidator ID="rfvFirstNameE" ControlToValidate="FirstNameTextBox" runat="server" ValidationGroup="edit" ErrorMessage="Required" CssClass="validator" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="LastNameTextBox" runat="server" Text='<%# Bind("LastName") %>' Width="90px" />
                        <asp:RequiredFieldValidator ID="rfvLastNameE" runat="server" ControlToValidate="LastNameTextBox" ValidationGroup="edit" ErrorMessage="Required" CssClass="validator" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' width="175px"/>
                        <asp:RequiredFieldValidator ID="rfvAddressE" runat="server" ValidationGroup="edit" ControlToValidate="AddressTextBox" ErrorMessage="Required" CssClass="validator" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>'  Width="90px"/>
                        <asp:RequiredFieldValidator ID="rfvCityE" runat="server" ValidationGroup="edit" ErrorMessage="Required" ControlToValidate="CityTextBox" CssClass="validator" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlState" runat="server" SelectedValue='<%# Bind("State") %>' Width="50px" >
                            <asp:ListItem Text="WA"  Value="WA"/>
                            <asp:ListItem Text="OR" />
                            <asp:ListItem Text="CA" />
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:TextBox ID="ZipTextBox" runat="server" Text='<%# Bind("Zip") %>' Width="50px" />
                        <asp:RequiredFieldValidator ID="rfvZipE" runat="server" ValidationGroup="edit" ControlToValidate="ZipTextBox" ErrorMessage="Required" CssClass="validator" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revZipE" runat="server" ValidationGroup="edit" ErrorMessage="5 Digits" CssClass="validator" ControlToValidate="ZipTextBox" Display="Dynamic" ValidationExpression="\d{5}"></asp:RegularExpressionValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' Width="175px" />
                        <asp:RequiredFieldValidator ID="rfvEmailE" runat="server" ValidationGroup="edit" ErrorMessage="Required" ControlToValidate="EmailTextBox" CssClass="validator" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="PasswordTextBox" runat="server" Text='<%# Bind("Password") %>' width="70px" />
                        <asp:RequiredFieldValidator ID="rfvPasswordE" runat="server" ValidationGroup="edit" ErrorMessage="Required" ControlToValidate="PasswordTextBox" CssClass="validator" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revPasswordE" runat="server" ValidationGroup="edit" ErrorMessage="4 Digits" CssClass="validator" Display="Dynamic" ControlToValidate="PasswordTextBox" ValidationExpression="\d{4}"></asp:RegularExpressionValidator>
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr >
                    <td>
                        <asp:Button ID="InsertButton" ValidationGroup="insert" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                    <td>
                        &nbsp;
                    <td>
                        <asp:TextBox ID="FirstNameTextBox" runat="server" Text='<%# Bind("FirstName") %>' Width="90px" />
                        <asp:RequiredFieldValidator ValidationGroup="insert" ID="rfvFirstName" runat="server" ErrorMessage="Required" ControlToValidate="FirstNameTextBox" CssClass="validator" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="LastNameTextBox" runat="server" Text='<%# Bind("LastName") %>' Width="90px" />
                        <asp:RequiredFieldValidator ID="rfvLastName" ValidationGroup="insert" CssClass="validator" runat="server" ErrorMessage="Required" Display="Dynamic" ControlToValidate="LastNameTextBox"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' width="175px"/>
                        <asp:RequiredFieldValidator ID="rfvAddress" ValidationGroup="insert" CssClass="validator" runat="server" ErrorMessage="Required" Display="Dynamic" ControlToValidate="AddressTextBox" ></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' width="90px"/>
                        <asp:RequiredFieldValidator ID="rfvCity" ValidationGroup="insert" runat="server" Display="Dynamic" ControlToValidate="CityTextBox" ErrorMessage="Required" CssClass="validator"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlState" runat="server" SelectedValue='<%# Bind("State") %>' Width="50px" >
                            <asp:ListItem Text="WA"  Value="WA"/>
                            <asp:ListItem Text="OR" />
                            <asp:ListItem Text="CA" />
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:TextBox ID="ZipTextBox" runat="server" Text='<%# Bind("Zip") %>' Width="50px"/>
                        <asp:RequiredFieldValidator ID="rfvZip" ValidationGroup="insert" runat="server" ControlToValidate="ZipTextBox" Display="Dynamic" ErrorMessage="Required" CssClass="validator"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revZip" ValidationGroup="insert" runat="server" ControlToValidate="ZipTextBox" CssClass="validator" Display="Dynamic" ErrorMessage="Must be 5 digits" ValidationExpression="\d{5}"></asp:RegularExpressionValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' Width="175px" />
                        <asp:RequiredFieldValidator ID="rfvEmail" ValidationGroup="insert" runat="server" ControlToValidate="EmailTextBox" Display="Dynamic" ErrorMessage="Required" CssClass="validator"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="PasswordTextBox" runat="server" Text='<%# Bind("Password") %>' width="75px"/>
                        <asp:RequiredFieldValidator ID="rfvPassword" ValidationGroup="insert" runat="server" ControlToValidate="PasswordTextBox" Display="Dynamic" CssClass ="validator" ErrorMessage="Required"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revPassword" ValidationGroup="insert" runat="server" ControlToValidate="PasswordTextBox" CssClass="validator" Display ="Dynamic" ErrorMessage="4 Digits" ValidationExpression="\d{4}"></asp:RegularExpressionValidator>
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color:#DCDCDC;color: #000000;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" causesValidation="false" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Eval("FirstName") %>' Width="90px" />
                    </td>
                    <td>
                        <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' Width="90px" />
                    </td>
                    <td>
                        <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' width="125px"/>
                    </td>
                    <td>
                        <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                    </td>
                    <td>
                        <asp:Label ID="StateLabel" runat="server" Text='<%# Eval("State") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ZipLabel" runat="server" Text='<%# Eval("Zip") %>' />
                    </td>
                    <td>
                        <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PasswordLabel" runat="server" Text='<%# Eval("Password") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;font-size:15px">
                                <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                    <th runat="server"></th>
                                    <th runat="server">ID</th>
                                    <th runat="server">First Name</th>
                                    <th runat="server">Last Name</th>
                                    <th runat="server">Address</th>
                                    <th runat="server">City</th>
                                    <th runat="server">State</th>
                                    <th runat="server">Zip</th>
                                    <th runat="server">Email</th>
                                    <th runat="server">Password</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                            <asp:DataPager ID="DataPager1" runat="server">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                    <td>
                        <asp:Button ID="DeleteButton1" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton1" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="FirstNameLabel1" runat="server" Text='<%# Eval("FirstName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="LastNameLabel1" runat="server" Text='<%# Eval("LastName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="AddressLabel1" runat="server" Text='<%# Eval("Address") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CityLabel1" runat="server" Text='<%# Eval("City") %>' />
                    </td>
                    <td>
                        <asp:Label ID="StateLabel1" runat="server" Text='<%# Eval("State") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ZipLabel1" runat="server" Text='<%# Eval("Zip") %>' />
                    </td>
                    <td>
                        <asp:Label ID="EmailLabel1" runat="server" Text='<%# Eval("Email") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PasswordLabel1" runat="server" Text='<%# Eval("Password") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnection %>" DeleteCommand="DELETE FROM [Student] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Student] ([FirstName], [LastName], [Address], [City], [State], [Zip], [Email], [Password]) VALUES (@FirstName, @LastName, @Address, @City, @State, @Zip, @Email, @Password)" SelectCommand="SELECT * FROM [Student]" UpdateCommand="UPDATE [Student] SET [FirstName] = @FirstName, [LastName] = @LastName, [Address] = @Address, [City] = @City, [State] = @State, [Zip] = @Zip, [Email] = @Email, [Password] = @Password WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="State" Type="String" />
                <asp:Parameter Name="Zip" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="State" Type="String" />
                <asp:Parameter Name="Zip" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
        <asp:Button ID="btnLogOut" runat="server" OnClick="btnLogOut_Click" Text="Log Out" />
    
    </form>
</body>
</html>
