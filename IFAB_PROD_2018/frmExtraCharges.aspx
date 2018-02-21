<%@ Page Title="EXTRA CHARGES" Language="VB" MasterPageFile="~/Home.master" AutoEventWireup="false"
    CodeFile="frmExtraCharges.aspx.vb" Inherits="frmExtraCharges" %>

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

            msg = DropDownForZeroMul(document.getElementById("<%=ddlGrowerid.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=ddlGrowerid.ClientID %>").focus();
                a = document.getElementById("<%=lblGrowerName.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }
            msg = ValidateDateMul(document.getElementById("<%=txtDate.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=txtDate.ClientID %>").focus();
                a = document.getElementById("<%=lblDate.ClientID %>").innerHTML;
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
                    EXTRA CHARGES
                </h1>
            </center>
            &nbsp;
            <center>
                <asp:Label ID="lblGrowerName" runat="server" SkinID="lblRsz" Width="130px" Text="Grower Name*^ :"></asp:Label>
                <asp:DropDownList ID="ddlGrowerid" runat="server" SkinID="ddlRsz" DataSourceID="ObjGrowerName"
                    DataTextField="Supp_Name" DataValueField="Supp_Id_Auto" TabIndex="1" Width="250px">
                </asp:DropDownList>
                <asp:ObjectDataSource runat="server" ID="ObjGrowerName" SelectMethod="GetDDlGrowerName"
                    TypeName="DLExtraCharges"></asp:ObjectDataSource>
                <table>
                    <%-- <tr>
                        <center>
                            <td align="center" >
                                <asp:Label ID="lblGrowerName" runat="server" SkinID="lblRsz" Width="180px" Text="Grower Name*^ :&nbsp;&nbsp;"></asp:Label>
                            </td>
                            <td align="left" >
                            <asp:DropDownList ID="ddlGrowerid" runat="server" SkinID="ddlRsz" DataSourceID="ObjGrowerName"
                                DataTextField="Supp_Name" DataValueField="Supp_Id_Auto" Width="250px">
                            </asp:DropDownList>
                            <asp:ObjectDataSource runat="server" ID="ObjGrowerName" SelectMethod="GetDDlGrowerName"
                                TypeName="DLExtraCharges"></asp:ObjectDataSource>
                        </td>
                    </tr>--%>
            </center>
            <tr>
                <td colspan="4">
                    <hr />
                </td>
            </tr>
            <tr>
                <td align="right">
                    <asp:Label ID="lblDate" runat="server" Text="Date *:&nbsp;&nbsp" SkinID="lbl"></asp:Label>
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
                </td>
                <td align="right">
                    <asp:Label ID="lblFreight" runat="server" Text="Freight :&nbsp;&nbsp" SkinID="lbl"></asp:Label>
                </td>
                <td align="left">
                    <asp:TextBox ID="txtFreight" runat="server" TabIndex="3" SkinID="txt"></asp:TextBox>
                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server"
                        FilterMode="ValidChars" FilterType="Custom" ValidChars="0123456789." TargetControlID="txtFreight" />
                </td>
            </tr>
            <tr>
                <td align="right">
                    <asp:Label ID="lblChemical" runat="server" Text="Chemical :&nbsp;&nbsp" SkinID="lbl"></asp:Label>
                </td>
                <td align="left" style="width: 276px">
                    <asp:TextBox ID="txtChemical" runat="server" TabIndex="4" SkinID="txt"></asp:TextBox>
                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server"
                        FilterMode="ValidChars" FilterType="Custom" ValidChars="0123456789." TargetControlID="txtChemical" />
                </td>
                <td align="right">
                    <asp:Label ID="lblFretilizer" runat="server" Text="Fertilizer :&nbsp;&nbsp" SkinID="lbl"></asp:Label>
                </td>
                <td align="left">
                    <asp:TextBox ID="txtFretilizer" runat="server" TabIndex="5" SkinID="txt"></asp:TextBox>
                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server"
                        FilterMode="ValidChars" FilterType="Custom" ValidChars="0123456789." TargetControlID="txtFretilizer" />
                </td>
            </tr>
            <tr>
                <td align="right">
                    <asp:Label ID="lblFlowerPurchase" runat="server" Text="Flower Purchase :&nbsp;&nbsp"
                        SkinID="lblRsz" Width="250"></asp:Label>
                </td>
                <td align="left" style="width: 276px">
                    <asp:TextBox ID="txtFlowerPurchase" runat="server" TabIndex="6" SkinID="txt"></asp:TextBox>
                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server"
                        FilterMode="ValidChars" FilterType="Custom" ValidChars="0123456789." TargetControlID="txtFlowerPurchase" />
                </td>
                <td align="right">
                    <asp:Label ID="lblOther" runat="server" Text="Other :&nbsp;&nbsp" SkinID="lbl"></asp:Label>
                </td>
                <td align="left">
                    <asp:TextBox ID="txtOther" runat="server" TabIndex="7" SkinID="txt"></asp:TextBox>
                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server"
                        FilterMode="ValidChars" FilterType="Custom" ValidChars="0123456789." TargetControlID="txtOther" />
                </td>
            </tr>
            <caption>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="4">
                        <asp:Button ID="btnAdd" runat="server" CssClass="ButtonClass" OnClientClick="return Validate();"
                            SkinID="btn" TabIndex="8" Text="ADD" />
                        &nbsp;
                        <asp:Button ID="btnView" runat="server" CausesValidation="False" CssClass="ButtonClass"
                            SkinID="btn" TabIndex="9" Text="VIEW" />
                    </td>
                </tr>
            </caption>
            </table> </center>
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
                                <asp:GridView ID="GVExtraCharges" runat="server" AllowPaging="True" AutoGenerateColumns="False"
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
                                        <asp:TemplateField HeaderText="Grower Name" SortExpression ="GrowerId">
                                            <ItemTemplate>
                                                <asp:Label ID="ddlGrowerid" runat="server" Width="150" Text='<%# Bind("Supp_Name") %>'></asp:Label>
                                                <asp:Label ID="lblid" runat="server" Visible="false" Text='<%# Bind("ExtChAutoId") %>'></asp:Label>
                                                <asp:Label ID="lblGrowID" Visible="false" Width="150" runat="server" Text='<%# Bind("GrowerId") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="false" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Date" SortExpression ="Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDate" runat="server" Width="100px" Text='<%# Bind("Date","{0:dd-MMM-yyyy}") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Wrap="false" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Freight">
                                            <ItemTemplate>
                                                <asp:Label ID="lblFreight" runat="server" Text='<%# Bind("Freight","{0:0.00}") %>'></asp:Label>
                                            </ItemTemplate>
                                          <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="false" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Chemical">
                                            <ItemTemplate>
                                                <asp:Label ID="lblChemical" runat="server" Text='<%# Bind("Chemical","{0:0.00}") %>'></asp:Label>
                                            </ItemTemplate>
                                          <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="false" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Fertilizer">
                                            <ItemTemplate>
                                                <asp:Label ID="lblFretilizer" runat="server" Text='<%# Bind("Fertilizer","{0:0.00}") %>'></asp:Label>
                                            </ItemTemplate>
                                           <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="false" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Flower Purchase">
                                            <ItemTemplate>
                                                <asp:Label ID="lblFlowerPurchase" runat="server" Text='<%# Bind("FlowerPurchase","{0:0.00}") %>'></asp:Label>
                                            </ItemTemplate>
                                          <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="false" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Other">
                                            <ItemTemplate>
                                                <asp:Label ID="lblOther" runat="server" Text='<%# Bind("OtherCharges","{0:0.00}") %>'></asp:Label>
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
