<%@ Page Language="VB" MasterPageFile="~/Home.master" AutoEventWireup="false" CodeFile="FrmRptIndividualEmployeeDetails.aspx.vb"
    Inherits="FrmRptIndividualEmployeeDetails" Title="Individual Employee Details Report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="JavaScript" type="text/javascript">
        function Valid() {
            var msg;
            msg = DropDownForZero(document.getElementById("<%=DdlBranchName.ClientID %>"), 'Branch Name');
            if (msg != "") {
                document.getElementById("<%=DdlBranchName.ClientID %>");
                return msg;
            }

            return true;
        }
        function Validate() {
            var msg = Valid();
            if (msg != true) {
                if (navigator.appName == "Microsoft Internet Explorer") {
                    document.getElementById("<%=msginfo.ClientID %>").innerText = msg;
                    document.getElementById("<%=lblmsg.ClientID %>").innerText = "";
                    return false;
                }
                else if (navigator.appName == "Netscape") {
                    document.getElementById("<%=msginfo.ClientID %>").textContent = msg;
                    document.getElementById("<%=lblmsg.ClientID %>").innerText = "";
                    return false;
                }
            }
            return true;
        }
    </script>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <center>
                <h1 class="headingTxt">
                    INDIVIDUAL EMPLOYEE DETAILS
                </h1>
                <br />
                <table>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblBranchName" runat="server" Text="Branch Name*&nbsp;:&nbsp;"
                                SkinID="lbl" Width="100px"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:DropDownList ID="DdlBranchName" TabIndex="1" runat="server" SkinID="ddlL" AutoPostBack="True"
                                DataSourceID="ObjBranch" DataTextField="BranchName" DataValueField="BranchCode">
                            </asp:DropDownList>
                            <asp:ObjectDataSource ID="ObjBranch" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="SelectBranch" TypeName="DLBranchAccessLevel"></asp:ObjectDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblDept" runat="server" Text="Department :&nbsp;" SkinID="lblRsz"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:DropDownList ID="ddlDept" runat="server" DataSourceID="ObjDept1" DataTextField="DeptName"
                                DataValueField="DeptID" SkinID="ddlL" AutoPostBack="True" TabIndex="2">
                            </asp:DropDownList>
                            <asp:ObjectDataSource ID="ObjDept1" runat="server" TypeName="DLRptIndividualEmployeeDetails"
                                SelectMethod="GetDepartment1">
                                <SelectParameters>
                                            <asp:ControlParameter ControlID="DdlBranchName" Name="BranchCode" Type="String" PropertyName="SelectedValue" />
                                        </SelectParameters>
                                </asp:ObjectDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblEmpType" runat="server" Text="Employment Type :&nbsp;" SkinID="lblRsz"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:DropDownList ID="ddlEmpType" runat="server" SkinID="ddlRsz" Width="200px" TabIndex="2" AutoPostBack="True">
                                <asp:ListItem Value="0" Text="ALL"></asp:ListItem>
                                <asp:ListItem Value="FullTime" Text="FullTime"></asp:ListItem>
                                <asp:ListItem Value="PartTime" Text="PartTime"></asp:ListItem>
                                <asp:ListItem Value="Visiting" Text="Visiting"></asp:ListItem>
                                <asp:ListItem Value="Honorary" Text="Honorary"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblempcategory" runat="server" Width="180px" Text="Employee Category :&nbsp;"
                                SkinID="lblRsz"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:DropDownList ID="ddlempcategory" runat="server" SkinID="ddlRsz" Width="200px" TabIndex="3" AutoPostBack="True">
                                <asp:ListItem Value="0" Text="ALL"></asp:ListItem>
                                <asp:ListItem Value="General" Text="General"></asp:ListItem>
                                <asp:ListItem Value="Faculty" Text="Faculty"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblEmpName" runat="server" SkinID="lblRsz" Text="Employee Name :&nbsp;"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:DropDownList ID="DdlEmpName" runat="server" DataSourceID="ObjEmpName" DataTextField="Emp_Name"
                                DataValueField="EmpID" SkinID="ddlRsz" Width="200px" TabIndex="5">
                            </asp:DropDownList>
                            <asp:ObjectDataSource ID="ObjEmpName" runat="server" TypeName="DLRptIndividualEmployeeDetails"
                                SelectMethod="GetEmpName1">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DdlBranchName" Name="BranchCode" Type="String" PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="ddlDept" DefaultValue="0" Name="DeptId" PropertyName="SelectedValue"
                                        Type="String" />
                                    <asp:ControlParameter ControlID="ddlEmpType" DefaultValue="0" Name="EmpType" PropertyName="SelectedValue"
                                        Type="String" />
                                    <asp:ControlParameter ControlID="ddlempcategory" DefaultValue="0" Name="EmpCat" PropertyName="SelectedValue"
                                        Type="String" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Button ID="Btnreport" runat="server" CausesValidation="True" OnClientClick="return Validate();"
                                Text="REPORT" SkinID="btn" TabIndex="6" CssClass="ButtonClass " />&nbsp;
                            <asp:Button ID="Btnback" runat="server" CausesValidation="True" SkinID="btn" TabIndex="7"
                                Text="BACK" CssClass="ButtonClass " />
                        </td>
                    </tr>
                </table>
                <asp:Label ID="msginfo" runat="server" SkinID="lblRed" Visible="true"></asp:Label>
                <asp:Label ID="lblmsg" runat="server" SkinID="lblGreen" Visible="true"></asp:Label>
            </center>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
