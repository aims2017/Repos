<%@ Page Language="VB" MasterPageFile="~/Home.master" AutoEventWireup="false" CodeFile="frmhierarchytree.aspx.vb"
    Inherits="frmhierarchytree" Title="Select Branch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel runat="server" ID="UP1">
        <ContentTemplate>
            <div>
                <div align="right">
                </div>
                <%--   <center>
                    <h1 class="headingTxt">
                        SELECT BRANCH</h1>
                </center>--%>
                <center>
                    <h1 class="headingTxt">
                        <asp:Label ID="Lblheading" runat="server"></asp:Label>
                    </h1>
                </center>
                <center>
                    <table class="custTable">
                        <tbody>
                            <tr>
                                <td style="height: 6px" align="center" colspan="2">
                                    <asp:Label ID="lblParentBranch" runat="server" SkinID="lblRsz" Text="You are Here"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="height: 6px">
                                    <asp:LinkButton ID="GotoParent" runat="server" SkinID="lb">Go to Native Branch</asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 6px">
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lblOffice" runat="server" Text="Office :&nbsp;&nbsp;" SkinID="lblRSZ"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddloffice" runat="server" SkinID="ddl" AutoPostBack="True"
                                        TabIndex="1">
                                        <asp:ListItem Value="1">Individual</asp:ListItem>
                                        <asp:ListItem Value="2">All</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lblHO" runat="server" SkinID="lblRSZ" Text="HO :&nbsp;&nbsp;"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlHO" runat="server" AutoPostBack="true" DataSourceID="ObjHO"
                                        DataTextField="BranchName" DataValueField="BranchCode" SkinID="ddlRsz" Width="250"
                                        TabIndex="2">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="ObjHO" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetHO" TypeName="BLslssbhierarchytreeview"></asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lblBranchName" runat="server" SkinID="lblRsz" Width="150px" Text="Branch Name :&nbsp;&nbsp;"></asp:Label>
                                </td>
                                <td>
                                    <asp:ListBox ID="ListBox1" Height="200px" Width="400px" SelectionMode="Single" runat="server"
                                        TabIndex="3" DataSourceID="ObjBranchName" DataTextField="BranchName" DataValueField="BranchCode">
                                    </asp:ListBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="height: 6px">
                                    <asp:ObjectDataSource ID="ObjBranchName" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="FillListView" TypeName="BLslssbhierarchytreeview">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlHO" DbType="String" Name="HO" PropertyName="SelectedValue" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="height: 6px">
                                    <asp:Button ID="btnsubmit" runat="server" Text="SUBMIT" SkinID="btn" CssClass="ButtonClass "
                                        TabIndex="4" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    &nbsp;<asp:Label ID="lblmsg" runat="server" BackColor="Red" ForeColor="White"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    &nbsp;
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </center>
            </div>
            <center>
                <table>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </center>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
