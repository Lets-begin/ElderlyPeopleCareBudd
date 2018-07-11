<%@ Page Title="" Language="C#" MasterPageFile="~/theme.Master" AutoEventWireup="true" CodeBehind="PreferenceSettings.aspx.cs" Inherits="UberSkills.PreferenceSettings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="table-responsive">
        <table class="table" style="width: 100%;">
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label3" runat="server" Text="Please Select your Peferences, it will help carebuddy to find more accurate persons"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="height: 20px"></td>
                <td style="height: 20px">&nbsp;</td>
            </tr>
            <tr>
                <td style="height: 20px">
                    <asp:Label ID="Label4" runat="server" CssClass="queries" Text="Gender Preference:"></asp:Label>
                    <br />
                    <asp:Label ID="Label8" runat="server" CssClass="description" Text="To whom You want to talk, boy or girl?"></asp:Label>
                </td>
                <td style="height: 20px">
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" CssClass="queries" Text="Age Preference:"></asp:Label>
                    <br />
                    <asp:Label ID="Label9" runat="server" CssClass="description" Text="Please set preference for your carebbuddy's age!"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList2" runat="server">
                        <asp:ListItem>Sparking Youth</asp:ListItem>
                        <asp:ListItem>Person in his 30's</asp:ListItem>
                        <asp:ListItem>Middle age</asp:ListItem>
                        <asp:ListItem>Experienced old</asp:ListItem>

                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label6" runat="server" CssClass="queries" Text="Language Preference:"></asp:Label>
                    <br />
                    <asp:Label ID="Label10" runat="server" CssClass="description" Text="with which languages You are familiar?"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList3" runat="server">
                        <asp:ListItem>English</asp:ListItem>
                        <asp:ListItem>Hindi</asp:ListItem>
                        <asp:ListItem>French</asp:ListItem>
                        <asp:ListItem>Germany</asp:ListItem>
                        <asp:ListItem>Punjabi</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label7" runat="server" CssClass="queries" Text="Location Preference:"></asp:Label>
                    <br />
                    <asp:Label ID="Label11" runat="server" CssClass="description" Text="Peoples from same culture share more emotional bonding!!"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList4" runat="server">
                        <asp:ListItem>India</asp:ListItem>
                        <asp:ListItem>North-India</asp:ListItem>
                        <asp:ListItem>South-India</asp:ListItem>
                        <asp:ListItem>West-India</asp:ListItem>
                        <asp:ListItem>East-India</asp:ListItem>
                        <asp:ListItem>Center-India</asp:ListItem>
                        <asp:ListItem>Asia</asp:ListItem>
                        <asp:ListItem>Europe</asp:ListItem>
                        <asp:ListItem>America</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="height: 14px">
                    <asp:Label ID="error_label" runat="server" CssClass="disabled"></asp:Label>
                </td>
                <td style="height: 14px"></td>
            </tr>
            <tr>
                <td style="height: 14px">
                    <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
                </td>
                <td style="height: 14px">&nbsp;</td>
            </tr>
        </table>
    </div>
</asp:Content>
