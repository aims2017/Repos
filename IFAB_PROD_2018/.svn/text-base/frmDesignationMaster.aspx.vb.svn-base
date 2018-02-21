
Partial Class frmDepreciation_Rates
    Inherits BasePage
    Dim DesignationManager As New DesignationManager
    Dim DesignationP As New DesignationP
    Dim dt As New DataTable
    Protected Sub BtnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnAdd.Click
        txtName.Focus()
        If (Session("BranchCode") = Session("ParentBranch")) Then
            If BtnAdd.Text = "UPDATE" Then
                DesignationP.Designation_ID = ViewState("DID")
                DesignationP.Designation = txtName.Text
                dt = DesignationManager.GetDuplicateNameType(DesignationP)
                If dt.Rows.Count > 0 Then
                    lblmsg.Text = ValidationMessage(1030)
                    msginfo.Text = ValidationMessage(1014)
                Else
                    DesignationManager.UpdateRecord(DesignationP)
                    BtnAdd.Text = "ADD"
                    BtnDetails.Text = "VIEW"
                    clear()
                    GridView1.PageIndex = ViewState("PageIndex")
                    DisplayGrid()
                    msginfo.Text = ValidationMessage(1017)
                    lblmsg.Text = ValidationMessage(1014)
                End If
            ElseIf BtnAdd.Text = "ADD" Then
                DesignationP.Designation = txtName.Text
                dt = DesignationManager.GetDuplicateNameType(DesignationP)
                If dt.Rows.Count > 0 Then
                    lblmsg.Text = ValidationMessage(1030)
                    msginfo.Text = ValidationMessage(1014)
                Else
                    DesignationManager.InsertRecord(DesignationP)
                    msginfo.Text = ValidationMessage(1020)
                    lblmsg.Text = ValidationMessage(1014)
                    ViewState("PageIndex") = 0
                    GridView1.PageIndex = 0
                    DisplayGrid()
                    clear()
                End If
            End If
        Else
            lblmsg.Text = ValidationMessage(1021)
            msginfo.Text = ValidationMessage(1014)
        End If
    End Sub
    Protected Sub GridView1_SelectedIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridView1.PageIndexChanging
        GridView1.PageIndex = e.NewPageIndex
        ViewState("PageIndex") = GridView1.PageIndex
        DisplayGrid()
    End Sub
    Protected Sub BtnDetails_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnDetails.Click
        LinkButton1.Focus()
        If BtnDetails.Text = "BACK" Then
            GridView1.PageIndex = ViewState("PageIndex")
            DisplayGrid()
            lblmsg.Text = ValidationMessage(1014)
            BtnDetails.Text = "VIEW"
            BtnAdd.Text = "ADD"
            clear()
        Else
            clear()
            msginfo.Text = ValidationMessage(1014)
            lblmsg.Text = ValidationMessage(1014)
            ViewState("PageIndex") = 0
            GridView1.PageIndex = 0

            DisplayGrid()
        End If

    End Sub
    Sub DisplayGrid()
        Dim dt As New DataTable
        DesignationP.Designation_ID = 0
        dt = DesignationManager.GetDesiganation(DesignationP)
        If dt.Rows.Count > 0 Then
            GridView1.DataSource = dt
            GridView1.DataBind()
            GridView1.Visible = True
            GridView1.Enabled = True


        Else
            lblmsg.Text = ValidationMessage(1023)
       
            GridView1.Visible = False
            msginfo.Text = ValidationMessage(1014)

        End If
    End Sub

    Protected Sub GridView1_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridView1.RowDeleting
        If (Session("BranchCode") = Session("ParentBranch")) Then

            DesignationManager.ChangeFlag(CType(GridView1.Rows(e.RowIndex).Cells(1).FindControl("Label5"), Label).Text)
            msginfo.Text = ValidationMessage(1028)
            lblmsg.Text = ValidationMessage(1014)
            txtName.Focus()
            GridView1.PageIndex = ViewState("PageIndex")
            DisplayGrid()
        Else
            lblmsg.Text = ValidationMessage(1029)
            msginfo.Text = ValidationMessage(1014)
        End If

    End Sub
    Protected Sub GridView1_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles GridView1.RowEditing
        Dim el As New DesignationP
        txtName.Text = CType(GridView1.Rows(e.NewEditIndex).FindControl("Label1"), Label).Text
        ViewState("DID") = CType(GridView1.Rows(e.NewEditIndex).FindControl("Label5"), Label).Text
        lblmsg.Text = ValidationMessage(1014)
        msginfo.Text = ValidationMessage(1014)
        el.Designation_ID = ViewState("DID")
        Dim dt As New DataTable
        dt = DesignationManager.GetDesiganation(el)
        GridView1.DataSource = dt
        GridView1.DataBind()
        GridView1.Enabled = False
        BtnAdd.Text = "UPDATE"
        BtnDetails.Text = "BACK"
    End Sub
    Sub clear()
        txtName.Text = ""
    End Sub

    Protected Sub Page_Load1(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        txtName.Focus()
        Dim heading As String
        heading = Session("RptFrmTitleName")
        Me.Lblheading.Text = heading
     
    End Sub
    <System.Web.Services.WebMethod()> Public Sub AbandonSession()
        Dim i As Int16 = UserDetailsDB.UpdateUserlog()
        Response.Redirect("LogIn.aspx")
    End Sub

    Protected Sub GridView1_Sorting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewSortEventArgs) Handles GridView1.Sorting
        Dim sortingDirection As String = String.Empty
        If dir() = SortDirection.Ascending Then
            dir = SortDirection.Descending
            sortingDirection = "Desc"
        Else
            dir = SortDirection.Ascending
            sortingDirection = "Asc"
        End If
        DisplayGrid()
        Dim dt As New DataTable
        DesignationP.Designation_ID = 0
        dt = DesignationManager.GetDesiganation(DesignationP)
        Dim sortedView As New DataView(dt)
        sortedView.Sort = Convert.ToString(e.SortExpression) & " " & sortingDirection
        GridView1.DataSource = sortedView
        GridView1.DataBind()
        GridView1.Visible = True
        GridView1.Enabled = True
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
