<%@ Page Title="" Language="C#" MasterPageFile="~/Statictheme.Master" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="UberSkills.LogIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="table-responsive">
        <table class="table" style="width: 100%;">
            <tr>
                <td style="width: 209px">Email:</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Invalid Email ID" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 209px">Password</td>
                <td>
                    <asp:TextBox ID="TextBox2" TextMode="Password" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server" ControlToValidate="TextBox2" EnableTheming="True" ErrorMessage="Only Use numbers or letters or underscore or combination of all(max 20 chars)" ForeColor="Red" ValidationExpression="[A-Za-z0-9_]{1,20}"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 209px">
                    <asp:Label ID="error_label" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="LogIn" OnClick="Button1_Click" />
                </td>
            </tr>
            <tr>
                <td style="width: 209px"><a href="CreateAccount.aspx">Create Account</a></td>
                <td><a href="ForgotPassword.aspx">Forgot Password</a></td>
            </tr>
        </table>
    </div>
</asp:Content>
