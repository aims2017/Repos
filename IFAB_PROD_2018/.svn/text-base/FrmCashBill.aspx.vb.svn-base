
Partial Class FrmCashBill
    Inherits BasePage
    Dim dt As DataTable
    Dim BuyerId, RowsGenerated As Integer
    Protected Sub btnGenerate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGenerate.Click

        BuyerId = ddlBuyerId.SelectedValue
        RowsGenerated = DLCashBillDetails.GenerateCashBillDetails(BuyerId)
        If RowsGenerated = 0 Then
            lblgreen.Text = "No Records to Generate."
            lblErrorMsg.Text = ""
        Else
            lblgreen.Text = "Records Generated successfully."
            lblErrorMsg.Text = ""
        End If
        ddlCashBillNo.ClearSelection()
        ddlCashBillNo.DataSourceID = "ObjCashBillNo"
        ddlCashBillNo.DataBind()
        DisplayGrid()
    End Sub
    Sub DisplayGrid()
        BuyerId = ddlBuyerId.SelectedValue
        dt = DLCashBillDetails.GetCashBillDetails(BuyerId)
        If dt.Rows.Count > 0 Then
            GVCashBillDetails.DataSource = dt
            GVCashBillDetails.DataBind()
            GVCashBillDetails.Visible = True
            GVCashBillDetails.Enabled = True
            lblErrorMsg.Text = ""
        Else
            lblErrorMsg.Text = "No Records to display."
            lblgreen.Text = ""
            GVCashBillDetails.Visible = False
        End If
    End Sub
    Protected Sub GVCashBillDetails_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GVCashBillDetails.PageIndexChanging
        lblErrorMsg.Text = ""
        lblgreen.Text = ""
        GVCashBillDetails.PageIndex = e.NewPageIndex
        ViewState("PageIndex") = GVCashBillDetails.PageIndex
        DisplayGrid()
    End Sub
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
    <System.Web.Services.WebMethod()> Public Sub AbandonSession()
        Dim i As Int16 = UserDetailsDB.UpdateUserlog()
        Response.Redirect("LogIn.aspx")
    End Sub

    
    Protected Sub BtnView_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnView.Click
        DisplayGrid()
    End Sub

    Protected Sub BtnPrint_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnPrint.Click
        Dim CashBillNo As String
        lblgreen.Text = ""
        BuyerId = ddlBuyerId.SelectedValue
        CashBillNo = ddlCashBillNo.SelectedValue
        Dim QS As String
        QS = Request.QueryString.Get("QS")
        If ddlCashBillNo.SelectedItem.Text = "Select" Then
            lblErrorMsg.Text = "Please select a Buyer Name & Cash Bill No."
        Else
            Dim qrystring As String = "Rpt_CashBillReportVBillNo.aspx?" & QueryStr.Querystring() & "&BuyerId=" & BuyerId & "&CashBillNo=" & CashBillNo
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "message", "<script>window.open('" & qrystring & "',null,'toolbar=no,scrollbars=yes,location=no,resizable =yes,width=1050,height=700,left=0,top=0')</script>", False)
            lblErrorMsg.Text = ""
        End If
    End Sub

    Protected Sub BtnCashDraft_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnCashDraft.Click
        Try
            Dim QS As String
            Dim BuyerId As Integer = ddlBuyerId.SelectedValue

            QS = Request.QueryString.Get("QS")
            lblErrorMsg.Text = "Please enter the Date."

            Dim qrystring As String = "Rpt_CashBillReportDraftV.aspx?" & QueryStr.Querystring() & "&BuyerId=" & BuyerId
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "message", "<script>window.open('" & qrystring & "',null,'toolbar=no,scrollbars=yes,location=no,resizable =yes,width=1050,height=700,left=0,top=0')</script>", False)
            lblErrorMsg.Text = ""
        Catch ex As Exception
            lblErrorMsg.Text = "Please enter correct data."
        End Try
    End Sub
End Class
