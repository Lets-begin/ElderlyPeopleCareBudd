<%@ Page Title="" Language="C#" MasterPageFile="~/theme.Master" AutoEventWireup="true" CodeBehind="SendRequest.aspx.cs" Inherits="UberSkills.SendRequest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <table style="width: 100%;">
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Title"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" Width="100%"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="TextBox1" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Don't use special chars(max 100 chars)" ForeColor="Red" ValidationExpression="[a-zA-Z0-9 !?.'&quot;,:;@-_]{1,100}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Description"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox2" CssClass="form-control" TextMode="MultiLine" runat="server" Height="150px" Width="100%"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="TextBox2" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Don't use special chars(max 200 chars)" ForeColor="Red" ValidationExpression="[a-zA-Z0-9 !?'.&quot;,:;@-_]{1,200}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Label ID="error_label" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><asp:Button CssClass="btn btn-primary" ID="Button1" runat="server" Text="Send your messgae to all listeners" OnClick="Button1_Click" /></td>
        </tr>
    </table>
    </td>
&nbsp;
</asp:Content>
