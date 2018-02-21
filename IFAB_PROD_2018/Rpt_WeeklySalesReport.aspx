<%@ Page Title="WEEKLY SALES REPORT" Language="VB" MasterPageFile="~/Home.master"
    AutoEventWireup="false" CodeFile="Rpt_WeeklySalesReport.aspx.vb" Inherits="Rpt_WeeklySalesReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="Updatepanel1" runat="server">
        <ContentTemplate>
            <center>
                <h1 class="headingTxt">
                    <%--<asp:Label ID="Lblheading" runat="server"></asp:Label>--%>
                    WEEKLY SALES REPORT
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
                        <td align="left" colspan="2">
                            <asp:DropDownList ID="ddlGrowerid" runat="server" SkinID="ddlRsz" DataSourceID="ObjGrowerName"
                                DataTextField="Supp_Name" DataValueField="Supp_Id_Auto" TabIndex="1" Width="240px">
                            </asp:DropDownList>
                            <asp:ObjectDataSource runat="server" ID="ObjGrowerName" SelectMethod="Proc_GetGrowerNameDDLALL"
                                TypeName="DLIfabReportsR"></asp:ObjectDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblWeek" runat="server" SkinID="lbl" Text="Week :&nbsp;&nbsp"></asp:Label>
                        </td>
                        <td colspan="2">
                            <asp:DropDownList ID="ddlWeek" runat="server" SkinID="ddlRsz" TabIndex="1" Width="80px">
                                <asp:ListItem Value="Week1">Week 1</asp:ListItem>
                                <asp:ListItem Value="Week2">Week 2</asp:ListItem>
                                <asp:ListItem Value="Week3">Week 3</asp:ListItem>
                                <asp:ListItem Value="Week4">Week 4</asp:ListItem>
                            </asp:DropDownList>
                     
                            <asp:DropDownList ID="ddlMonth" runat="server" SkinID="ddlRsz" TabIndex="1" Width="90px">
                                <asp:ListItem Value="01">January</asp:ListItem>
                                <asp:ListItem Value="02">February</asp:ListItem>
                                <asp:ListItem Value="03">March</asp:ListItem>
                                <asp:ListItem Value="04">April</asp:ListItem>
                                <asp:ListItem Value="05">May</asp:ListItem>
                                <asp:ListItem Value="06">June</asp:ListItem>
                                <asp:ListItem Value="07">July</asp:ListItem>
                                <asp:ListItem Value="08">August</asp:ListItem>
                                <asp:ListItem Value="09">September</asp:ListItem>
                                <asp:ListItem Value="10">October</asp:ListItem>
                                <asp:ListItem Value="11">November</asp:ListItem>
                                <asp:ListItem Value="12">December</asp:ListItem>
                            </asp:DropDownList>
                        
                            <asp:DropDownList ID="ddlYear" runat="server" SkinID="ddlRsz" DataSourceID="ObjYear"
                                DataTextField="Year" TabIndex="1" Width="60px">
                            </asp:DropDownList>
                            <asp:ObjectDataSource runat="server" ID="ObjYear" SelectMethod="Proc_GetYear" TypeName="DLIfabReportsR">
                            </asp:ObjectDataSource>
                        </td>
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
