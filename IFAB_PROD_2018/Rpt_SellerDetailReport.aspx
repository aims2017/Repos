<%@ Page Title="GROWER DETAILS REPORT" Language="VB" MasterPageFile="~/Home.master" AutoEventWireup="false" CodeFile="Rpt_SellerDetailReport.aspx.vb" Inherits="Rpt_SellerDetailReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <center>
                    <h1 class="headingTxt">
                       GROWER DETAILS REPORT
                        <br />
                        <br />
                    </h1>
                </center>
                <center>
                    <table>
                        <tr>
                            <td align="right">
                                <asp:Label ID="lblGrowerName" runat="server" SkinID="lblRsz" Width="130px" Text="Grower Name :"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="ddlGrowerid" runat="server" SkinID="ddlRsz" DataSourceID="ObjGrowerName"
                                    DataTextField="Supp_Name" DataValueField="Supp_Id_Auto" TabIndex="1" Width="250px">
                                </asp:DropDownList>
                                <asp:ObjectDataSource runat="server" ID="ObjGrowerName" SelectMethod="GetDDlGrowerName"
                                    TypeName="DLRpt_SellerDetailReport"></asp:ObjectDataSource>
                            </td>
                        </tr>
                      
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



