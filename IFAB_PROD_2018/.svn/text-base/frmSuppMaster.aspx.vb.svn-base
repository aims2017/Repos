Imports System.IO
Imports System.Collections.Generic
Imports System.Data
Imports System.Web.UI.WebControls.Button
Partial Class frmSuppMaster
    Inherits BasePage
    Dim path, path1, str As String
    Dim alt As String
    Dim idd As Integer
    Dim SB As New SupplierManager
    Dim SD As New SupplierDB
    Dim SE As New Supplier
    Dim dt As New DataTable

    'code by Anchala on 11-08-12
    'method for insert and update
    Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdd.Click

        TxtName.Focus()
        If (Session("BranchCode") = Session("ParentBranch")) Then
            AssignEntity()
            dt = SB.GetDuplicateSupplierMaster(SE)
            If btnAdd.Text = "UPDATE" Then
                If dt.Rows.Count > 0 Then
                    lblmsg.Text = ValidationMessage(1014)
                    msginfo.Text = ValidationMessage(1030)
                Else
                    SB.UpdateRecord(SE)
                    GVSupp.Visible = True
                    btnAdd.Text = "ADD"
                    btnView.Text = "VIEW"
                    clear()
                    ViewState("ImageTime") = ""
                    msginfo.Text = ValidationMessage(1014)
                    GVSupp.PageIndex = ViewState("PageIndex")
                    display()
                    lblmsg.Text = ValidationMessage(1017)
                    'txtopeningBal.Text = Format(CDate(Session("FinStartDate")), "dd-MMM-yyyy")
                    display()
                End If
            ElseIf btnAdd.Text = "ADD" Then
                SE.Supp_ID = 0
                dt = SB.GetDuplicateSupplierMaster(SE)
                If dt.Rows.Count > 0 Then
                    lblmsg.Text = ValidationMessage(1014)
                    msginfo.Text = ValidationMessage(1030)

                Else
                    SB.InsertRecord(SE)
                    btnAdd.Text = "ADD"
                    display()
                    clear()
                    ViewState("ImageTime") = ""
                    msginfo.Text = ValidationMessage(1014)
                    ViewState("PageIndex") = 0
                    GVSupp.PageIndex = 0
                    lblmsg.Text = ValidationMessage(1020)
                    'txtopeningBal.Text = Format(CDate(Session("FinStartDate")), "dd-MMM-yyyy")
                End If
            End If
        Else
            msginfo.Text = ValidationMessage(1021)
            lblmsg.Text = ValidationMessage(1014)
        End If
    End Sub
    Sub AssignEntity()

        SE.Supp_ID = ViewState("Supp_Id")

        SE.Supp_Name = TxtName.Text
        SE.Supp_Code = txtcode.Text
        SE.Tin = txttin.Text
        SE.CSTNo = txtcst.Text
        SE.Supp_Address = txtAddress.Text
        SE.City = txtcity.Text
        'SE.PostalCode = txtpostalcode.Text
        SE.State = ddlState.SelectedValue
        SE.Country = txtcountry1.Text
        SE.Contact_Number1 = txtcntct1.Text
        SE.Contactno2 = txtcntct2.Text
        SE.Contact_Person = TxtcntctP.Text
        SE.FaxNO = txtfaxno.Text
        SE.Email = txtemail.Text
        SE.Pani = txtPani.Text
        ''
        SE.SurveyNumber = txtSur.Text
        SE.GreenHouseArea = txtGreen.Text
        SE.GrowerType = txtGrowerType.Text
        SE.ContactPerson2 = txtConPer2.Text
        SE.District1 = txtDistrict.Text
        SE.Village = txtVillage.Text
        SE.Taluk = txtTaluk.Text
        SE.District2 = txtDistrict2.Text
        SE.State2 = ddlStateFarm.SelectedValue
        SE.Country2 = txtCountry2.Text
        ''


        If ViewState("ImageTime") = Nothing Then
            SE.Photos = ""
        Else
            SE.Photos = ViewState("ImageTime")
        End If
        If txtPan.Text = Nothing Then
            SE.PAN = ""
        Else
            SE.PAN = txtPan.Text
        End If
        If txtEmail2.Text = Nothing Then
            SE.Email2 = ""
        Else
            SE.Email2 = txtEmail2.Text
        End If
        If txtBankName.Text = Nothing Then
            SE.BankName = ""
        Else
            SE.BankName = txtBankName.Text
        End If
        If txtBranchArea.Text = Nothing Then
            SE.BankArea = ""
        Else
            SE.BankArea = txtBranchArea.Text
        End If
        If txtIFSC.Text = Nothing Then
            SE.IFSCCode = ""
        Else
            SE.IFSCCode = txtIFSC.Text
        End If
        If txtIFSC.Text = Nothing Then
            SE.IFSCCode = ""
        Else
            SE.IFSCCode = txtIFSC.Text
        End If
        If txtAcNo.Text = Nothing Then
            SE.AcNo = ""
        Else
            SE.AcNo = txtAcNo.Text
        End If

        SE.ToAc = ddlTypeAcct.SelectedValue

        If txttin.Text = "" Then
            SE.Tin = 0
        Else
            SE.Tin = txttin.Text
        End If



        'If txtopeningBal.Text = "" Then
        '    SE.OpBalanceDate = "1/1/1900"
        'Else
        '    SE.OpBalanceDate = CType(txtopeningBal.Text, Date)
        'End If
        'If txtcreditlimit.Text = "" Then
        '    SE.Credit_Limit = 0
        'Else
        '    SE.Credit_Limit = txtcreditlimit.Text
        'End If
        'If txtcreditP.Text = "" Then
        '    SE.Credit_Period = 0.0
        'Else
        '    SE.Credit_Period = txtcreditP.Text
        'End If
        'If txtsuptorec.Text = "" Then
        '    SE.Opening_Balance_CR = 0
        'Else
        '    SE.Opening_Balance_CR = txtsuptorec.Text
        'End If
        'If txtsuptopay.Text = "" Then
        '    SE.Opening_Balance_DR = 0
        'Else
        '    SE.Opening_Balance_DR = txtsuptopay.Text
        'End If
    End Sub
    'code by Anchala on 11-08-12
    'method for display
    Protected Sub btnView_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnView.Click
        LinkButton1.Focus()
        msginfo.Text = ValidationMessage(1014)
        If btnView.Text <> "BACK" Then
            lblmsg.Text = ValidationMessage(1014)
            ViewState("PageIndex") = 0
            GVSupp.PageIndex = 0
            display()
            ' GVSupp.Visible = True

        Else

            lblmsg.Text = ValidationMessage(1014)
            msginfo.Text = ValidationMessage(1014)
            GVSupp.Enabled = True
            'ChkBuyer.Enabled = True
            GVSupp.PageIndex = ViewState("PageIndex")
            clear()
            btnView.Text = "VIEW"
            btnAdd.Text = "ADD"
            display()
        End If
    End Sub
    'code by Anchala on 11-08-12
    'method for page indexing
    Protected Sub GVSupp_PageIndexChanged(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GVSupp.PageIndexChanging
        GVSupp.PageIndex = e.NewPageIndex
        ViewState("PageIndex") = GVSupp.PageIndex
        display()
        GVSupp.DataBind()
        GVSupp.Visible = True
        'Multilingual()
    End Sub
    'code by Anchala on 11-08-12
    'method for row editing
    Protected Sub GVSupp_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles GVSupp.RowEditing
        'If (Session("BranchCode") = Session("ParentBranch")) Then
        lblmsg.Text = ValidationMessage(1014)
        msginfo.Text = ValidationMessage(1014)
        TxtName.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l1"), Label).Text
        txtcode.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("ll1"), Label).Text
        'SE.Registered = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l2"), Label).Text
        'ChkBuyer.Enabled = False
        'If SE.Registered = "Y" Then
        '    Chkreg.Checked = True
        'Else
        '    Chkreg.Checked = False
        'End If
        txttin.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l4"), Label).Text
        txtcst.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l5"), Label).Text
        txtAddress.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l6"), Label).Text
        txtcity.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l7"), Label).Text
        'txtpostalcode.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l8"), Label).Text
        ddlState.SelectedValue = CType(GVSupp.Rows(e.NewEditIndex).FindControl("stateid"), Label).Text
        txtcountry1.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l10"), Label).Text
        'txtdlno.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l11"), Label).Text
        TxtcntctP.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l12"), Label).Text
        txtcntct1.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l13"), Label).Text
        txtcntct2.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l14"), Label).Text
        txtfaxno.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l15"), Label).Text
        txtemail.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l16"), Label).Text
        'txtcreditP.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l17"), Label).Text
        'txtcreditlimit.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l18"), Label).Text
        'txtsuptorec.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l19"), Label).Text
        'txtsuptopay.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l20"), Label).Text
        ViewState("ImageTime") = CType(GVSupp.Rows(e.NewEditIndex).FindControl("LabelPhotos"), Label).Text.Trim
        Image3.ImageUrl = CType(GVSupp.Rows(e.NewEditIndex).FindControl("LabelPhotos"), Label).Text.Trim
        'txtCName.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("labelCN"), Label).Text
        txtPani.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l101"), Label).Text
        txtPan.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l100"), Label).Text
        txtEmail2.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l102"), Label).Text
        txtBankName.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l103"), Label).Text
        txtBranchArea.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l104"), Label).Text
        txtIFSC.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l107"), Label).Text
        txtAcNo.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l105"), Label).Text
        If CType(GVSupp.Rows(e.NewEditIndex).FindControl("l106"), Label).Text = "" Then
            ddlTypeAcct.SelectedValue = 0
        Else
            ddlTypeAcct.SelectedValue = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l106"), Label).Text
        End If
        'ddlState.SelectedValue = CType(GVSupp.Rows(e.NewEditIndex).FindControl("NlblStateID"), Label).Text
        'If CType(GVSupp.Rows(e.NewEditIndex).FindControl("stateid"), Label).Text = "" Then
        '    ddlStateFarm.SelectedValue = 0
        'Else
        ddlStateFarm.SelectedValue = CType(GVSupp.Rows(e.NewEditIndex).FindControl("NlblStateID"), Label).Text
        'End If

        txtSur.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("NlblS"), Label).Text
        txtGreen.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("NlblG"), Label).Text
        txtGrowerType.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("NlblGT"), Label).Text
        txtConPer2.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("NlblCP"), Label).Text
        txtDistrict.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("NlblD"), Label).Text
        txtVillage.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("NlblV"), Label).Text
        txtTaluk.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("NlblT"), Label).Text
        txtDistrict2.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("NlblD2"), Label).Text
        txtCountry2.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("NlblC"), Label).Text
        ViewState("Supp_Id") = CType(GVSupp.Rows(e.NewEditIndex).FindControl("IID"), HiddenField).Value
        btnAdd.Text = "UPDATE"
        SE.Supp_ID = ViewState("Supp_Id")
        SE.Supp_Name = TxtName.Text
        SE.Supp_Code = txtcode.Text
        'SE.Company_Name = txtCName.Text
        dt = SB.GetSupplierDetails(SE)
        GVSupp.DataSource = dt
        GVSupp.DataBind()
        e.Cancel = True
        GVSupp.Enabled = False
        btnView.Text = "BACK"
        btnView.Visible = True
        display()
        GVSupp.Enabled = False
        'Multilingual()
    End Sub
    'code by Anchala on 11-08-12
    'method for deleting
    Protected Sub GVSupp_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GVSupp.RowDeleting
        If (Session("BranchCode") = Session("ParentBranch")) Then
            ViewState("Supp_ID") = CType(GVSupp.Rows(e.RowIndex).Cells(1).FindControl("IID"), HiddenField).Value
            SE.Supp_ID = ViewState("Supp_ID")
            SB.DeleteRecord(SE.Supp_ID)
            lblmsg.Text = ValidationMessage(1028)
            'txtopeningBal.Text = Format(CDate(Session("FinStartDate")), "dd-MMM-yyyy")
            display()
            TxtName.Focus()
            GVSupp.PageIndex = ViewState("PageIndex")
        Else
            msginfo.Text = ValidationMessage(1029)
            lblmsg.Text = ValidationMessage(1014)
        End If

    End Sub
    'code by Anchala on 11-08-12
    'method for display 
    Sub display()
        SE.Supp_ID = 0
        SE.Supp_Name = TxtName.Text
        SE.Supp_Code = txtcode.Text
        'SE.Company_Name = txtCName.Text
        dt = SB.GetSupplierDetails(SE)
        If dt.Rows.Count <> 0 Then

            GVSupp.DataSource = dt
            GVSupp.DataBind()
            GVSupp.Visible = True
            GVSupp.Enabled = True
            For Each rows As GridViewRow In GVSupp.Rows
                'If CType(rows.FindControl("l21"), Label).Text = "01-Jan-1900" Then
                '    CType(rows.FindControl("l21"), Label).Text = ""
                'End If
                If CType(rows.FindControl("LabelEmp_Photo"), Image).ImageUrl = "" Then
                    CType(rows.FindControl("LabelEmp_Photo"), Image).ImageUrl = "~/Images/imageupload1.gif"
                End If
            Next
            'Multilingual()
        Else
            'Multilingual()
            lblmsg.Text = ValidationMessage(1014)
            msginfo.Text = ValidationMessage(1023)
            GVSupp.Visible = False
        End If
    End Sub
    Sub clear()
        'txtsuptopay.Text = ""
        'txtsuptorec.Text = ""
        txtAddress.Text = ""
        'txtcreditlimit.Text = ""
        txtcode.Text = ""
        TxtcntctP.Text = ""
        'txtcreditP.Text = ""
        TxtName.Text = ""
        'txtopeningBal.Text = ""
        txttin.Text = ""
        txtcst.Text = ""
        txtcity.Text = ""
        ddlState.SelectedValue = 0
        'Chkreg.Checked = False
        'txtpostalcode.Text = ""
        'txtcountry1.Text = ""
        txtcntct1.Text = ""
        txtcntct2.Text = ""
        txtfaxno.Text = ""
        txtemail.Text = ""
        'txtdlno.Text = ""
        txtPani.Text = ""
        txtAcNo.Text = ""
        txtBankName.Text = ""
        txtBranchArea.Text = ""
        txtEmail2.Text = ""
        txtcntct2.Text = ""
        'txtTypeOfAccount.Text = ""
        txtIFSC.Text = ""
        TxtName.Text = ""
        Image3.ImageUrl = "~\Images\imageupload.gif"
        txtSur.Text = ""
        txtGreen.Text = ""
        txtGrowerType.Text = ""
        txtConPer2.Text = ""
        txtDistrict.Text = ""
        txtVillage.Text = ""
        txtTaluk.Text = ""
        txtDistrict2.Text = ""
        'txtCountry2.Text = ""
        txtPan.Text = ""
    End Sub
    Protected Sub Page_Load1(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            'txtopeningBal.Text = Format(CDate(Session("FinStartDate")), "dd-MMM-yyyy")
            'Control_Text_Multilingual()
            txtCountry2.Text = Format("India")
            txtcountry1.Text = Format("India")
            ViewState("ImageTime") = ""
            TxtName.Focus()
        End If
        If Image3.ImageUrl = "" Then
            Image3.ImageUrl = "~\Images\imageupload.gif"
        End If
        Dim heading As String
        heading = Session("RptFrmTitleName")
        Me.Lblheading.Text = heading
    End Sub
    <System.Web.Services.WebMethod()> Public Sub AbandonSession()
        Dim i As Int16 = UserDetailsDB.UpdateUserlog()
        Response.Redirect("LogIn.aspx")
    End Sub

    Protected Sub GVSupp_Sorting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewSortEventArgs) Handles GVSupp.Sorting
        Dim sortingDirection As String = String.Empty
        If dir() = SortDirection.Ascending Then
            dir = SortDirection.Descending
            sortingDirection = "Desc"
        Else
            dir = SortDirection.Ascending
            sortingDirection = "Asc"
        End If
        SE.Supp_ID = 0
        SE.Supp_Name = TxtName.Text
        SE.Supp_Code = txtcode.Text
        dt = SB.GetSupplierDetails(SE)
        Dim sortedView As New DataView(dt)
        sortedView.Sort = Convert.ToString(e.SortExpression) & " " & sortingDirection
        GVSupp.DataSource = sortedView
        GVSupp.DataBind()
        GVSupp.Visible = True
        GVSupp.Enabled = True
        'Multilingual()
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
    Protected Sub Upload_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Upload.Click
        lblmsg.Text = ValidationMessage(1014)
        msginfo.Text = ValidationMessage(1014)
        If FileUpload1.FileName <> "" Then
            If FileUpload1.PostedFile.ContentLength <= 30000 Then
                Try
                    If ViewState("ImageTime") <> Nothing Then
                        'Dim Foto As String = Replace(ViewState("ImageTime"), "~/", "")
                        Dim Foto As String = Session("Path") + ViewState("ImageTime").ToString.Replace("~/", "")
                        If IO.File.Exists(Foto) Then
                            IO.File.Delete(Foto)
                        End If
                    End If
                    lblmsg.Text = ValidationMessage(1014)
                    msginfo.Text = ValidationMessage(1014)
                    path = "E" & txtcode.Text.Trim.ToString().Replace(" ", "") + TimeOfDay.ToString().Replace("/", "").Replace(":", "") & ".jpg"

                    If (FileUpload1.PostedFile.ContentType.ToLower() = "image/gif" Or FileUpload1.PostedFile.ContentType.ToLower() = "image/jpeg" Or FileUpload1.PostedFile.ContentType.ToLower() = "image/tiff" Or FileUpload1.PostedFile.ContentType.ToLower() = "image/pjpeg" Or FileUpload1.PostedFile.ContentType.ToLower() = "image/x-png" Or FileUpload1.PostedFile.ContentType.ToLower() = "image/jpg" Or FileUpload1.PostedFile.ContentType.ToLower() = "image/tif" Or FileUpload1.PostedFile.ContentType.ToLower() = "image/bmp") Then


                        'path = (Server.MapPath("Images/") + Convert.ToString(Guid.NewGuid()) + FileUpload1.FileName)
                        'FileUpload1.SaveAs(path)
                        Me.FileUpload1.SaveAs(Server.MapPath("~/Images/" & path))
                        path1 = "~/Images/" & path
                        ViewState("ImageTime") = "~/Images/" & path
                        txtPath.Text = path1
                        Me.Image3.ImageUrl = txtPath.Text
                    Else
                        msginfo.Text = "Photo format should be gif/jpeg/jpg/pjpeg/bmp/x-png/tif/tiff ."
                    End If
                Catch ex As Exception
                    lblmsg.Text = ValidationMessage(1014)
                    msginfo.Text = "Error while Uploading Image. Please refresh the page and try once again."
                End Try
            Else
                msginfo.Text = "Photo Size should be less than or equal to 30 KB."
                lblmsg.Text = ValidationMessage(1014)
            End If
        Else
            msginfo.Text = "Browse to upload the photo."
            lblmsg.Text = ValidationMessage(1014)
        End If
    End Sub
End Class
