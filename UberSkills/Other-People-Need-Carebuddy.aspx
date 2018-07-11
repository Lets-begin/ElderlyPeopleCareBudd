<%@ Page Title="" Language="C#" MasterPageFile="~/theme.Master" AutoEventWireup="true" CodeBehind="Other-People-Need-Carebuddy.aspx.cs" Inherits="UberSkills.Other_People_Need_Carebuddy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="ReqId" Width="100%">
        <Columns>
            <asp:TemplateField HeaderText="Expr1" SortExpression="Expr1">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Expr1") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <asp:Image ID="Image2" CssClass="img-circle" ImageUrl='<%# string.Format("~/dp/{0}",Eval("dp"))%>' Width="100px" Height="100px" runat="server" />
                            </td>
                            <td>
                                <font size="5em"> <b><asp:Label ID="Label2" runat="server" Text='<%# Bind("title") %>'></asp:Label></b></font>
                            </td>
                        </tr>

                        <tr>
                            <td></td>
                            <td>
                                <font color="grey" size="3.5em"> <b>Description: </b><asp:Label ID="Label3" runat="server" Text='<%# Bind("description") %>'></asp:Label></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td> By<font color="Red" size="3.5em"> <b>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Name") %>'></asp:Label></b>
                                <br /></font>

                                On <b> <font color="red" size="3.5em">
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("date") %>'></asp:Label></b>
                                </font>
                            </td>
                           

                            <td>
                                 Answered By: <font size="3.5em"><b>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Expr1") %>'></asp:Label>
                        People </b></font>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:HyperLinkField DataNavigateUrlFields="reqid" DataNavigateUrlFormatString="~/DetailRequest.aspx?reqid={0}" Text="See More" />

        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:uberdbstring %>" SelectCommand="SELECT COUNT(A.ReqId) AS Expr1, R.ReqId, R.title, R.description, R.date, M.Name, M.dp FROM request AS R INNER JOIN Member AS M ON R.Id = M.Id LEFT OUTER JOIN answer AS A ON R.ReqId = A.ReqId WHERE (R.Id &lt;&gt; @Id) GROUP BY R.ReqId, R.title, R.description, R.date, M.Name, M.dp ORDER BY R.date DESC">
        <SelectParameters>
            <asp:SessionParameter Name="Id" SessionField="userid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
