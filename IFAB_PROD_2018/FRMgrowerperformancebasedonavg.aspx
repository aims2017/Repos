<%@ Page Language="VB" MasterPageFile="~/Home.master" AutoEventWireup="false" CodeFile="FRMgrowerperformancebasedonavg.aspx.vb"
    Inherits="FRM_growerperformancebasedon_avg" Title="Grower Performance Report Based On Avg price" %>
 
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript" language="javascript">
        function Valid() {
            var msg;
            msg = ValidateDateMul(document.getElementById("<%=txtfromdate.ClientID%>"));
            if (msg != "") {
                document.getElementById("<%=txtfromdate.ClientID%>").focus();
                a = document.getElementById("<%=Label1.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }
            msg = ValidateDateMul(document.getElementById("<%=txttodate.ClientID%>"));
            if (msg != "") {
                document.getElementById("<%=txttodate.ClientID%>").focus();
                a = document.getElementById("<%=Label2.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }

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
            <div>
                <center>
                    <table>
                        <tr>
                            <td align="center">
                                <h1 class="headingTxt">
                                    <asp:Label ID="LabelEm" runat="server" Text="GROWER PERFORMANCE BASED ON AVG PRICE REPORT" SkinID="lblRepRsz"
                                        Width="350" Visible="True"></asp:Label>
                                </h1>
                            </td>
                        </tr>
                    </table>
                </center>
                <table>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
                <center>
                    <table class="custTable">
                        <tr>
                            <td align="right">
                                <asp:Label ID="Label3" runat="server"  Text="Grower Name :" SkinID="lbl"></asp:Label>
                            </td>
                            <td align="left">
                                &nbsp<asp:DropDownList ID="ddlGrowerName" TabIndex="1" MaxLength="60" runat="server" SkinID="ddl"
                                    DataSourceID="ObjGrowerName" DataTextField="Supp_Name" DataValueField="Supp_Id_Auto">
                                </asp:DropDownList>
                                <asp:ObjectDataSource ID="ObjGrowerName" runat="server" SelectMethod="GetGrowerCompanyCobmo"
                                    TypeName="Mfg_BLBuyerDetails"></asp:ObjectDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="Label1" runat="server" Width="100px" Text="From Date* :" SkinID="lblRsz"></asp:Label>
                            </td>
                            <td align="left">
                                &nbsp<asp:TextBox ID="txtfromdate" runat="server" SkinID="txt" TabIndex="2"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="Label2" runat="server" Text="To Date* :" SkinID="lblRsz"></asp:Label>
                            </td>
                            <td align="left">
                                &nbsp<asp:TextBox ID="txttodate" runat="server" SkinID="txt" TabIndex="3"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="btnTd">
                                <asp:Button ID="btnReport" TabIndex="3" runat="server" Text="REPORT" SkinID="btn"
                                    CommandName="REPORT" CssClass="ButtonClass" OnClientClick="return Validate();">
                                </asp:Button>
                                <asp:Button ID="btnBack" TabIndex="4" runat="server" Text="BACK" SkinID="btn" CommandName="BACK"
                                    CssClass="ButtonClass"></asp:Button>
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
                <ajaxToolkit:CalendarExtender ID="CalendarExtender5" runat="server" TargetControlID="txtfromdate"
                    Format="dd-MMM-yyyy" SkinID="Calendar">
                </ajaxToolkit:CalendarExtender>
                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txttodate"
                    Format="dd-MMM-yyyy" SkinID="Calendar">
                </ajaxToolkit:CalendarExtender>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

