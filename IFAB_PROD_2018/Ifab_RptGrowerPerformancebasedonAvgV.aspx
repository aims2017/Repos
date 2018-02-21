<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Ifab_RptGrowerPerformancebasedonAvgV.aspx.vb" Inherits="Ifab_RptGrowerPerformancebasedonAvgV" Title="Grower Performance Report Based On Avg price" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=B03F5F7F11D50A3A"
  Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>GROWER PERFORMANCE DETAILS</title>
</head>
<body>
    <form id="form1" runat="server">
    <div align="right">
    </div>
    <div align="center">
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" AsyncRendering="False" SizeToReportContent="true">
        </rsweb:ReportViewer><br />
         <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
       <asp:Label ID="lblmsg" runat="server" BackColor="Red" ForeColor="White"></asp:Label>
    </div>
    </form>
</body>
</html>