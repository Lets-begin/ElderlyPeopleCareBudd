<%@ Page Title="" Language="C#" MasterPageFile="~/theme.Master" AutoEventWireup="true" CodeBehind="UpdateAccount.aspx.cs" Inherits="UberSkills.UpdateAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="table-responsive">
        <table class="table" style="width: 100%;">
            <tr>
                <td style="width: 154px">
                    <asp:Label ID="Label1" runat="server" Text="Image:"></asp:Label>
                </td>
                <td>
                    <asp:Image class="img-circle" ID="Image1" runat="server" Height="130px" Width="130px" />
                    <br />
                    <asp:FileUpload ID="FileUploadControl" runat="server" />
                    <br />
                    (pic must be less than 4 MB and only .jpg, .png .jpeg formats allowed)</td>
            </tr>
            <tr>
                <td style="width: 154px">
                    <asp:Label ID="Label2" runat="server" Text="Name:"></asp:Label>
                    <br />
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="No special characters (50 char max.)" ForeColor="Red" ValidationExpression="[A-Za-z ]{1,50}"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 154px">
                    <asp:Label ID="Label3" runat="server" Text="Email Id:"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label11" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 154px">
                    <asp:Label ID="Label4" runat="server" Text="Phone No.:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="No special characters (only numbers)" ForeColor="Red" ValidationExpression="[0-9]{10,15}"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 154px">
                    <asp:Label ID="Label5" runat="server" Text="Status"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="No special characters (200 char max.)" ForeColor="Red" ValidationExpression="[A-Za-z0-9,&quot; ]{1,200}"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 154px">
                    <asp:Label ID="Label6" runat="server" Text="Password"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox5" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server" ControlToValidate="TextBox5" EnableTheming="True" ErrorMessage="Only Use numbers or letters or underscore or combination of all(min 8 char max 20 chars)" ForeColor="Red" ValidationExpression="[A-Za-z0-9_]{8,20}"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 154px">
                    <asp:Label ID="Label9" runat="server" Text="Gender"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem Value="male">Male</asp:ListItem>
                        <asp:ListItem Value="female">Female</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="DropDownList1" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 154px">
                    <asp:Label ID="Label10" runat="server" Text="Age"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox8" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator11" runat="server" ControlToValidate="TextBox8" ErrorMessage="No special characters " ForeColor="Red" ValidationExpression="[0-9]{1,3}"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="error_label" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button class="btn btn-primary" ID="Button1" runat="server" OnClick="Button1_Click" Text="Update Account" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
