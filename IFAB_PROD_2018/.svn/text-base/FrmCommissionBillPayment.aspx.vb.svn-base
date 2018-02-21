
Partial Class FrmCommissionBillPayment
    Inherits BasePage
    Dim dt As DataTable
    Sub DisplayGrid()
        Dim GrowerId As Integer
        Dim NotPaid As String
        GrowerId = ddlGrowerid.SelectedValue
        If ChkNotPaid.Checked = True Then
            NotPaid = "Y"
        Else
            NotPaid = "N"
        End If
        dt = DLCommissionBillDetails.GetCommissionBillPayment(GrowerId, NotPaid)
        If dt.Rows.Count > 0 Then
            GVCommissionBillPayment.DataSource = dt
            GVCommissionBillPayment.DataBind()
            GVCommissionBillPayment.Visible = True
            GVCommissionBillPayment.Enabled = True
            lblErrorMsg.Text = ""
        Else
            lblErrorMsg.Text = "No Records to display."
            lblgreen.Text = ""
            GVCommissionBillPayment.Visible = False
        End If
    End Sub
    Protected Sub GVCommissionBillPayment_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GVCommissionBillPayment.PageIndexChanging
        lblErrorMsg.Text = ""
        lblgreen.Text = ""
        GVCommissionBillPayment.PageIndex = e.NewPageIndex
        ViewState("PageIndex") = GVCommissionBillPayment.PageIndex
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
        lblgreen.Text = ""
    End Sub

    Protected Sub GVCommissionBillPayment_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GVCommissionBillPayment.RowDeleting
        If (Session("BranchCode") = Session("ParentBranch")) Then
            Dim CommissionBillId As Integer
            Dim Amount As Double
            If CType(GVCommissionBillPayment.Rows(e.RowIndex).FindControl("TxtPaidAmount"), TextBox).Text = "" Then
                lblErrorMsg.Text = ValidationMessage(1094)
                lblgreen.Text = ""
                Exit Sub
            Else
                Amount = CType(GVCommissionBillPayment.Rows(e.RowIndex).FindControl("TxtPaidAmount"), TextBox).Text
            End If
            CommissionBillId = CType(GVCommissionBillPayment.Rows(e.RowIndex).FindControl("lblCommissionBillId"), Label).Text
            DLCommissionBillDetails.UpdateCommissionBillAmount(CommissionBillId, Amount)
            'lblErrorMsg.Visible = True
            'lblgreen.Visible = True
            DisplayGrid()
            lblgreen.Text = ValidationMessage(1093)
            lblErrorMsg.Text = ""
        Else
            lblErrorMsg.Text = ValidationMessage(1029)
            lblgreen.Text = ""
        End If
    End Sub

    Protected Sub Page_Load1(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ChkNotPaid.Checked = True
        End If

    End Sub
End Class
