<%@ Page Language="VB" AutoEventWireup="false" CodeFile="rptCompanyViewer.aspx.vb" Inherits="rptCompanyViewer" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=B03F5F7F11D50A3A" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Height="457px"  AsyncRendering="false" SizeToReportContent="true"
        Width="707px">
    </rsweb:ReportViewer>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </form>
</body>
</html>
