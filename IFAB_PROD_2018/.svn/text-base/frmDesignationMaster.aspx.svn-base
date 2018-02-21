<%@ Page Language="VB" MasterPageFile="~/Home.master" AutoEventWireup="false" CodeFile="frmDesignationMaster.aspx.vb"
    Inherits="frmDepreciation_Rates" Title="Designation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript" language="javascript">
        //Function for Multilingual Validations
        //Created By Niraj
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
        function Valid() {
            var msg;
            msg = NameField100Mul(document.getElementById("<%=txtName.ClientID%>"));
            if (msg != "") {
                document.getElementById("<%=txtName.ClientID%>").focus();
                a = document.getElementById("<%=lblName.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }

            return true;
        }
        function Validate() {

            var msg = Valid();
            if (msg != true) {
                if (navigator.appName == "Microsoft Internet Explorer") {
                    document.getElementById("<%=lblmsg.ClientID%>").innerText = msg;
                    document.getElementById("<%=msginfo.ClientID%>").innerText = "";
                    return false;
                }
                else if (navigator.appName == "Netscape") {
                    document.getElementById("<%=lblmsg.ClientID%>").textContent = msg;
                    document.getElementById("<%=msginfo.ClientID%>").innerText = "";
                    return false;
                }
            }
            return true;
        }
    </script>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <a name="Top">
                <div align="right">
                    <a href="#Bottom">
                        <asp:Image ID="Image1" runat="server" ImageUrl="Images/down.png" Width="30px" Height="30px" /></a>
                </div>
                <div>
                    <center>
                        <h1 class="headingTxt">
                            <asp:Label ID="Lblheading" runat="server"></asp:Label>
                        </h1>
                    </center>
                    <br />
                    <center>
                        <table class="custTable">
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lblName" runat="server" Text="Name*&nbsp;:&nbsp;&nbsp;" SkinID="lbl"
                                        Style="text-align: right;"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtName" runat="server" SkinID="txt" TabIndex="1"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="btnTd" colspan="2">
                                    <asp:Button ID="BtnAdd" runat="server" Text="ADD" CausesValidation="True" TabIndex="2" CommandName="ADD"
                                        SkinID="btn" OnClientClick="return Validate();" CssClass="ButtonClass"></asp:Button>
                                    <asp:Button ID="BtnDetails" TabIndex="3" runat="server" Text="VIEW" CausesValidation="False" CommandName="VIEW"
                                        SkinID="btn" CssClass="ButtonClass"></asp:Button>
                                </td>
                            </tr>
                        </table>
                    </center>
                    <br />
                    <center>
                        <asp:Label ID="lblmsg" runat="server" SkinID="lblRed" Visible="true"></asp:Label>
                        <asp:Label ID="msginfo" runat="server" SkinID="lblGreen" Visible="true"></asp:Label>
                    </center>
                    <br />
                    <center>
                        <asp:Panel ID="panel1" runat="server" ScrollBars="Auto" Width="200px" Height="300px">
                            <asp:GridView ID="GridView1" runat="server" AllowPaging="true" SkinID="GridView"
                                AutoGenerateColumns="False" DataKeyNames="Designation" PageSize="100" AllowSorting="True" EnableSortingAndPagingCallbacks="True">
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                                                Text="Edit" Font-Underline="False"></asp:LinkButton>
                                            <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete"
                                                OnClientClick="return confirm('Do you want to delete the selected record?')"
                                                Text="Delete" Visible="false" Font-Underline="False"></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                        <HeaderStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("Designation_ID") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Designation Name" SortExpression="Designation">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Designation") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </asp:Panel>
                    </center>
                </div>
                . <a name="Bottom">
                    <div align="right">
                        <a href="#Top">
                            <asp:Image ID="Image2" runat="server" ImageUrl="Images/top.png" Width="30px" Height="30px" /></a>
                        <asp:LinkButton ID="LinkButton1" runat="server"></asp:LinkButton>
                    </div>
                </a>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
