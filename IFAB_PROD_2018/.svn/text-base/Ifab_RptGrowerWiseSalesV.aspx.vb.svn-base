
Partial Class Ifab_RptGrowerWiseSalesV
    Inherits System.Web.UI.Page
    Dim obj As New SelfDetailsB
    Dim dt1, dt, dt2, dt3 As New DataTable
    Dim Prop As New QureyStringP
    Protected Sub ReportViewer1_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles ReportViewer1.Init

        Dim DL As New DLBuyerDetails
        Dim dm As New Microsoft.Reporting.WebForms.ReportDataSource
        Dim fromdate As Date = Request.QueryString.Get("fromdate")
        Dim todate As Date = Request.QueryString.Get("todate")
        Dim GrowerId As String = Request.QueryString.Get("GrowerID")
        QueryStr.GetValue(Page.Request, Prop)
        dt3 = DL.GetTinNo()
        Dim Tin As String
        Tin = dt3.Rows(0).Item("Tin").ToString()
        dt1 = DL.RptGetGrowerWiseSales(fromdate, todate, GrowerId)
        Try
            If dt1.Rows.Count > 0 Then
                ReportViewer1.LocalReport.ReportPath = "Ifab_RptGrowerWiseSales.rdlc"
                dm = New Microsoft.Reporting.WebForms.ReportDataSource("GlobalDataSet_Rpt_GrowerWiseDetails", dt1)
                Dim paramList As New Generic.List(Of Microsoft.Reporting.WebForms.ReportParameter)
                paramList.Add(New Microsoft.Reporting.WebForms.ReportParameter("fromdate", fromdate, False))
                paramList.Add(New Microsoft.Reporting.WebForms.ReportParameter("todate", todate, False))
                paramList.Add(New Microsoft.Reporting.WebForms.ReportParameter("Tin", Tin, False))


                ReportViewer1.LocalReport.SetParameters(paramList)
                ReportViewer1.LocalReport.DataSources.Clear()
                Me.ReportViewer1.LocalReport.DataSources.Add(dm)
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
