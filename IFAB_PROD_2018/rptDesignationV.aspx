<%@ Page Language="VB" AutoEventWireup="false" CodeFile="rptDesignationV.aspx.vb"
    Inherits="rptDesignationV" Title="Designation" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=B03F5F7F11D50A3A"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Designation Details</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    </div>
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" AsyncRendering="false" SizeToReportContent="true">
    </rsweb:ReportViewer>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </form>
    <asp:Label ID="lblmsg"  SkinID="lblRed" runat="server"></asp:Label>
</body>
</html>
