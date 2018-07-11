<%@ Page Title="" Language="C#" MasterPageFile="~/theme.Master" AutoEventWireup="true" CodeBehind="DetailRequest.aspx.cs" Inherits="UberSkills.DetailRequest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="reqid" DataSourceID="SqlDataSource1" Width="100%">
        <Fields>
            <asp:TemplateField SortExpression="title">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("title") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("title") %>'></asp:TextBox>
                </InsertItemTemplate>
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

                                
                            </td>
                           

                            <td>
                                 On <b> <font color="red" size="3.5em">
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("date") %>'></asp:Label></b>
                                </font>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
         
            </asp:TemplateField>
         
            
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:uberdbstring %>" SelectCommand="SELECT request.Id, request.reqid, request.title, request.description, request.date, Member.Name, Member.dp FROM request INNER JOIN Member ON request.Id = Member.Id WHERE (request.reqid = @reqid)">
        <SelectParameters>
            <asp:QueryStringParameter Name="reqid" QueryStringField="reqid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    
    <br />
    <asp:Label ID="Label5" runat="server" Text="Comments:"></asp:Label>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" Width="100%">
        <Columns>
            
            <asp:TemplateField SortExpression="description">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("description") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <asp:Image ID="Image2" CssClass="img-circle" ImageUrl='<%# string.Format("~/dp/{0}",Eval("dp"))%>' Width="100px" Height="100px" runat="server" />
                            </td>
                            <td>
                                <font color="grey" size="3.5em"> <b>Description: </b><asp:Label ID="Label3" runat="server" Text='<%# Bind("description") %>'></asp:Label></td>
                        </tr>

                   
                        <tr>
                            <td></td>
                            <td> By<font color="Red" size="3.5em"> <b>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Name") %>'></asp:Label></b>
                                <br /></font>

                               
                            </td>
                          <td> On <b> <font color="red" size="3.5em">
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("date") %>'></asp:Label></b>
                                </font></td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:uberdbstring %>" SelectCommand="SELECT answer.Id, answer.reqid, answer.description, answer.date, Member.Name, Member.dp FROM answer INNER JOIN Member ON answer.Id = Member.Id WHERE (answer.reqid = @reqid) ORDER BY answer.date DESC">
        <SelectParameters>
            <asp:QueryStringParameter Name="reqid" QueryStringField="reqid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <table >
        <tr>
            <td>
               <font size="4em"><b> <asp:Label ID="Label6" runat="server" Text="Add Your Comment"></asp:Label></b></font>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:TextBox class="form-control" ID="TextBox1" TextMode="MultiLine" runat="server" Width="100%"  Height="71px"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="TextBox1" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage="Don't use special chars(max 200 chars)" ForeColor="Red" ValidationExpression="[a-zA-Z0-9 !?&quot;,:;@-_]{1,200}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="error_label" runat="server"></asp:Label>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table> 
    <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Comment" OnClick="Button1_Click" />
    <br />

</asp:Content>
