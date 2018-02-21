<%@ Page Title="Flower Performance" Language="VB" MasterPageFile="~/Home.master" AutoEventWireup="false" CodeFile="Rpt_FlowerPerformance.aspx.vb" Inherits="Rpt_FlowerPerformance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:UpdatePanel ID="Updatepanel1" runat="server">
        <ContentTemplate>
            <center>
                <h1 class="headingTxt">
                    <%--<asp:Label ID="Lblheading" runat="server"></asp:Label>--%>
                    FLOWER PERFORMANCE
                </h1>
            </center>
            <center>
                <table class="custTable">
                    <tr>
                        <td style="width: 70px">
                            &nbsp;
                        </td>
                        <td style="width: 70px">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblFlowerName" runat="server" SkinID="lblRsz" Width="150px" Text="Flower Category :&nbsp;&nbsp"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:DropDownList ID="ddlFlowerId" runat="server" SkinID="ddlRsz" DataSourceID="ObjFlowerName"
                                DataTextField="FlowerCategory" DataValueField="FlowerCategoryId" TabIndex="1" Width="200px">
                            </asp:DropDownList>
                            <asp:ObjectDataSource runat="server" ID="ObjFlowerName" SelectMethod="Proc_GetFlowerCategoryDDLALL"
                                TypeName="DLIfabReportsR"></asp:ObjectDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblFromDate" runat="server" Text="Form Date*:&nbsp;&nbsp" SkinID="lbl"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtFromDate" runat="server" SkinID="txt" TabIndex="2"></asp:TextBox>
                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server"
                                FilterMode="InvalidChars" FilterType="Numbers" InvalidChars="'" TargetControlID="txtFromDate"
                                Enabled="True">
                            </ajaxToolkit:FilteredTextBoxExtender>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" Animated="False"
                                Format="dd-MMM-yyyy" TargetControlID="txtFromDate" Enabled="True">
                            </ajaxToolkit:CalendarExtender>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblToDate" runat="server" Text="To Date*:&nbsp;&nbsp" SkinID="lbl"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtToDate" runat="server" SkinID="txt" TabIndex="2"></asp:TextBox>
                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server"
                                FilterMode="InvalidChars" FilterType="Numbers" InvalidChars="'" TargetControlID="txtToDate"
                                Enabled="True">
                            </ajaxToolkit:FilteredTextBoxExtender>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" Animated="False"
                                Format="dd-MMM-yyyy" TargetControlID="txtToDate" Enabled="True">
                            </ajaxToolkit:CalendarExtender>
                    </tr>
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="btnTd" colspan="4">
                            <asp:Button ID="btnReport" TabIndex="9" runat="server" Text="REPORT" SkinID="btn"
                                CssClass="ButtonClass"></asp:Button>
                            &nbsp;
                            <asp:Button ID="btnBack" TabIndex="11" runat="server" Text="BACK" SkinID="btn" CssClass="ButtonClass">
                            </asp:Button>
                        </td>
                    </tr>
                </table>
            </center>
            <br />
            <center>
             <asp:Label ID="lblErrorMsg" runat="server" SkinID="lblRed"></asp:Label>
            </center>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


