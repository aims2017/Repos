
Partial Class Ifab_RptGrowerWiseWeekly
    Inherits BasePage
    Protected Sub btnReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnReport.Click
        msginfo.Text = ValidationMessage(1014)
      
        Try
            Dim QS, Week, Month, Year As String
            Week = ddlWeek.SelectedItem.Value
            Year = ddlYear.SelectedItem.Text
            Month = ddlMonth.SelectedValue

            QS = Request.QueryString.Get("QS")

            Dim qrystring As String = "Ifab_RptGrowerWiseWeeklyV.aspx?" & QueryStr.Querystring() & "&Week=" & Week & "&Month=" & Month & "&Year=" & Year
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "message", "<script>window.open('" & qrystring & "',null,'toolbar=no,scrollbars=yes,location=no,resizable =yes,width=1050,height=700,left=0,top=0')</script>", False)

        Catch ex As Exception
            msginfo.Text = ValidationMessage(1022)
        End Try

    End Sub

    Protected Sub btnBack_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnBack.Click
        Response.Redirect("Report.aspx")
    End Sub
    <System.Web.Services.WebMethod()> _
    Public Shared Sub AbandonSession()
        Dim i As Int16 = UserDetailsDB.UpdateUserlog()

    End Sub
    Public Function ValidationMessage(ByVal ErrorCode As Integer) As String
        Dim dt2 As DataTable

        'Dim Message As String
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
