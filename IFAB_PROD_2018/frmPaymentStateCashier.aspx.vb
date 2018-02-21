
Partial Class frmPaymentStateCashier
    Inherits System.Web.UI.Page
    Dim dt As DataTable
    Dim BuyerId, RowsGenerated As Integer
    Dim AucDate As DateTime
    Protected Sub Page_Load1(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            txtAucDate.Text = Today.ToString("dd-MMM-yyyy")
            DisplayGrid()
        End If
    End Sub
    Sub DisplayGrid()
        BuyerId = ddlBuyerId.SelectedValue
        If txtAucDate.Text = "" Then
            AucDate = "01/01/1900"
        Else
            AucDate = txtAucDate.Text
        End If
        dt = DLCashBillDetails.GetCashierView(BuyerId, AucDate)
        If dt.Rows.Count > 0 Then
            GVCashBillDetails.DataSource = dt
            GVCashBillDetails.DataBind()
            GVCashBillDetails.Visible = True
            GVCashBillDetails.Enabled = True
            lblmsg.Text = ""
        Else
            lblmsg.Text = "No Records to display."
            msginfo.Text = ""
            GVCashBillDetails.Visible = False
        End If
    End Sub
    Protected Sub ddlBuyerId_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlBuyerId.SelectedIndexChanged
        BuyerId = ddlBuyerId.SelectedValue
        If txtAucDate.Text = "" Then
            AucDate = "01/01/1900"
        Else
            AucDate = txtAucDate.Text
        End If
        DisplayGrid()
    End Sub
    Protected Sub GVCashBillDetails_PageIndexChanged(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GVCashBillDetails.PageIndexChanging
        GVCashBillDetails.PageIndex = e.NewPageIndex
        ViewState("PageIndex") = GVCashBillDetails.PageIndex
        DisplayGrid()
        GVCashBillDetails.DataBind()
        GVCashBillDetails.Visible = True
    End Sub
    Protected Sub txtAucDate_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtAucDate.TextChanged
        BuyerId = ddlBuyerId.SelectedValue
        If txtAucDate.Text = "" Then
            AucDate = "01/01/1900"
        Else
            AucDate = txtAucDate.Text
        End If
        DisplayGrid()
    End Sub
    Protected Sub GVCashBillDetails_Sorting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewSortEventArgs) Handles GVCashBillDetails.Sorting
        Dim sortingDirection As String = String.Empty
        If dir() = SortDirection.Ascending Then
            dir = SortDirection.Descending
            sortingDirection = "Desc"
        Else
            dir = SortDirection.Ascending
            sortingDirection = "Asc"
        End If

        BuyerId = ddlBuyerId.SelectedValue
        If txtAucDate.Text = "" Then
            AucDate = "01/01/1900"
        Else
            AucDate = txtAucDate.Text
        End If
        dt = DLCashBillDetails.GetCashierView(BuyerId, AucDate)
        Dim sortedView As New DataView(dt)
        sortedView.Sort = Convert.ToString(e.SortExpression) & " " & sortingDirection
        GVCashBillDetails.DataSource = sortedView
        GVCashBillDetails.DataBind()
    End Sub
    Public Property dir() As SortDirection
        Get
            If ViewState("dirState") Is Nothing Then
                ViewState("dirState") = SortDirection.Descending
            End If
            Return DirectCast(ViewState("dirState"), SortDirection)
        End Get
        Set(ByVal value As SortDirection)
            ViewState("dirState") = value
        End Set
    End Property
End Class
