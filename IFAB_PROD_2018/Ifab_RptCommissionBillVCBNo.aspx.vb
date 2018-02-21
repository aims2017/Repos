
Partial Class Ifab_RptCommissionBillVCBNo
    Inherits System.Web.UI.Page
    Dim obj As New SelfDetailsB
    Dim dt1, dt, dt2 As New DataTable
    Dim Prop As New QureyStringP
    Protected Sub ReportViewer1_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles ReportViewer1.Init
        Dim DL As New DLBuyerDetails
        Dim dm, dr2 As New Microsoft.Reporting.WebForms.ReportDataSource

        Dim GrowerId As Integer = Request.QueryString.Get("GrowerID")
        Dim CommissionBillNo As String = Request.QueryString.Get("CommissionBillNo")
        Dim todate As Date
        dt = DL.GetAuctionDateFromBillNo(CommissionBillNo)
        todate = dt.Rows(0).Item("AuctionDate")
        If todate <> "1/1/1900" Then
            todate = dt.Rows(0).Item("AuctionDate")
        Else
            todate = "1/1/1900"
        End If
        QueryStr.GetValue(Page.Request, Prop)
        dt1 = DL.RptGetCommissionBill(todate, GrowerId, CommissionBillNo)
        dt2 = DLUnsoldFlower.GetUnsoldFlowerDetails(GrowerId, todate, todate)
        Try
            If dt1.Rows.Count > 0 Then
                ReportViewer1.LocalReport.ReportPath = "Ifab_RptCommissionBill.rdlc"
                dm = New Microsoft.Reporting.WebForms.ReportDataSource("GlobalDataSet_Rpt_CommisionBillReport", dt1)
                dr2 = New Microsoft.Reporting.WebForms.ReportDataSource("GlobalDataSet_Rpt_UnsoldFlowerReport", dt2)
                Dim paramList As New Generic.List(Of Microsoft.Reporting.WebForms.ReportParameter)
                paramList.Add(New Microsoft.Reporting.WebForms.ReportParameter("todate", todate, False))
                ReportViewer1.LocalReport.SetParameters(paramList)
                ReportViewer1.LocalReport.DataSources.Clear()
                Me.ReportViewer1.LocalReport.DataSources.Add(dm)
                Me.ReportViewer1.LocalReport.DataSources.Add(dr2)
                ReportViewer1.LocalReport.Refresh()
                dt = obj.RPT_GetSelfDeatilsByBranch(Request.QueryString(1))
                AddHandler ReportViewer1.LocalReport.SubreportProcessing, AddressOf SubreportProcessingEvent
            Else
                lblmsg.Text = ValidationMessage(1023)
            End If
        Catch ex As Exception
            lblmsg.Text = ValidationMessage(1074)
        End Try
    End Sub
    Sub SubreportProcessingEvent(ByVal sender As Object, ByVal e As Microsoft.Reporting.WebForms.SubreportProcessingEventArgs)
        Dim rptDataSource As New Microsoft.Reporting.WebForms.ReportDataSource("GlobalDataSet_Proc_RPT_GetSelfDetailByUID", dt)
        e.DataSources.Add(rptDataSource)
        Dim rptDataSource1 As New Microsoft.Reporting.WebForms.ReportDataSource("GlobalDataSet_Rpt_UnsoldFlowerReport", dt2)
        e.DataSources.Add(rptDataSource1)
    End Sub
    ''Code Written for Multilingual By Ajit on 21st Oct 2013
    ''Retriving the text of controls based on Language
    Public Function ValidationMessage(ByVal ErrorCode As Integer) As String
        Dim dt2 As DataTable
        dt2 = Session("ValidationTable")
        Dim X As Integer = dt2.Rows.Count() - 1
        Dim str As String = " "
        For i As Integer = 0 To X
            If (dt2.Rows(i).Item("MessageCode").ToString() = ErrorCode) Then
                Return dt2.Rows(i).Item("MessageText").ToString()
            End If
        Next
        Return 0
    End Function
End Class
