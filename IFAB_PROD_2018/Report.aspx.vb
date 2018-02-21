
Partial Class Report
    Inherits BasePage
    Dim SearchKey As String
    Dim Id As Integer
    Protected Sub GrdReport_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles GrdReport.RowEditing
        Dim Link As String = CType(GrdReport.Rows(e.NewEditIndex).FindControl("HFLinkName"), HiddenField).Value
        Dim QryStr As String = CType(GrdReport.Rows(e.NewEditIndex).FindControl("HFQryStr"), HiddenField).Value
        Dim Heading As String = CType(GrdReport.Rows(e.NewEditIndex).FindControl("HFHeading"), HiddenField).Value
        If CType(GrdReport.Rows(e.NewEditIndex).FindControl("HFDirectLink"), HiddenField).Value = "Y" Then
            Dim Str1 As String = Link + "?QS=" + QryStr + "&heading=" + Heading
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "message", "<script>window.open('" & Str1 & "',null,'toolbar=no,scrollbars=yes,location=no,resizable =yes,width=1050,height=700,left=0,top=0')</script>", False)
        Else
            Dim Str1 As String = Link + "?QS=" + QryStr + "&heading=" + Heading
            Session("HelpLink") = UserDetailsDB.GetHelpLink(Link, "R")
            Response.Redirect(Link)
        End If
    End Sub

    Protected Sub Page_Load1(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Dim heading As String
        'heading = Session("RptFrmTitleName")
        'Me.Lblheading.Text = heading
        If Not IsPostBack Then
            Id = 0
            ViewState("SearchKey") = txtSearchKey.Text
            disp(Id, ViewState("SearchKey"))
        Else
            Id = 1
            ViewState("SearchKey") = txtSearchKey.Text
            disp(Id, ViewState("SearchKey"))
        End If

    End Sub
    Sub disp(ByVal Id As Integer, ByVal SearchKey As String)
        Dim dt As New DataTable
        dt = DLReport.GetReportData(Id, ViewState("SearchKey"))
        If dt.Rows.Count > 0 Then
            GrdReport.DataSource = dt
            GrdReport.DataBind()
            GrdReport.Visible = True
            GrdReport.Enabled = True
        Else
            txtSearchKey.Text = "Search not found."
            txtSearchKey.ForeColor = Drawing.Color.IndianRed
            GrdReport.Visible = False
        End If
    End Sub

    Protected Sub txtSearchKey_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSearchKey.TextChanged
        ViewState("SearchKey") = txtSearchKey.Text
        If ViewState("SearchKey") <> "Search" Then
            Id = 1
        End If
        txtSearchKey.ForeColor = Drawing.Color.Black
        disp(Id, ViewState("SearchKey"))
    End Sub

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        Id = 0
        SearchKey = txtSearchKey.Text
        disp(Id, ViewState("SearchKey"))
        txtSearchKey.Text = "Search"
        txtSearchKey.ForeColor = Drawing.Color.Black
    End Sub
End Class
