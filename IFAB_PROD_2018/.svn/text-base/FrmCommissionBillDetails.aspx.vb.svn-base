
Partial Class FrmCommissionBillDetails
    Inherits BasePage
    Dim dt As DataTable
    Dim GrowerId, RowsGenerated As Integer
    Protected Sub btnGenerate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGenerate.Click

        GrowerId = ddlGrowerid.SelectedValue
        RowsGenerated = DLCommissionBillDetails.GenerateCommissionBillDetails(GrowerId)
        If RowsGenerated = 0 Then
            lblgreen.Text = "No Records to Generate."
            lblErrorMsg.Text = ""
        Else
            lblgreen.Text = "Records Generated successfully."
            lblErrorMsg.Text = ""
        End If
        ddlCommissionBillNo.ClearSelection()
        ddlCommissionBillNo.DataSourceID = "ObjCommissionBillNo"
        ddlCommissionBillNo.DataBind()
        DisplayGrid()
    End Sub
    Sub DisplayGrid()
        GrowerId = ddlGrowerid.SelectedValue
        dt = DLCommissionBillDetails.GetCommissionBillDetails(GrowerId)
        If dt.Rows.Count > 0 Then
            GVCommissionBillDetails.DataSource = dt
            GVCommissionBillDetails.DataBind()
            GVCommissionBillDetails.Visible = True
            GVCommissionBillDetails.Enabled = True
            lblErrorMsg.Text = ""

        Else
            lblErrorMsg.Text = "No Records to display."
            lblgreen.Text = ""
            GVCommissionBillDetails.Visible = False
        End If
    End Sub
    Protected Sub GVCommissionBillDetails_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GVCommissionBillDetails.PageIndexChanging
        lblErrorMsg.Text = ""
        lblgreen.Text = ""
        GVCommissionBillDetails.PageIndex = e.NewPageIndex
        ViewState("PageIndex") = GVCommissionBillDetails.PageIndex
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
        lblErrorMsg.Text = ""
        lblgreen.Text = ""
    End Sub

    Protected Sub BtnPrint_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnPrint.Click
        Dim CommissionBillNo As String
        'lblErrorMsg.Text = ""
        lblgreen.Text = ""
        GrowerId = ddlGrowerid.SelectedValue
        CommissionBillNo = ddlCommissionBillNo.SelectedValue
        Dim QS As String
        QS = Request.QueryString.Get("QS")
        If ddlCommissionBillNo.SelectedItem.Text = "Select" Then
            lblErrorMsg.Text = "Please select a Grower Name & Commission Bill No."
        Else
            Dim qrystring As String = "Ifab_RptCommissionBillVCBNo.aspx?" & QueryStr.Querystring() & "&GrowerId=" & GrowerId & "&CommissionBillNo=" & CommissionBillNo
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "message", "<script>window.open('" & qrystring & "',null,'toolbar=no,scrollbars=yes,location=no,resizable =yes,width=1050,height=700,left=0,top=0')</script>", False)
            lblErrorMsg.Text = ""
        End If
    End Sub

    Protected Sub BtnCommissionDraft_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnCommissionDraft.Click
        lblgreen.Text = ""
        GrowerId = ddlGrowerid.SelectedValue
        Dim QS As String
        QS = Request.QueryString.Get("QS")
        
        Dim qrystring As String = "Ifab_RptCommissionBillDraftV.aspx?" & QueryStr.Querystring() & "&GrowerId=" & GrowerId
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "message", "<script>window.open('" & qrystring & "',null,'toolbar=no,scrollbars=yes,location=no,resizable =yes,width=1050,height=700,left=0,top=0')</script>", False)
        lblErrorMsg.Text = ""

    End Sub
End Class
