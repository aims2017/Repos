<%@ Page Language="VB" MasterPageFile="~/Home.master" AutoEventWireup="false" CodeFile="Report.aspx.vb"
    Inherits="Report" Title="Reports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <center>
                <h1 class="headingTxt">
                    REPORTS
                </h1>
            </center>
            <%-- <center>
                <h1 class="headingTxt">
                    <asp:Label ID="Lblheading" runat="server"></asp:Label>
                </h1>
            </center>--%>
            <center>
                <table>
                    <tr>
                        <td>
                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/download.jpg"
                                TabIndex="1" AutoPostBack="true" Width="25px"/>
                        </td>
                        <td>
                            <asp:TextBox ID="txtSearchKey" runat="server" SkinID="txt" TabIndex="2" AutoPostBack="true"></asp:TextBox>
                            <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender" runat="server"
                                SkinID="watermark" TargetControlID="txtSearchKey" WatermarkText="Search">
                            </ajaxToolkit:TextBoxWatermarkExtender>
                        </td>
                    </tr>
                </table>
                <asp:Panel ID="panel2" runat="server" ScrollBars="Auto" Width="650px" Height="600px">
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="Label" runat="server" SkinID="lblred"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                            <td>
                                &nbsp;
                                <asp:GridView ID="GrdReport" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                    PageSize="1000" SkinID="GridView" Width="368px">
                                    <Columns>
                                        <asp:TemplateField Visible="false">
                                            <ItemTemplate>
                                                <asp:HiddenField ID="HFRid" runat="server" Value='<%# Bind("RID") %>'></asp:HiddenField>
                                                <asp:HiddenField ID="HFParentId" runat="server" Value='<%# Bind("ParentID") %>'>
                                                </asp:HiddenField>
                                                <asp:HiddenField ID="HFChildId" runat="server" Value='<%# Bind("ChildID") %>'></asp:HiddenField>
                                                <asp:HiddenField ID="HFLinkName" runat="server" Value='<%# Bind("LinkName") %>'>
                                                </asp:HiddenField>
                                                <asp:HiddenField ID="HFQryStr" runat="server" Value='<%# Bind("qrystring") %>'></asp:HiddenField>
                                                <asp:HiddenField ID="HFHeading" runat="server" Value='<%# Bind("heading") %>'></asp:HiddenField>
                                                <asp:HiddenField ID="HFDirectLink" runat="server" Value='<%# Bind("DirectLink") %>'>
                                                </asp:HiddenField>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Module Name" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                                            <ItemTemplate>
                                                <asp:Label ID="lblParentName" runat="server" Text='<%# Bind("ParentName") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Wrap="false" />
                                        </asp:TemplateField>
                                        <asp:TemplateField ShowHeader="true" HeaderText="Report Name" ItemStyle-HorizontalAlign="Left"
                                            HeaderStyle-HorizontalAlign="Left">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" runat="server" Font-Underline="true" CommandName="Edit"
                                                    Text='<%# Bind("ChildName") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </center>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
