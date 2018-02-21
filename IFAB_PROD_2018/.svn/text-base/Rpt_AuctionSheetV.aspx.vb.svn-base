Partial Class Rpt_AuctionSheetV
    Inherits BasePage

    Dim ds1 As DataTable
    Dim Prop As New QureyStringP
    Dim obj As New SelfDetailsB
    Dim dt1, dt2 As New DataTable
    Dim DS As New DataSet
    Dim DL As New DLRpt_AuctionSheet

    Dim dr1, dr2 As New Microsoft.Reporting.WebForms.ReportDataSource
    Protected Sub ReportViewer1_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles ReportViewer1.Init
        Dim AuctionDate As DateTime = Request.QueryString.Get("AuctionDate")
        Dim GrowerId As String = Request.QueryString.Get("GrowerId")
        QueryStr.GetValue(Page.Request, Prop)

        dt1 = DLRpt_AuctionSheet.GetAuctionSheet(GrowerId, AuctionDate)
        dt2 = DLUnsoldFlower.GetUnsoldFlowerDetails(GrowerId, AuctionDate, AuctionDate)
        Try
            If dt1.Rows.Count > 0 Then
                ReportViewer1.LocalReport.ReportPath = "Rpt_AuctionSheet.rdlc"
                dr1 = New Microsoft.Reporting.WebForms.ReportDataSource("GlobalDataSet_IFAB_AuctionSheetReport", dt1)
                dr2 = New Microsoft.Reporting.WebForms.ReportDataSource("GlobalDataSet_Rpt_UnsoldFlowerReport", dt2)
                Dim paramList As New Generic.List(Of Microsoft.Reporting.WebForms.ReportParameter)
                paramList.Add(New Microsoft.Reporting.WebForms.ReportParameter("AuctionDate", AuctionDate, False))
                ReportViewer1.LocalReport.SetParameters(paramList)
                ReportViewer1.LocalReport.DataSources.Clear()
                Me.ReportViewer1.LocalReport.DataSources.Add(dr1)
                Me.ReportViewer1.LocalReport.DataSources.Add(dr2)
                ReportViewer1.LocalReport.Refresh()
                ds1 = obj.RPT_GetSelfDeatilsByBranch(Request.QueryString(1))
                AddHandler ReportViewer1.LocalReport.SubreportProcessing, AddressOf SubreportProcessingEvent
            Else
                lblErrorMsg.Text = "No Records to Display."
            End If
        Catch ex As Exception
            lblErrorMsg.Text = "Error While loading Report, Enter all Mandatory fields and try again. "
        End Try
    End Sub

    Sub SubreportProcessingEvent(ByVal sender As Object, ByVal e As Microsoft.Reporting.WebForms.SubreportProcessingEventArgs)
        Dim rptDataSource As New Microsoft.Reporting.WebForms.ReportDataSource("GlobalDataSet_Proc_RPT_GetSelfDetailByUID", ds1)
        Dim rptDataSource1 As New Microsoft.Reporting.WebForms.ReportDataSource("GlobalDataSet_Rpt_UnsoldFlowerReport", dt2)
        e.DataSources.Add(rptDataSource)
        e.DataSources.Add(rptDataSource1)
    End Sub

End Class



