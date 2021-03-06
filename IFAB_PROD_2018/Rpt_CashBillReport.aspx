﻿<%@ Page Title="Cash Bill" Language="VB" MasterPageFile="~/Home.master" AutoEventWireup="false" CodeFile="Rpt_CashBillReport.aspx.vb" Inherits="Rpt_CashBillReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:UpdatePanel ID="Updatepanel1" runat="server">
        <ContentTemplate>
            <center>
                <h1 class="headingTxt">
                    <%--<asp:Label ID="Lblheading" runat="server"></asp:Label>--%>
                    CASH BILL 
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
                            <asp:Label ID="lblBuyer" runat="server" SkinID="lbl" Text="Buyer :&nbsp;&nbsp"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:DropDownList ID="ddlBuyerId" runat="server" SkinID="ddlRsz" DataSourceID="ObjBuyer"
                                DataTextField="BuyerName" DataValueField="BuyerId" TabIndex="1" Width="250px">
                                <asp:ListItem Value="0" Text="ALL"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:ObjectDataSource runat="server" ID="ObjBuyer" SelectMethod="Proc_GetBuyerDDLALL"
                                TypeName="DLIfabReportsR"></asp:ObjectDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblDate" runat="server" Text="Date*:&nbsp;&nbsp" SkinID="lbl"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtDate" runat="server" SkinID="txt" TabIndex="2"></asp:TextBox>
                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server"
                                FilterMode="InvalidChars" FilterType="Numbers" InvalidChars="'" TargetControlID="txtDate"
                                Enabled="True">
                            </ajaxToolkit:FilteredTextBoxExtender>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" Animated="False"
                                Format="dd-MMM-yyyy" TargetControlID="txtDate" Enabled="True">
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

