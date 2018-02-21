
Partial Class FrmFlowerMaster
    Inherits BasePage
    Dim ELFlower As New FlowerMaster
    Dim BLFlower As New BLFlowerMaster
    Dim dt, dt1 As New DataTable
    Dim a As Integer
    Dim path, path1 As String
    Dim GlobalFunction As New GlobalFunction

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim heading As String
        heading = Session("RptFrmTitleName")
        Lblheading.Text = heading
        txtFlowerName.Focus()
    End Sub

    Protected Sub Btnadd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Btnadd.Click
        If (Session("BranchCode") = Session("ParentBranch")) Then
            a = GlobalFunction.UserPrivilage()
            'If a = 1 Or a = 2 Or a = 6 Or a = 7 Then
            If Btnadd.Text = "ADD" Then
                ELFlower.FlowerId = 0
                ELFlower.FlowerCode = txtFlowerCode.Text
                ELFlower.FlowerName = txtFlowerName.Text
                ELFlower.FlowerCategory = ddlFlowerCategory.SelectedValue
                ELFlower.Photo = ViewState("ImageTime")
                dt1 = BLFlower.CheckDuplicate(ELFlower)
                If dt1.Rows.Count > 0 Then
                    lblErrorMsg.Text = ValidationMessage(1030)
                    lblgreen.Text = ""
                Else
                    Dim I As Int32 = BLFlower.InsertFlowerMaster(ELFlower)
                    If I <> 0 Then
                        lblgreen.Text = ValidationMessage(1020)
                        lblErrorMsg.Text = ""
                        Clear()
                    Else
                        lblErrorMsg.Text = ValidationMessage(1030)
                        lblgreen.Text = ""
                    End If
                    DisplayGridview()
                    ViewState("PageIndex") = 0
                    GVFlowerMaster.PageIndex = 0
                End If
            Else
                ELFlower.FlowerCode = txtFlowerCode.Text
                ELFlower.FlowerName = txtFlowerName.Text
                ELFlower.FlowerCategory = ddlFlowerCategory.SelectedValue
                ELFlower.Photo = ViewState("ImageTime")
                ELFlower.FlowerId = ViewState("ID")
                dt1 = BLFlower.CheckDuplicate(ELFlower)
                If dt1.Rows.Count > 0 Then
                    lblErrorMsg.Text = ValidationMessage(1030)
                    lblgreen.Text = ""
                Else
                    Dim i As Int32 = BLFlower.UpdateFlowerMaster(ELFlower)
                    If i <> 0 Then
                        lblgreen.Text = ValidationMessage(1017)
                        lblErrorMsg.Text = ""
                        Clear()
                    Else
                        lblErrorMsg.Text = ValidationMessage(1030)
                        lblgreen.Text = ""
                    End If
                    DisplayGridview()
                End If

                'lblErrorMsg.Visible = True
                Btnadd.Text = "ADD"
                BtnView.Text = "VIEW"
                Me.ImageMap1.ImageUrl = "~/Images/Flowerimageupload.gif"
                GVFlowerMaster.PageIndex = ViewState("PageIndex")
            End If
        'Else
        '    lblErrorMsg.Text = "No Write Permission!"
        '    lblgreen.Text = ""
        'End If
        Else
        lblErrorMsg.Text = ValidationMessage(1021)
        lblgreen.Text = ""
        End If

    End Sub
    Sub DisplayGridview()
        ELFlower.FlowerId = 0
        ELFlower.FlowerCode = txtFlowerCode.Text
        ELFlower.FlowerName = txtFlowerName.Text
        If ddlFlowerCategory.SelectedItem.Text = "Select" Then
            ELFlower.FlowerCategory = 0
        Else
            ELFlower.FlowerCategory = ddlFlowerCategory.SelectedValue
        End If
        dt = BLFlower.GetGridFlowerMaster(ELFlower)

        If dt.Rows.Count > 0 Then
            GVFlowerMaster.DataSource = dt
            GVFlowerMaster.DataBind()
            GVFlowerMaster.Visible = True
            GVFlowerMaster.Enabled = True

            For Each rows As GridViewRow In GVFlowerMaster.Rows
                If CType(rows.FindControl("lblPhoto"), Image).ImageUrl = "" Then
                    CType(rows.FindControl("lblPhoto"), Image).ImageUrl = "~/Images/Flowerimageupload1.gif"
                End If
            Next
        Else
            lblErrorMsg.Text = ValidationMessage(1023)
            lblgreen.Text = ""
            GVFlowerMaster.Visible = False
        End If
    End Sub

    Protected Sub BtnView_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnView.Click
        lblErrorMsg.Text = ""
        lblgreen.Text = ""
        'a = GlobalFunction.UserPrivilage()
        'If a = 1 Or a = 2 Or a = 3 Or a = 4 Then
        If BtnView.Text = "BACK" Then
            Btnadd.Text = "ADD"
            BtnView.Text = "VIEW"
            ViewState("ImageTime") = "~/Images/" & path
            GVFlowerMaster.PageIndex = ViewState("PageIndex")
            DisplayGridview()
            Clear()

        Else
            ViewState("PageIndex") = 0
            GVFlowerMaster.PageIndex = 0
            DisplayGridview()
        End If
        'Else
        'lblErrorMsg.Text = "No Read Permission!"
        'lblgreen.Text = ""
        'End If
    End Sub

    Protected Sub GVFlowerMaster_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GVFlowerMaster.RowDeleting
        If (Session("BranchCode") = Session("ParentBranch")) Then
            Dim Foto As String = Session("Path") + CType(GVFlowerMaster.Rows(e.RowIndex).FindControl("lbphoto"), HiddenField).Value.ToString.Replace("~/", "")
            If IO.File.Exists(Foto) Then
                IO.File.Delete(Foto)
            End If
            ELFlower.FlowerId = CType(GVFlowerMaster.Rows(e.RowIndex).FindControl("lblFlowerId"), Label).Text
            BLFlower.DeleteRecord(ELFlower)
            'lblErrorMsg.Visible = True
            'lblgreen.Visible = True
            GVFlowerMaster.PageIndex = ViewState("PageIndex")
            DisplayGridview()
            lblgreen.Text = ValidationMessage(1028)
            lblErrorMsg.Text = ""

        Else
            lblErrorMsg.Text = ValidationMessage(1029)
            lblgreen.Text = ""
        End If
    End Sub

    Protected Sub GVFlowerMaster_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles GVFlowerMaster.RowEditing
        lblErrorMsg.Text = ""
        lblgreen.Text = ""
        'a = GlobalFunction.UserPrivilage()
        'If a = 1 Or a = 2 Or a = 6 Or a = 7 Then
        Btnadd.Text = "UPDATE"
        BtnView.Text = "BACK"
        'lblErrorMsg.Visible = False
        ViewState("ID") = CType(GVFlowerMaster.Rows(e.NewEditIndex).FindControl("lblFlowerId"), Label).Text
        txtFlowerName.Text = CType(GVFlowerMaster.Rows(e.NewEditIndex).FindControl("lblFlowerName"), Label).Text
        txtFlowerCode.Text = CType(GVFlowerMaster.Rows(e.NewEditIndex).FindControl("lblFlowerCode"), Label).Text
        ddlFlowerCategory.SelectedValue = CType(GVFlowerMaster.Rows(e.NewEditIndex).FindControl("lblFlowerCategoryId"), Label).Text
        ViewState("ImageTime") = CType(GVFlowerMaster.Rows(e.NewEditIndex).FindControl("lbphoto"), HiddenField).Value
        Dim prop As New RoleMaster
        ELFlower.FlowerId = ViewState("ID")
        ELFlower.FlowerCode = txtFlowerCode.Text
        ELFlower.FlowerName = txtFlowerName.Text
        ELFlower.FlowerCategory = ddlFlowerCategory.SelectedValue
        dt = BLFlower.GetGridFlowerMaster(ELFlower)
        GVFlowerMaster.DataSource = dt
        GVFlowerMaster.DataBind()
        GVFlowerMaster.Enabled = False
        If ViewState("ImageTime") = "" Then
            Me.ImageMap1.ImageUrl = "~/Images/Flowerimageupload.gif"
        Else
            Me.ImageMap1.ImageUrl = ViewState("ImageTime")
        End If

        'Else
        'lblErrorMsg.Text = "No Edit Permission!"
        'lblgreen.Text = ""
        'End If
    End Sub
    Sub Clear()
        txtFlowerCode.Text = ""
        txtFlowerName.Text = ""
        ddlFlowerCategory.ClearSelection()
        Me.ImageMap1.ImageUrl = "~/Images/Flowerimageupload.gif"
        ViewState("ImageTime") = ""
    End Sub
    Protected Sub GVRoleMaster_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GVFlowerMaster.PageIndexChanging
        'lblErrorMsg.Visible = False
        'lblgreen.Visible = False
        GVFlowerMaster.PageIndex = e.NewPageIndex
        ViewState("PageIndex") = GVFlowerMaster.PageIndex
        DisplayGridview()
        lblErrorMsg.Text = ""
        lblgreen.Text = ""
    End Sub
    Protected Sub btnUpload_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpload.Click
        If FileUpload2.FileName <> "" Then
            If FileUpload2.PostedFile.ContentLength <= 30000 Then
                Try
                    If ViewState("ImageTime") <> Nothing Then
                        Dim Foto As String = Session("Path") + ViewState("ImageTime").ToString.Replace("~/", "")
                        If IO.File.Exists(Foto) Then
                            IO.File.Delete(Foto)
                        End If
                    End If
                    lblgreen.Text = ""
                    lblErrorMsg.Text = ""
                    path = "S" & Replace(txtFlowerName.Text.Trim.ToString().Replace(" ", ""), "/", "") + TimeOfDay.ToString().Replace("/", "").Replace(":", "") & ".jpg"
                    If (FileUpload2.PostedFile.ContentType.ToLower() = "image/gif" Or FileUpload2.PostedFile.ContentType.ToLower() = "image/jpeg" Or FileUpload2.PostedFile.ContentType.ToLower() = "image/tiff" Or FileUpload2.PostedFile.ContentType.ToLower() = "image/pjpeg" Or FileUpload2.PostedFile.ContentType.ToLower() = "image/x-png" Or FileUpload2.PostedFile.ContentType.ToLower() = "image/jpg" Or FileUpload2.PostedFile.ContentType.ToLower() = "image/tif" Or FileUpload2.PostedFile.ContentType.ToLower() = "image/bmp") Then


                        'path = (Server.MapPath("Images/") + Convert.ToString(Guid.NewGuid()) + FileUpload1.FileName)
                        'FileUpload1.SaveAs(path)
                        Me.FileUpload2.SaveAs(Server.MapPath("~\Images\" & path.Replace("/", "").Replace(":", "")))
                        path1 = "~/Images/" & path.Replace("/", "").Replace(":", "")
                        ViewState("ImageTime") = "~/Images/" & path
                        txtpath.Text = path1
                        Me.ImageMap1.ImageUrl = txtpath.Text
                    Else
                        lblErrorMsg.Text = "Photo format should be gif/jpeg/jpg/pjpeg/bmp/x-png/tif/tiff ."
                    End If
                Catch ex As Exception
                    lblErrorMsg.Text = ValidationMessage(1079)
                    lblgreen.Text = ""
                End Try
            Else
                lblErrorMsg.Text = ValidationMessage(1079)
                lblgreen.Text = ""
            End If
        Else
            lblErrorMsg.Text = ValidationMessage(1078)
            lblgreen.Text = ""
        End If
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


End Class
