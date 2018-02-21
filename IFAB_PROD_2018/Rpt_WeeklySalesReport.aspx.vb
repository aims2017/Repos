
Partial Class Rpt_WeeklySalesReport
    Inherits BasePage

    Protected Sub btnReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnReport.Click
        Try
            Dim QS, Week, Month, Year As String
            Dim GrowerId As Integer = ddlGrowerid.SelectedValue
            Week = ddlWeek.SelectedItem.Value
            Year = ddlYear.SelectedItem.Text
            Month = ddlMonth.SelectedValue

            QS = Request.QueryString.Get("QS")
           
            Dim qrystring As String = "Rpt_WeeklySalesReportV.aspx?" & QueryStr.Querystring() & "&GrowerId=" & GrowerId & "&Week=" & Week & "&Month=" & Month & "&Year=" & Year
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "message", "<script>window.open('" & qrystring & "',null,'toolbar=no,scrollbars=yes,location=no,resizable =yes,width=1050,height=700,left=0,top=0')</script>", False)
            lblErrorMsg.Text = ""

        Catch ex As Exception
            lblErrorMsg.Text = "Please enter correct data."
        End Try
    End Sub
    Protected Sub btnBack_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnBack.Click
        Response.Redirect("Report.aspx")
    End Sub
End Class
