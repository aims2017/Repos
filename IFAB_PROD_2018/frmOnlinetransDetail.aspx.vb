
Partial Class frmOnlinetransDetail
    Inherits System.Web.UI.Page
    Dim Paydate As DateTime
    Dim BuyerId As Integer
    Dim dt, dt1 As DataTable
    Protected Sub btnView_Click(sender As Object, e As EventArgs) Handles btnView.Click
        dispgrid()

    End Sub
    Sub Dispgrid()
        If txtDate.Text = "" Then
            Paydate = "01/01/1900"
        Else
            Paydate = txtDate.Text
        End If
        BuyerId = ddlBuyerId.SelectedValue
        dt = DLCashBillDetails.GetpaymentView(Paydate, BuyerId)
        If (dt.Rows.Count > 0) Then
            GVCashBillDetails.DataSource = dt
            GVCashBillDetails.DataBind()
            GVCashBillDetails.Visible = True
            GVCashBillDetails.Enabled = True
            lblmsg.Text = ""
            lblhead.Visible = True
            lbltotal.Visible = True
            txttotal.Visible = True
            dt1 = DLCashBillDetails.GetTotalpayment(Paydate, BuyerId)
            txttotal.Text = dt1.Rows(0)("total").ToString
        Else
            lblmsg.Text = "No Records to display."
            msginfo.Text = ""
            lblhead.Visible = False
            GVCashBillDetails.Visible = False
            txttotal.Text = ""
            lbltotal.Visible = False
            txttotal.Visible = False
        End If

    End Sub
    Protected Sub Page_Load1(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            txtDate.Text = Today.ToString("dd-MMM-yyyy")
            lbltotal.Visible = False
            txttotal.Visible = False
        End If
    End Sub
    Protected Sub GVCashBillDetails_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GVCashBillDetails.PageIndexChanging
        lblmsg.Text = ""
        msginfo.Text = ""
        GVCashBillDetails.PageIndex = e.NewPageIndex
        ViewState("PageIndex") = GVCashBillDetails.PageIndex
        Dispgrid()
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

        If txtDate.Text = "" Then
            Paydate = "01/01/1900"
        Else
            Paydate = txtDate.Text
        End If
        BuyerId = ddlBuyerId.SelectedValue
        dt = DLCashBillDetails.GetpaymentView(Paydate, BuyerId)
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
