<%@ Page Title=" ATTENDENCE DETAILS REPORT" Language="VB" MasterPageFile="~/Home.master" AutoEventWireup="false"
    CodeFile="Rpt_AttendanceDetails.aspx.vb" Inherits="Rpt_AttendanceDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<script type="text/javascript">
        function Validate() {
            var msg = Valid();

            if (msg != true) {
                if (navigator.appName == "Microsoft Internet Explorer") {
                    document.getElementById("<%=msginfo.ClientID%>").innerText = msg;
                    document.getElementById("<%=lblmsg.ClientID%>").innerText = "";
                    return false;
                }
                else if (navigator.appName == "Netscape") {
                document.getElementById("<%=msginfo.ClientID%>").textContent = msg;
                document.getElementById("<%=lblmsg.ClientID%>").textContent = "";
                    return false;
                }
                return true;
            }
        }

        //Function for Multilingual Validations
        //Created by siddharth

        function Valid() {

            var msg, a;

//            msg = DropDownForZeroMul(document.getElementById("<%=ddlBuyer.ClientID %>"));
//            if (msg != "") {
//                document.getElementById("<%=ddlBuyer.ClientID %>").focus();
//                a = document.getElementById("<%=lblBuyer.ClientID %>").innerHTML;
//                msg = Spliter(a) + " " + ErrorMessage(msg);
//                return msg;
//            }
            msg = ValidateDateMul(document.getElementById("<%=txtstartdate.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=txtstartdate.ClientID %>").focus();
                a = document.getElementById("<%=lblstartdate.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }
            msg = ValidateDateMul(document.getElementById("<%=txtenddate.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=txtenddate.ClientID %>").focus();
                a = document.getElementById("<%=lblenddate.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }


            return true;
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
            var n = str.indexOf("*");
            if (n != 0 && n != -1) {
                a = a.split("*");
                return a[0];
            }
            var n = str.indexOf("^");
            if (n != 0 && n != -1) {
                a = a.split("^");
                return a[0];
            }
            var n = str.indexOf(":");
            if (n != 0 && n != -1) {
                a = a.split(":");
                return a[0];
            }
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <center>
                    <h1 class="headingTxt">
                        ATTENDENCE DETAILS REPORT
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
                                <asp:ObjectDataSource ID="ObjBuyer" runat="server" SelectMethod="GetBuyerCombo" TypeName="DLRpt_AttendenceDetails">
                                </asp:ObjectDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="lblstartdate" Width="150px" runat="server" Text="Start Date* :&nbsp;&nbsp;"
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
                        <tr>
                            <td align="right">
                                <asp:Label ID="lblenddate" runat="server" SkinID="lblRsz" Text="End Date* :&nbsp;&nbsp;"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtenddate" runat="server" SkinID="txt" TabIndex="3"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server"
                                    FilterMode="InvalidChars" FilterType="Numbers" InvalidChars="'" TargetControlID="txtenddate"
                                    Enabled="True">
                                </ajaxToolkit:FilteredTextBoxExtender>
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" Animated="False"
                                    Format="dd-MMM-yyyy" TargetControlID="txtenddate" Enabled="True">
                                </ajaxToolkit:CalendarExtender>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="btnTd">
                                <asp:Button ID="btnReport"  runat="server" Text="REPORT" SkinID="btn" OnClientClick="return Validate();"
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
