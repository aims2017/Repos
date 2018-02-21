<%@ Page Language="VB" MasterPageFile="~/Home.master" AutoEventWireup="false" CodeFile="Ifab_RptGrowerWiseWeekly.aspx.vb"
    Inherits="Ifab_RptGrowerWiseWeekly" Title="Grower Wise Weekly Sales" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript" language="javascript">
        function Valid() {
            var msg;


            return true;
        }
        function Validate() {
            var msg = Valid();

            if (msg != true) {
                if (navigator.appName == "Microsoft Internet Explorer") {
                    document.getElementById("<%=msginfo.ClientID%>").innerText = msg;
                    return false;
                }
                else if (navigator.appName == "Netscape") {
                    document.getElementById("<%=msginfo.ClientID%>").textContent = msg;
                    return false;
                }
                return true;
            }
        }
        function ErrorMessage(msg) {
            var SesVar = '<%= Session("Validation") %>';
            var ValidationArray = new Array();
            ValidationArray = SesVar.split(":");
            for (var i = 0; i < ValidationArray.length - 1; i++) {
                if (ValidationArray[i] == msg) {
                    return ValidationArray[i + 1];
                }
            }
        }


        function Spliter(a) {
            var str = a;
            var n;
            n = str.indexOf("*");
            if (n != 0 && n != -1) {
                a = a.split("*");
                return a[0];
            }
            n = str.indexOf("^");
            if (n != 0 && n != -1) {
                a = a.split("^");
                return a[0];
            }
            n = str.indexOf(":");
            if (n != 0 && n != -1) {
                a = a.split(":");
                return a[0];
            }
        }
    </script>

    <asp:UpdatePanel ID="Updatepanel1" runat="server">
        <ContentTemplate>
                    <center>
                        <h1 class="headingTxt">
                         <asp:Label ID="lblHead" runat="server" Text=" GROWER WISE WEEKLY SALES REPORT " Width="400px"></asp:Label>
                         </h1>
                    </center>
                    <center>
                    <table class="custTable">
                        <tr>
                            <td align="right">
                                <asp:Label ID="lblWeek" runat="server" SkinID="lbl" Text="Week :&nbsp;&nbsp"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlWeek" runat="server" SkinID="ddlRsz" TabIndex="1" Width="80px">
                                    <asp:ListItem Value="Week1">Week 1</asp:ListItem>
                                    <asp:ListItem Value="Week2">Week 2</asp:ListItem>
                                    <asp:ListItem Value="Week3">Week 3</asp:ListItem>
                                    <asp:ListItem Value="Week4">Week 4</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
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
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlYear" runat="server" SkinID="ddlRsz" DataSourceID="ObjYear"
                                    DataTextField="Year" TabIndex="1" Width="60px">
                                </asp:DropDownList>
                                <asp:ObjectDataSource runat="server" ID="ObjYear" SelectMethod="Proc_GetYear" TypeName="DLIfabReportsR">
                                </asp:ObjectDataSource>
                            </td>
                        </tr>
                        <%--  <tr>
                            <td align="right">
                                <asp:Label ID="Label1" runat="server" Width="100px" Text="From Date* :" SkinID="lblRsz"></asp:Label>
                            </td>
                            <td align="left">
                                &nbsp<asp:TextBox ID="txtfromdate" runat="server" SkinID="txt" TabIndex="1"></asp:TextBox>
                            </td>
                        </tr>--%>
                        <%-- <tr>
                            <td align="right">
                                <asp:Label ID="Label2" runat="server" Text="To Date* :" SkinID="lblRsz"></asp:Label>
                            </td>
                            <td align="left">
                                &nbsp<asp:TextBox ID="txttodate" runat="server" SkinID="txt" TabIndex="3"></asp:TextBox>
                            </td>
                        </tr>--%>
                        <tr>
                            <td colspan="4">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <asp:Button ID="btnReport" TabIndex="3" runat="server" Text="REPORT" SkinID="btn"
                                    CommandName="REPORT" CssClass="ButtonClass" OnClientClick="return Validate();">
                                </asp:Button>
                            </td>
                            <td>
                                <asp:Button ID="btnBack" TabIndex="4" runat="server" Text="BACK" SkinID="btn" CommandName="BACK"
                                    CssClass="ButtonClass"></asp:Button>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <center>
                                    <div>
                                        <asp:Label ID="msginfo" runat="server" SkinID="lblRed"></asp:Label>
                                    </div>
                                </center>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </center>
                <%--<ajaxToolkit:CalendarExtender ID="CalendarExtender5" runat="server" TargetControlID="txtfromdate"
                    Format="dd-MMM-yyyy" SkinID="Calendar">
                </ajaxToolkit:CalendarExtender>
                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txttodate"
                    Format="dd-MMM-yyyy" SkinID="Calendar">
                </ajaxToolkit:CalendarExtender>--%>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
