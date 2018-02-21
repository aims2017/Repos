<%@ Page Title="Salary Scale Grade Master" Language="VB" MasterPageFile="~/Home.master" AutoEventWireup="false" CodeFile="frmSalaryScaleGradeMaster.aspx.vb" Inherits="frmSalaryScaleGradeMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <script language="JavaScript" type="text/javascript">
        function Valid() {
            var msg;
            msg = Field250(document.getElementById("<%=txtGrade.ClientID %>"), 'Grade ');
            if (msg != "") {
                document.getElementById("<%=txtGrade.ClientID %>").focus();
                return msg;
            } 003201010101
            msg = Field250(document.getElementById("<%=txtScaleRange.ClientID %>"), 'Scale Range');
            if (msg != "") {
                document.getElementById("<%=txtScaleRange.ClientID %>").focus();
                return msg;
            }

            return true;
            }
      
        function Validate() {

            var msg = Valid();
            if (msg != true) {
                if (navigator.appName == "Microsoft Internet Explorer") {
                    document.getElementById("<%=lblerrmsg.ClientID %>").innerText = msg;
                    document.getElementById("<%=lblmsgifo.ClientID %>").innerText = "";
                    return false;
                }
                else if (navigator.appName == "Netscape") {
                    document.getElementById("<%=lblerrmsg.ClientID %>").innerText = msg;
                    document.getElementById("<%=lblmsgifo.ClientID %>").innerText = "";
                    return false;
                }
            }
            return true;
        }
        </script>
    <asp:UpdatePanel ID="Updatepanel1" runat="server">
        <ContentTemplate>
            <center>
                <h1 class="headingTxt">
                    SALARY SCALE GRADE MASTER
                </h1>
            </center>
            &nbsp;
            <center>
                <table>
                   
                    
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblGrade" runat="server" Text="Grade*:&nbsp;&nbsp;" SkinID="lbl"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtGrade" runat="server" SkinID="txt" TabIndex="1" ></asp:TextBox>
                        
                            
                        </td>
                    </tr>
                    
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblScaleRange" runat="server" Text="Scale Range*:&nbsp;&nbsp;" width="180" SkinID="lblRsz"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtScaleRange" runat="server" SkinID="txt" TabIndex="2" ></asp:TextBox>
                        </td>
                    </tr>
                    
                    <tr>
                        <td align="right">
                            &nbsp;
                        </td>
                        <td align="left">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="btnTd" colspan="2">
                            <center>
                                <asp:Button ID="btnAdd" runat="server" CssClass="ButtonClass" OnClientClick="return Validate();"
                                    SkinID="btn" Text="ADD" TabIndex="2" ValidationGroup="ADD" />
                                &nbsp;<asp:Button ID="btnView" runat="server" CausesValidation="False" CssClass="ButtonClass"
                                    SkinID="btn" TabIndex="3" Text="VIEW" />
                    </tr>
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
                                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                    PageSize="100" SkinID="GridView" Width="300px">
                                    <Columns>
                                        <asp:TemplateField ShowHeader="false">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandName="Edit"
                                                    Text="Edit"></asp:LinkButton>
                                                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="false" CommandName="Delete"
                                                    Text="Delete" Visible =false  OnClientClick="return confirm('Do you want to delete the selected record?')"></asp:LinkButton>
                                                <br />
                                            </ItemTemplate>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Grade">
                                            <ItemTemplate>
                                                <asp:Label ID="lblGrade" runat="server" Text='<%# Bind("Grade") %>'></asp:Label>
                                                <asp:Label ID="lblid" runat="server" Visible="false" Text='<%# Bind("Grade_Auto") %>'></asp:Label>
                                                
                                            </ItemTemplate>
                                            <ItemStyle Wrap="True" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Scale Range">
                                            <ItemTemplate>
                                               
                                                <asp:Label ID="lblScaleRange" runat="server" Text='<%# Bind("Salary_Scale") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Wrap="True" />
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
            
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

