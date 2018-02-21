<%@ Page Title="BUYER DETAILS REPORT" Language="VB" MasterPageFile="~/Home.master" AutoEventWireup="false" CodeFile="Rpt_BuyerDetails.aspx.vb" Inherits="Rpt_BuyerDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <center>
                    <h1 class="headingTxt">
                       BUYER DETAILS REPORT
                        <br />
                        <br />
                    </h1>
                </center>
                <center>
                    <table>
                        <tr>
                            <td align="right">
                                <asp:Label ID="lblBuyer" runat="server" SkinID="lbl" Text="Buyer :&nbsp;&nbsp;"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="ddlBuyer" runat="server" Width="250px" DataSourceID="ObjBuyer"
                                    DataTextField="Company_Name" SkinID="Rsz" AutoPostBack="true" DataValueField="BuyerID"
                                    TabIndex="1">
                                </asp:DropDownList>
                                <asp:ObjectDataSource ID="ObjBuyer" runat="server" SelectMethod="GetBuyerCombo" TypeName="DLRpt_BuyerDetails">
                                </asp:ObjectDataSource>
                            </td>
                        </tr>
                        <%-- <tr>
                            <td align="right">
                                <asp:Label ID="lblstartdate" Width="150px" runat="server" Text="Date* :&nbsp;&nbsp;"
                                    SkinID="lblRsz"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtstartdate" runat="server" SkinID="txt" TabIndex="2"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender15" runat="server"
                                    FilterMode="InvalidChars" FilterType="Numbers" InvalidChars="'" TargetControlID="txtstartdate"
                                    Enabled="True">
                                </ajaxToolkit:FilteredTextBoxExtender>
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" Animated="False"
                                    Format="dd-MMM-yyyy" TargetControlID="txtstartdate" Enabled="True">
                                </ajaxToolkit:CalendarExtender>
                            </td>
                        </tr>
        --%>               
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="btnTd">
                                <asp:Button ID="btnReport"  runat="server" Text="REPORT" SkinID="btn"  
                                 TabIndex="4"   CssClass="ButtonClass"></asp:Button>
                                <asp:Button ID="btnBack" TabIndex="5" runat="server" Text="BACK" SkinID="btn" CssClass="ButtonClass">
                                </asp:Button>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <asp:Label ID="msginfo" runat="server" SkinID="lblRed" Visible="true"></asp:Label>
                    <asp:Label ID="lblmsg" runat="server" SkinID="lblGreen" Visible="true"></asp:Label>
                </center>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


