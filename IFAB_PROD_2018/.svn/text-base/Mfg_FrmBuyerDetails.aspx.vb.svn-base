
Imports System.IO
Imports System.Collections.Generic
Imports System.Data
Imports System.Web.UI.WebControls.Button
Partial Class Mfg_FrmBuyerDetails
    Inherits BasePage
    Dim path, path1, str As String
    Dim alt As String
    Dim idd As Integer
    Dim SB As New Mfg_BLBuyerDetails
    Dim SD As New Mfg_DLBuyerDetails
    Dim SE As New Mfg_ELBuyerDetails
    Dim dt As New DataTable

    'code by Anchala on 11-08-12
    'method for insert and update
    Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdd.Click
        TxtName.Focus()

        If (Session("BranchCode") = Session("ParentBranch")) Then
            SE.Supp_Name = TxtName.Text
            SE.Supp_Code = txtcode.Text
            'If Chkreg.Checked = True Then
            'SE.Registered = "Y"
            'Else
            '    SE.Registered = "N"
            'End If
            SE.Introducer = txtintro.Text
            SE.ResidenceAdd = txtResi.Text
            SE.OfficeDist = txtDist.Text
            SE.ResidenceDist = txtDist1.Text
            SE.ResCity = txtCity1.Text
            SE.ResidenceState = ddlstat1.Text
            SE.ResCountry = txtcountry1.Text
            SE.OfficeCountry = txtcountry.Text
            SE.Tin = txttin.Text
            SE.CSTNo = txtcst.Text
            SE.Supp_Address = txtAddress.Text
            SE.City = txtcity.Text
            SE.ContactPerson2 = txtContctPerson2.Text
            'SE.PostalCode = txtpostalcode.Text
            SE.State = ddlState.SelectedValue
            SE.Country = txtcountry.Text
            'SE.DLNo = 0
            SE.Contact_Number1 = txtcntct1.Text
            SE.Contactno2 = txtcntct2.Text
            SE.Contact_Person = TxtcntctP.Text
            SE.FaxNO = txtfaxno.Text
            SE.Email = txtemail.Text
            If ViewState("ImageTime") = Nothing Then
                SE.Photos = ""
            Else
                SE.Photos = ViewState("ImageTime")
            End If
            'If txtPani.Text = Nothing Then
            '    SE.Pani = ""
            'Else
            '    SE.Pani = txtPani.Text
            'End If
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


            'If CheckBox1.Checked = True Then
            '    SE.DiscountLock = "Y"
            'Else
            '    SE.DiscountLock = "N"
            'End If
            'If txtDiscount.Text = "" Then
            '    SE.Discount = 0
            'Else
            '    SE.Discount = txtDiscount.Text
            'End If

            'SE.CreditBills = txtCreditBills.Text

            'If txtsuptorec.Text <> "" And txtsuptopay.Text <> "" Then
            '    If txtsuptorec.Text <> "0.00" And txtsuptopay.Text <> "0.00" Then
            '        msginfo.Text = ValidationMessage(1056)
            '        lblmsg.Text = ValidationMessage(1014)
            '        Exit Sub
            '    End If
            'End If
            AssignEntity()
            'If txtopeningBal.Text = "" Then
            'SE.OpBalanceDate = "1/1/1900"
        Else
            'SE.OpBalanceDate = CType(txtopeningBal.Text, Date)
        End If


        If btnAdd.Text = "ADD" Then
            SE.Supp_ID = 0
        Else
            SE.Supp_ID = ViewState("Supp_Id")
        End If

        SE.Supp_ID = ViewState("Supp_Id")
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



        Else
            msginfo.Text = ValidationMessage(1021)
            lblmsg.Text = ValidationMessage(1014)
        End If


    End Sub
    Sub AssignEntity()
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

        If txttin.Text = "" Then
            SE.Tin = 0
        Else
            SE.Tin = txttin.Text
        End If


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
        txtintro.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l17"), Label).Text
        txtResi.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l18"), Label).Text
        txtDist.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l19"), Label).Text
        txtDist1.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l20"), Label).Text
        txtCity1.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l21"), Label).Text
        txtcountry1.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l1002"), Label).Text
        txtcountry.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("officeCountry"), Label).Text
        If CType(GVSupp.Rows(e.NewEditIndex).FindControl("l1000"), Label).Text = "" Then
            ddlstat1.SelectedValue = 0
        Else
            ddlstat1.SelectedValue = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l1000"), Label).Text
        End If


        TxtName.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l1"), Label).Text

        txtcode.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("ll1"), Label).Text
        txttin.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l4"), Label).Text
        txtcst.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l5"), Label).Text
        txtAddress.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l6"), Label).Text
        txtcity.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l7"), Label).Text
        'txtpostalcode.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l8"), Label).Text
        ddlState.SelectedValue = CType(GVSupp.Rows(e.NewEditIndex).FindControl("stateid"), Label).Text
        txtcountry.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l10"), Label).Text
        TxtcntctP.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l12"), Label).Text
        txtcntct1.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l13"), Label).Text
        txtcntct2.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l14"), Label).Text
        txtfaxno.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l15"), Label).Text
        txtemail.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l16"), Label).Text
        txtContctPerson2.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("ContactPerson2"), Label).Text
        'txtcreditlimit.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l18"), Label).Text
        'txtsuptorec.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l19"), Label).Text
        'txtsuptopay.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l20"), Label).Text
        ViewState("ImageTime") = CType(GVSupp.Rows(e.NewEditIndex).FindControl("LabelPhotos"), Label).Text.Trim
        Image3.ImageUrl = CType(GVSupp.Rows(e.NewEditIndex).FindControl("LabelPhotos"), Label).Text.Trim
        'txtPani.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l101"), Label).Text
        txtPan.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l100"), Label).Text
        txtEmail2.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l102"), Label).Text
        txtBankName.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l103"), Label).Text
        txtBranchArea.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l104"), Label).Text
        txtIFSC.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l107"), Label).Text
        txtAcNo.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l105"), Label).Text



        ddlTypeAcct.SelectedValue = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l106"), Label).Text
        'txtDiscount.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l1000"), Label).Text
        'txtCreditBills.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l1002"), Label).Text
        'Dim a As String
        'a = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l1001"), Label).Text
        'If a = "Y" Then
        '    CheckBox1.Checked = True
        'Else
        '    CheckBox1.Checked = False
        'End If
        ''If txtsuptorec.Text = "0.00" Then
        ''    txtsuptorec.Text = ""
        ''End If
        ''If txtsuptopay.Text = "0.00" Then
        ''    txtsuptopay.Text = ""
        ''End If
        'txtopeningBal.Text = CType(GVSupp.Rows(e.NewEditIndex).FindControl("l21"), Label).Text
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
        msginfo.Text = ValidationMessage(1014)
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
                If CType(rows.FindControl("l21"), Label).Text = "01-Jan-1900" Then
                    CType(rows.FindControl("l21"), Label).Text = ""
                End If
                If CType(rows.FindControl("LabelEmp_Photo"), Image).ImageUrl = "" Then
                    CType(rows.FindControl("LabelEmp_Photo"), Image).ImageUrl = "~/Images/imageupload1.gif"
                End If
            Next
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
        'txtcountry.Text = ""
        txtcntct1.Text = ""
        txtcntct2.Text = ""
        txtfaxno.Text = ""
        txtDist.Text = ""
        txtemail.Text = ""
        'txtdlno.Text = ""
        'txtPani.Text = ""
        Image3.ImageUrl = "~\Images\imageupload.gif"
        'txtPani.Text = ""
        txtPan.Text = ""
        txtEmail2.Text = ""
        txtAcNo.Text = ""
        txtBankName.Text = ""
        txtBranchArea.Text = ""
        txtcntct2.Text = ""
        'txtDiscount.Text = ""
        txtIFSC.Text = ""
        'txtopeningBal.Text = ""
        'txtCreditBills.Text = ""
        'CheckBox1.Checked = False

    End Sub
    Protected Sub Page_Load1(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            'txtopeningBal.Text = Format(CDate(Session("FinStartDate")), "dd-MMM-yyyy")
            'Control_Text_Multilingual()
            txtcountry.Text = Format("India")
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
    ' ''Code Written for Multilingual By Ajit Kumar Singh on 12th Aug
    ' ''Retriving the text of controls based on Language
    'Sub Multilingual()
    '    Dim j As Integer
    '    Dim k As Integer
    '    Dim dtl As DataTable
    '    dtl = Session("Control_Text")
    '    Dim i As Integer = dtl.Rows.Count
    '    While (i <> 0)
    '        If dtl.Rows(i - 1).Item("ControlType") = "Label" Then
    '            Dim myLabel As Label = CType(Me.UpdatePanel1.FindControl(dtl.Rows(i - 1).Item("ControlId")), Label)
    '            myLabel.Text = dtl.Rows(i - 1).Item("Default_Text")
    '            i = i - 1
    '        ElseIf dtl.Rows(i - 1).Item("ControlType") = "Button" Then
    '            If dtl.Rows(i - 1).Item("ControlCommandName") = btnAdd.CommandName Then
    '                Dim myButton As Button = CType(Me.UpdatePanel1.FindControl(dtl.Rows(i - 1).Item("ControlId")), Button)
    '                myButton.Text = dtl.Rows(i - 1).Item("Default_Text")
    '                i = i - 1
    '            ElseIf dtl.Rows(i - 1).Item("ControlCommandName") = btnView.CommandName Then
    '                Dim myButton As Button = CType(Me.UpdatePanel1.FindControl(dtl.Rows(i - 1).Item("ControlId")), Button)
    '                myButton.Text = dtl.Rows(i - 1).Item("Default_Text")
    '                i = i - 1
    '            Else
    '                i = i - 1
    '            End If

    '        ElseIf dtl.Rows(i - 1).Item("ControlType") = "GridLabel" Then
    '            j = GVSupp.Columns.Count
    '            While (j <> 0)
    '                If GVSupp.Columns(j - 1).HeaderText = dtl.Rows(i - 1).Item("ControlCommandName") Then
    '                    GVSupp.Columns(j - 1).HeaderText = dtl.Rows(i - 1).Item("Default_Text")
    '                End If
    '                j = j - 1
    '            End While
    '            i = i - 1
    '        ElseIf dtl.Rows(i - 1).Item("ControlType") = "GridButton" Then
    '            k = GVSupp.Rows.Count
    '            If dtl.Rows(i - 1).Item("ControlCommandName") = "Acknowledge" Then
    '                While (k <> 0)
    '                    Dim lnkCanc As LinkButton = CType(GVSupp.Rows(k - 1).FindControl(dtl.Rows(i - 1).Item("ControlId")), LinkButton)
    '                    lnkCanc.Text = dtl.Rows(i - 1).Item("Default_Text")
    '                    k = k - 1
    '                End While
    '            ElseIf dtl.Rows(i - 1).Item("ControlCommandName") = "Edit" Then
    '                k = GVSupp.Rows.Count
    '                While (k <> 0)
    '                    Dim lnkCanc As LinkButton = CType(GVSupp.Rows(k - 1).FindControl(dtl.Rows(i - 1).Item("ControlId")), LinkButton)
    '                    lnkCanc.Text = dtl.Rows(i - 1).Item("Default_Text")
    '                    k = k - 1
    '                End While
    '            ElseIf dtl.Rows(i - 1).Item("ControlCommandName") = "Delete" Then
    '                k = GVSupp.Rows.Count
    '                While (k <> 0)
    '                    Dim lnkCanc As LinkButton = CType(GVSupp.Rows(k - 1).FindControl(dtl.Rows(i - 1).Item("ControlId")), LinkButton)
    '                    lnkCanc.Text = dtl.Rows(i - 1).Item("Default_Text")
    '                    k = k - 1
    '                End While
    '            End If
    '            i = i - 1
    '        ElseIf dtl.Rows(i - 1).Item("ControlType") = "CheckBox" Then
    '            Dim myCheckbox As CheckBox = CType(Me.UpdatePanel1.FindControl(dtl.Rows(i - 1).Item("ControlId")), CheckBox)
    '            myCheckbox.Text = dtl.Rows(i - 1).Item("Default_Text")
    '            i = i - 1
    '        ElseIf dtl.Rows(i - 1).Item("ControlType") = "RadioButtonList" Then
    '            Dim myRadiobutton As RadioButtonList = CType(Me.UpdatePanel1.FindControl(dtl.Rows(i - 1).Item("ControlId")), RadioButtonList)
    '            Dim a As Integer = myRadiobutton.Items.Count
    '            While (a <> 0)
    '                For Each li As ListItem In myRadiobutton.Items
    '                    If li.Value = dtl.Rows(i - 1).Item("ControlCommandName") Then
    '                        li.Text = dtl.Rows(i - 1).Item("Default_Text")
    '                    End If
    '                Next
    '                a = a - 1
    '            End While
    '            i = i - 1
    '        End If
    '    End While
    'End Sub
    'Public Sub Control_Text_Multilingual()
    '    Dim dtll As DataTable
    '    Dim FormName As String = Session("Code")
    '    Dim LanguageID As Integer
    '    If Session("LanguageID") = "" Then
    '        LanguageID = 1
    '    Else
    '        LanguageID = Session("LanguageID")
    '    End If
    '    If LanguageID <> 0 Then
    '        dtll = GlobalFunction.GetChangeLanguage(FormName, LanguageID)
    '        Session("Control_Text") = dtll
    '        Multilingual()
    '    End If
    'End Sub
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

    'Protected Sub CheckBox1_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBox1.CheckedChanged
    '    If CheckBox1.Checked = True Then
    '        txtDiscount.Enabled = False
    '    Else
    '        txtDiscount.Enabled = True
    '    End If
    'End Sub
End Class
