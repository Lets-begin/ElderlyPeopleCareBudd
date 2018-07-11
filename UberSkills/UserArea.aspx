<%@ Page Title="" Language="C#" MasterPageFile="~/theme.Master" AutoEventWireup="true" CodeBehind="UserArea.aspx.cs" Inherits="UberSkills.UserArea" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
       
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="table-responsive">
        <div id="jabberbox">
            <table class="table" style="width: 100%;">
                <tr>
                    <td style="width: 276px">
                        <asp:Label ID="Label4" runat="server" Text="Enter JabberID to whom You Want To talk"></asp:Label>
                    </td>
                    <td style="width: 257px">
                        <asp:TextBox class="form-control" ID="TextBox3" runat="server" Height="33px" Width="182px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="-24577@chat.quickblox.com"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 276px">&nbsp;</td>
                    <td style="width: 257px">
                        <input id="Button2" class="form-control" type="button" value="Start Chatting" /></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="3">&nbsp;</td>
                </tr>
            </table>
        </div>
    </div>
    <div style="background-color: white;">
        <div class="main-container">
            <div class="col-md-10">
                <div id="chatbox">
                    <h3>Chat With Friends</h3>
                    <img id="close_chatbox" src="Bootstrap/delete.png" />
                    <asp:TextBox CssClass="form-control" ID="TextBox1" TextMode="MultiLine" runat="server" Height="162px" ReadOnly="True"></asp:TextBox>

                    <br />

                    <asp:TextBox CssClass="form-control" ID="TextBox2" TextMode="MultiLine" runat="server" Height="47px"></asp:TextBox><input id="Button1" class="btn-primary" type="button" value="Send" />
                </div>
                <asp:HiddenField ID="HiddenField1" runat="server" />
            </div>

        </div>

        <%-- <div class="col-md-6">
            <h3>My Contacts</h3>
            <asp:TextBox CssClass="form-control" ID="TextBox3" TextMode="MultiLine" runat="server" Height="162px" ReadOnly="True"></asp:TextBox></div>--%>
    </div>

</asp:Content>

