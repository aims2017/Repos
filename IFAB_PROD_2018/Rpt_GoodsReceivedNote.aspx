<%@ Page Title="Goods Received Note" Language="VB" AutoEventWireup="false" MasterPageFile="~/Home.master"
    CodeFile="Rpt_GoodsReceivedNote.aspx.vb" Inherits="Rpt_GoodsReceivedNote" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="Updatepanel1" runat="server">
        <ContentTemplate>
            <center>
                <h1 class="headingTxt">
                    <%--<asp:Label ID="Lblheading" runat="server"></asp:Label>--%>
                    GOODS RECEIVED NOTE
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
                            <asp:Label ID="lblGrowerName" runat="server" SkinID="lbl" Text="Grower Name :&nbsp;&nbsp"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:DropDownList ID="ddlGrowerid" runat="server" SkinID="ddlRsz" DataSourceID="ObjGrowerName"
                                DataTextField="Supp_Name" DataValueField="Supp_Id_Auto" TabIndex="1" Width="250px">
                            </asp:DropDownList>
                            <asp:ObjectDataSource runat="server" ID="ObjGrowerName" SelectMethod="Proc_GetGrowerNameDDLALL"
                                TypeName="DLIfabReportsR"></asp:ObjectDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblDate" runat="server" Text="Date*:&nbsp;&nbsp" SkinID="lbl"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtDate" runat="server" SkinID="txt" TabIndex="2"></asp:TextBox>
                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender15" runat="server"
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
