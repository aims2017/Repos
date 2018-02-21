<%@ Page Language="VB" MasterPageFile="~/Home.master" AutoEventWireup="false" CodeFile="Rpt_EmailSMSCount.aspx.vb" Inherits="Rpt_EmailSMSCount" 
Title="EMAIL/SMS Count" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div>
                    <center>
                        <h1 class="headingTxt">
                            EMAIL/SMS Count
                        </h1>
                    </center>
                    <br />
                    <center>
                        <table>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lblInstitute" runat="server" Text="Institute&nbsp;:&nbsp;&nbsp;"
                                        SkinID="lbl" Width="100px"></asp:Label>
                                </td>
                                <td align="left">
                                    <asp:DropDownList ID="ddlInstitute" TabIndex="1" runat="server" SkinID="ddlL" AutoPostBack="True"
                                        DataSourceID="ObjInstitute" DataTextField="BranchName" DataValueField="BranchCode">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lblFromdate" runat="server" SkinID="lbl" Text="From Date* :&nbsp;&nbsp;"></asp:Label>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtFromDateExt" runat="server" SkinID="txt" TabIndex="6"></asp:TextBox>
                                </td>
                            </tr>
                            <ajaxToolkit:CalendarExtender ID="FromDateExt" runat="server" TargetControlID="txtFromDateExt"
                                Format="dd-MMM-yyyy">
                            </ajaxToolkit:CalendarExtender>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lblToDate" runat="server" SkinID="lbl" Text="To Date* :&nbsp;&nbsp;"></asp:Label>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtToDateExt" runat="server" SkinID="txt" TabIndex="6"></asp:TextBox>
                                </td>
                            </tr>
                            <ajaxToolkit:CalendarExtender ID="ToDateExt" runat="server" TargetControlID="txtToDateExt"
                                Format="dd-MMM-yyyy">
                            </ajaxToolkit:CalendarExtender>
                            <tr>
                                <td>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td class="btnTd" colspan="4">
                                    <asp:Button ID="btnReport" TabIndex="9" runat="server" Text="REPORT" SkinID="btn"
                                        CssClass="ButtonClass" OnClientClick="return Validate();"></asp:Button>
                                    &nbsp;
                                    <asp:Button ID="btnBack" TabIndex="11" runat="server" Text="BACK" SkinID="btn" CssClass="ButtonClass">
                                    </asp:Button>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <br />
                                </td>
                            </tr>
                        </table>
                        <asp:Label ID="lblErrorMsg" runat="server" SkinID="lblRed"></asp:Label>
                    </center>
                    <asp:ObjectDataSource ID="ObjInstitute" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetInstituteDDL" TypeName ="DLInstitute"></asp:ObjectDataSource>
            </ContentTemplate>
        </asp:UpdatePanel>
    </center>
</asp:Content>