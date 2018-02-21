<%@ Page Title="HANDLING CHARGES" Language="VB" MasterPageFile="~/Home.master" AutoEventWireup="false"
    CodeFile="HandlingCharges.aspx.vb" Inherits="HandlingCharges" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

   
    <script type="text/javascript">
        function Validate() {
            var msg = Valid();

            if (msg != true) {
                if (navigator.appName == "Microsoft Internet Explorer") {
                    document.getElementById("<%=lblerrmsg.ClientID%>").innerText = msg;
                    document.getElementById("<%=lblmsgifo.ClientID%>").innerText = "";
                    return false;
                }
                else if (navigator.appName == "Netscape") {
                    document.getElementById("<%=lblerrmsg.ClientID%>").textContent = msg;
                    document.getElementById("<%=lblmsgifo.ClientID%>").textContent = "";
                    return false;
                }
                return true;
            }
        }

        //Function for Multilingual Validations
        //Created by siddharth

        function Valid() {

            var msg, a;

          
            msg = ValidateDateMul(document.getElementById("<%=txtDate.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=txtDate.ClientID %>").focus();
                a = document.getElementById("<%=lblDate.ClientID %>").innerHTML;
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


    <asp:UpdatePanel ID="Updatepanel1" runat="server">
        <ContentTemplate>
          <a name="Top">
                <div align="right">
                    <a href="#Bottom">
                        <asp:Image ID="Image1" runat="server" ImageUrl="Images/down.png" Width="30px" Height="30px" /></a>
                </div>
            <center>
                <h1 class="headingTxt">
                    HANDLING CHARGES
                </h1>
            </center>
            &nbsp;
            <center>
                <table>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblDate" runat="server" Text="From Date* :&nbsp;&nbsp" SkinID="lbl"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtDate" runat="server" SkinID="txt" TabIndex="1"></asp:TextBox>
                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender15" runat="server"
                                FilterMode="InvalidChars" FilterType="Numbers" InvalidChars="'" TargetControlID="txtDate"
                                Enabled="True">
                            </ajaxToolkit:FilteredTextBoxExtender>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" Animated="False"
                                Format="dd-MMM-yyyy" TargetControlID="txtDate" Enabled="True">
                            </ajaxToolkit:CalendarExtender>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblenddate" runat="server" SkinID="lblRsz" Text="To Date* :&nbsp;&nbsp;"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtenddate" runat="server" SkinID="txt" TabIndex="2"></asp:TextBox>
                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server"
                                FilterMode="InvalidChars" FilterType="Numbers" InvalidChars="'" TargetControlID="txtenddate"
                                Enabled="True">
                            </ajaxToolkit:FilteredTextBoxExtender>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" Animated="False"
                                Format="dd-MMM-yyyy" TargetControlID="txtenddate" Enabled="True">
                            </ajaxToolkit:CalendarExtender>
                        </td>
                    </tr>
                    <%-- <tr>
                        <td colspan="2">
                            &nbsp;
                        </td>
                    </tr>--%>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblChargesByuer" runat="server" Text="Handling Charges For Buyer(%) :&nbsp;&nbsp;"
                                SkinID="lblRsz"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtChargesByuer" runat="server" TabIndex="3" SkinID="txt"></asp:TextBox>
                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server"
                                FilterMode="ValidChars" FilterType="Custom" ValidChars="0123456789." TargetControlID="txtChargesByuer" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblChargesSeller" runat="server" Text="Handling Charges For Grower(%) :&nbsp;&nbsp"
                                SkinID="lblRsz"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtChargesSeller" runat="server" TabIndex="4" SkinID="txt"></asp:TextBox>
                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server"
                                FilterMode="ValidChars" FilterType="Custom" ValidChars="0123456789." TargetControlID="txtChargesSeller" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblMinChargesByuer" runat="server" Text="Min Handling Charges For Buyer(Rs) :&nbsp;&nbsp"
                                SkinID="lblRsz"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtMinChargesByuer" runat="server" TabIndex="5" SkinID="txt"></asp:TextBox>
                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server"
                                FilterMode="ValidChars" FilterType="Custom" ValidChars="0123456789." TargetControlID="txtMinChargesByuer" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblPenalityCharges" runat="server" Text="Penalty Charges(%) :&nbsp;&nbsp"
                                SkinID="lblRsz"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtPenalityCharges" runat="server" TabIndex="6" SkinID="txt"></asp:TextBox>
                            
                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server"
                                FilterMode="ValidChars" FilterType="Custom" ValidChars="0123456789." TargetControlID="txtPenalityCharges" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2">
                            <asp:Button ID="btnAdd" runat="server" CssClass="ButtonClass" OnClientClick="return Validate();"
                                SkinID="btn" TabIndex="7" Text="ADD" />
                            &nbsp;
                            <asp:Button ID="btnView" runat="server" CausesValidation="False" CssClass="ButtonClass"
                                SkinID="btn" TabIndex="8" Text="VIEW" />
                        </td>
                    </tr>
                    </caption>
                </table>
            </center>
            <br />
            <center>
                <asp:Label ID="lblerrmsg" runat="server" SkinID="lblRed" Visible="true"></asp:Label>
                <asp:Label ID="lblmsgifo" runat="server" SkinID="lblGreen" Visible="true"></asp:Label>
            </center>
            <br />
            <center>
                <asp:Panel ID="panel2" runat="server" ScrollBars="Auto" Width="650px" Height="300px">
                    <table>
                        <tr>
                            <td>
                                &nbsp;
                                <asp:GridView ID="GVHandlingCharges" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                    PageSize="100" SkinID="GridView" Width="300px" AllowSorting="True" EnableSortingAndPagingCallbacks="True">
                                    <Columns>
                                        <asp:TemplateField ShowHeader="false">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandName="Edit"
                                                    Text="Edit"></asp:LinkButton>
                                                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="false" CommandName="Delete"
                                                    Text="Delete" OnClientClick="return confirm('Do you want to delete the selected record?')"></asp:LinkButton>
                                                <br />
                                            </ItemTemplate>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="From Date" SortExpression ="FromDate">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDate" runat="server" Width="150" Text='<%# Bind("FromDate","{0:dd-MMM-yyyy}") %>'></asp:Label>
                                                <asp:Label ID="lblid" runat="server" Visible="false" Text='<%# Bind("HCAutoId") %>'></asp:Label>
                                                
                                            </ItemTemplate>
                                           <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Wrap="false" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="To Date" SortExpression ="ToDate">
                                            <ItemTemplate>
                                                <asp:Label ID="lblenddate" runat="server" Width="100px" Text='<%# Bind("ToDate","{0:dd-MMM-yyyy}") %>'></asp:Label>
                                            </ItemTemplate>
                                           <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Wrap="false" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Buyer(%)">
                                            <ItemTemplate>
                                                <asp:Label ID="lblChargesByuer" runat="server" Text='<%# Bind("ChargesForBuyerPerc") %>'></asp:Label>
                                            </ItemTemplate>
                                           <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="false" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Grower(%)">
                                            <ItemTemplate>
                                                <asp:Label ID="lblChargesSeller" runat="server" Text='<%# Bind("ChargesForSellerPerc") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="false" /> <ItemStyle Wrap="True" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Buyer Amount(Rs)">
                                            <ItemTemplate>
                                                <asp:Label ID="lblMinChargesByuer" runat="server" Text='<%# Bind("MinChargesForBuyer","{0:0.00}") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="false" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Penalty Charges(%)">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPenalityCharges" runat="server" Text='<%# Bind("PenaltyCharges") %>'></asp:Label>
                                            </ItemTemplate>
                                            
                                           <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="false" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle BackColor="#CCCCCC" />
                                    <PagerStyle ForeColor="Black" HorizontalAlign="Center" BackColor="#999999" />
                                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                    <AlternatingRowStyle BackColor="#CCCCCC" />
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </center>
              <a name="Bottom">
                    <div align="right">
                        <a href="#Top">
                            <asp:Image ID="Image2" runat="server" ImageUrl="Images/top.png" Width="30px" Height="30px" /></a>
                        <asp:LinkButton ID="LinkButton1" runat="server"></asp:LinkButton>
                    </div>
                </a>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
