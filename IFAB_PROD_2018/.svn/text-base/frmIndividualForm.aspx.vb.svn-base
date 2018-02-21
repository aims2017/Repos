Partial Class frmIndividualForm
    Inherits BasePage
    'Dim open As New System.Windows.Forms.OpenFileDialog
    Dim indmaster As New IndividualFormMaster
    Dim individual As New BLIndividualFormMaster
    Dim GlobalFunction As New GlobalFunction
    Dim dt As New DataTable
    Dim path, path1, str As String
    Dim dat, nextage, a, tod As Integer
    Dim el As New ELEmpQualification
    Dim ELMed As New ElMedicalDetails
    Sub EntityAssign()
        indmaster.EmploymentType = "Employee"
        indmaster.EmpCategory = ddlempcategory.SelectedValue
        indmaster.EmpType = ddlEmpType.SelectedValue
        indmaster.Emp_Name = txtEmpName.Text
        indmaster.Emp_Code = txtEmpcode.Text
        indmaster.Emp_Address = txtAddress.Text
        indmaster.Country = txtCountry.Text
        indmaster.ContactNo = txtContactNo.Text
        indmaster.LandLineNo = txtLandlinNo.Text
        indmaster.Email = txtEmail.Text
        indmaster.PANNO = txtPanNo.Text
        indmaster.Qualification = txtqualification.Text
        indmaster.SalaryGrade = ddlgrade.selectedvalue
        indmaster.ESINo = txtESINo.Text
        indmaster.VDA = txtVDA.Text
        If txtDOB.Text = "" Then
            indmaster.DOB = "1/1/2999"
        Else
            indmaster.DOB = txtDOB.Text
        End If

        If txtDOJ.Text = "" Then
            indmaster.DOJ = "1/1/3000"
        Else
            indmaster.DOJ = txtDOJ.Text
        End If
        If txtDOL.Text = "" Then
            indmaster.DOL = "1/1/3100"
        Else
            indmaster.DOL = txtDOL.Text
        End If
        indmaster.Sex = ddlSex.SelectedItem.Text
        indmaster.Designation = ddldesignation.SelectedValue
        indmaster.dpt_Id = ddlDept.SelectedValue

        'If DDLDeptType.SelectedValue = "Select" Then
        '    indmaster.BranchTypeCode = "0"
        'Else
        indmaster.BranchTypeCode = DDLDeptType.SelectedValue
        'End If
        If Ddldpt.SelectedValue = "Select" Then
            indmaster.Branch_Code = "0"
        Else
            indmaster.Branch_Code = Ddldpt.SelectedValue
        End If
        'indmaster.BranchTypeCode = DDLDeptType.SelectedValue

        'indmaster.Branch_Code = Ddldpt.SelectedValue

        If txtSalary.Text = "" Then
            indmaster.Salary = 0
        Else
            indmaster.Salary = txtSalary.Text
        End If
        indmaster.AccountNo = txtAccountNo.Text
        If HidBankId.Value = "" Then
            indmaster.AgentTypeCode = 0
        Else
            indmaster.AgentTypeCode = HidBankId.Value
        End If
        indmaster.ServicePeriod = txtServicePeriod.Text
        indmaster.HRAEmpCode = HidHRAEmp.Value
        indmaster.FMEmpCode = HidFMEmpCode.Value
        indmaster.RMEmpCode = HidRMEmpCode.Value

        indmaster.NICNO = txtNicNo.Text
        indmaster.Corres_Address = txtCaddr.Text
        'If ChkHostel.Checked = True Then
        '    indmaster.Hostel = "Y"
        'Else
        '    indmaster.Hostel = "N"
        'End If
        'If ChkTransport.Checked = True Then
        '    indmaster.Transport = "Y"
        'Else
        '    indmaster.Transport = "N"
        'End If
        indmaster.FatherName = txtFname.Text
        indmaster.SpouseName = txtSpouseName.Text
        indmaster.MotherName = txtMothername.Text
        indmaster.NameInPassport = txtNameinpassport.Text
        indmaster.PlaceofIssue = txtPlaceofIssue.Text
        indmaster.PassportNo = txtPassportNo.Text
        indmaster.PFNo = txtPFNo.Text
        If txtPassportIssueDate.Text = "" Then
            indmaster.PassportIssueDate = "1/1/3000"
        Else
            indmaster.PassportIssueDate = txtPassportIssueDate.Text
        End If
        If txtVisaExpDate.Text = "" Then
            indmaster.VisaExpiryDate = "1/1/3000"
        Else
            indmaster.VisaExpiryDate = txtVisaExpDate.Text
        End If
        If txtVisaIssueDate.Text = "" Then
            indmaster.VisaIssueDate = "1/1/3000"
        Else
            indmaster.VisaIssueDate = txtVisaIssueDate.Text
        End If
        indmaster.VisaNo = txtVisaNo.Text
        If Me.txtFRRO.Text <> "" Then
            indmaster.FRROExpDate = Me.txtFRRO.Text
        Else
            indmaster.FRROExpDate = "1/1/3000"
        End If
        If txtExpiryDate.Text = "" Then
            indmaster.PassportExpiryDate = "1/1/3000"
        Else
            indmaster.PassportExpiryDate = txtExpiryDate.Text
        End If
        indmaster.VisaNo = txtVisaNo.Text

        If CheckBox1.Checked = True Then
            If HidEmpCode.Value = "" Then
                indmaster.Delegate1 = 0
            Else
                indmaster.Delegate1 = HidEmpCode.Value
            End If
            indmaster.Delegated = "Y"
        Else
            indmaster.Delegate1 = ""
            indmaster.Delegated = "N"
        End If
        If ViewState("ImageTime") = Nothing Then
            indmaster.Photos = ""
        Else
            indmaster.Photos = ViewState("ImageTime")
        End If
    End Sub
    Protected Sub Btnadd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Btnadd.Click
        Try
            txtEmpName.Focus()
            If (Session("BranchCode") = Session("ParentBranch")) Then
                a = GlobalFunction.UserPrivilage()
                If a = 1 Or a = 2 Or a = 6 Or a = 7 Then
                    lblmsg.Text = ""
                    lblgreen.Text = ""
                    If txtDOB.Text <> "" Then
                        tod = Year(Today.Date)
                        dat = Year(txtDOB.Text)
                        nextage = (tod - dat) + 1
                    Else
                        nextage = 100
                    End If
                    EntityAssign()

                    If txtDOJ.Text <> "" And indmaster.DOJ > Date.Today Then
                        lblgreen.Text = ""
                        lblmsg.Text = "DOJ should be less than today date."
                        txtDOJ.Focus()
                    ElseIf nextage < 18 Then
                        lblgreen.Text = ""
                        lblmsg.Text = "Date of Birth should be more than or equal to 18 years."
                        txtDOB.Focus()
                    Else
                        If Btnadd.Text = "ADD" Then
                            dt = individual.CheckDuplicate(indmaster)
                            If dt.Rows.Count > 0 Then
                                lblgreen.Text = ""
                                lblmsg.Text = "Duplicate Entry."
                                GridView1.Visible = True
                            Else
                                'If txtPassportIssueDate.Text <> "" Or txtExpiryDate.Text <> "" Then
                                If CDate(IIf(txtPassportIssueDate.Text = "", "1/1/1000", txtPassportIssueDate.Text)) >= CDate(IIf(txtExpiryDate.Text = "", "1/1/3000", txtExpiryDate.Text)) Then
                                    Me.lblgreen.Text = ""
                                    Me.lblmsg.Text = "Passport issue date cannot be greater than or equal to Passport expiry date."
                                    Exit Sub
                                End If
                                If CDate(IIf(txtVisaIssueDate.Text = "", "1/1/1000", txtVisaIssueDate.Text)) >= CDate(IIf(txtVisaExpDate.Text = "", "1/1/3000", txtVisaExpDate.Text)) Then
                                    Me.lblgreen.Text = ""
                                    Me.lblmsg.Text = "Visa issue date cannot be greater than or equal to Visa expiry date."
                                    Exit Sub
                                End If
                                If CDate(IIf(txtPassportIssueDate.Text = "", "1/1/1000", txtPassportIssueDate.Text)) >= CDate(IIf(txtVisaIssueDate.Text = "", "1/1/3000", txtVisaIssueDate.Text)) Then
                                    Me.lblgreen.Text = ""
                                    Me.lblmsg.Text = "Visa issue date cannot be smaller than or equal to Passport Issue Date."
                                    Exit Sub
                                End If
                                If CDate(IIf(txtVisaExpDate.Text = "", "1/1/1000", txtVisaExpDate.Text)) >= CDate(IIf(txtExpiryDate.Text = "", "1/1/3000", txtExpiryDate.Text)) Then
                                    Me.lblgreen.Text = ""
                                    Me.lblmsg.Text = "Visa Expiry date cannot be greater than or equal to Passport expiry date."
                                    Exit Sub
                                End If

                                If CDate(IIf(txtVisaIssueDate.Text = "", "1/1/1000", txtVisaIssueDate.Text)) >= CDate(IIf(txtExpiryDate.Text = "", "1/1/3000", txtExpiryDate.Text)) Then
                                    Me.lblgreen.Text = ""
                                    Me.lblmsg.Text = "Visa Issue date cannot be greater than or equal to Passport expiry date."
                                    Exit Sub
                                End If
                                'If txtDOJ.Text <> "" Then
                                '    If txtDOL.Text <> "" Then
                                If CDate(IIf(txtDOJ.Text = "", "1/1/1000", txtDOJ.Text)) > CDate(IIf(txtDOL.Text = "", "1/1/3000", txtDOL.Text)) Then
                                    lblmsg.Text = "DOJ cannot be greater than DOL."
                                    Exit Sub
                                End If
                                'If txtDOB.Text <> "" Then
                                If CDate(IIf(txtDOB.Text = "", "1/1/1000", txtDOB.Text)) > CDate(IIf(txtDOJ.Text = "", "1/1/3000", txtDOJ.Text)) Then
                                    lblmsg.Text = "DOB cannot be greater than DOJ."
                                    Exit Sub
                                End If
                                If CDate(IIf(txtDOB.Text = "", "1/1/1000", txtDOB.Text)) > CDate(IIf(txtDOL.Text = "", "1/1/3000", txtDOL.Text)) Then
                                    lblmsg.Text = "DOB cannot be greater than DOL."
                                    Exit Sub
                                End If

Insert:                         individual.InsertRecord(indmaster)
                                If GlobalFunction.ErrorMsg <> "Error" Then
                                    clear()
                                    Btnadd.Text = "ADD"
                                    BtnView.Text = "VIEW"
                                    lblmsg.Text = ""
                                    ViewState("ImageTime") = ""
                                    lblgreen.Text = "Data Saved Successfully."
                                    ViewState("PageIndex") = 0
                                    GridView1.PageIndex = 0
                                    DispGrid()
                                    GridView1.Visible = True

                                Else
                                    lblgreen.Text = ""
                                    lblmsg.Text = "Error while processing data, Please try again."
                                End If
                            End If
                        ElseIf Btnadd.Text = "UPDATE" Then
                            'If txtPassportIssueDate.Text <> "" Or txtExpiryDate.Text <> "" Then
                            If CDate(IIf(txtPassportIssueDate.Text = "", "1/1/1000", txtPassportIssueDate.Text)) >= CDate(IIf(txtExpiryDate.Text = "", "1/1/3000", txtExpiryDate.Text)) Then
                                Me.lblgreen.Text = ""
                                Me.lblmsg.Text = "Passport issue date cannot be greater than or equal to Passport expiry date."
                                Exit Sub
                            End If
                            If CDate(IIf(txtVisaIssueDate.Text = "", "1/1/1000", txtVisaIssueDate.Text)) >= CDate(IIf(txtVisaExpDate.Text = "", "1/1/3000", txtVisaExpDate.Text)) Then
                                Me.lblgreen.Text = ""
                                Me.lblmsg.Text = "Visa issue date cannot be greater than or equal to Visa expiry date."
                                Exit Sub
                            End If
                            If CDate(IIf(txtPassportIssueDate.Text = "", "1/1/1000", txtPassportIssueDate.Text)) >= CDate(IIf(txtVisaIssueDate.Text = "", "1/1/3000", txtVisaIssueDate.Text)) Then
                                Me.lblgreen.Text = ""
                                Me.lblmsg.Text = "Visa issue date cannot be smaller than or equal to Passport Issue Date."
                                Exit Sub
                            End If
                            If CDate(IIf(txtVisaExpDate.Text = "", "1/1/1000", txtVisaExpDate.Text)) >= CDate(IIf(txtExpiryDate.Text = "", "1/1/3000", txtExpiryDate.Text)) Then
                                Me.lblgreen.Text = ""
                                Me.lblmsg.Text = "Visa Expiry date cannot be greater than or equal to Passport expiry date."
                                Exit Sub
                            End If
                            If CDate(IIf(txtVisaIssueDate.Text = "", "1/1/1000", txtVisaIssueDate.Text)) >= CDate(IIf(txtExpiryDate.Text = "", "1/1/3000", txtExpiryDate.Text)) Then
                                Me.lblgreen.Text = ""
                                Me.lblmsg.Text = "Visa Issue date cannot be greater than or equal to Passport expiry date."
                                Exit Sub
                            End If
                            'If txtDOJ.Text <> "" Then
                            '    If txtDOL.Text <> "" Then
                            If CDate(IIf(txtDOJ.Text = "", "1/1/1000", txtDOJ.Text)) > CDate(IIf(txtDOL.Text = "", "1/1/3000", txtDOL.Text)) Then
                                lblmsg.Text = "DOJ cannot be greater than DOL."
                                Exit Sub
                            End If
                            'If txtDOB.Text <> "" Then
                            If CDate(IIf(txtDOB.Text = "", "1/1/1000", txtDOB.Text)) > CDate(IIf(txtDOJ.Text = "", "1/1/3000", txtDOJ.Text)) Then
                                lblmsg.Text = "DOB cannot be greater than DOJ."
                                Exit Sub
                            End If
                            If CDate(IIf(txtDOB.Text = "", "1/1/1000", txtDOB.Text)) > CDate(IIf(txtDOL.Text = "", "1/1/3000", txtDOL.Text)) Then
                                lblmsg.Text = "DOB cannot be greater than DOL."
                                Exit Sub
                            End If
Update:                     indmaster.Emp_Id = ViewState("Emp_Id")
                            individual.UpdateRecord(indmaster)
                            If GlobalFunction.ErrorMsg <> "Error" Then
                                clear()
                                Btnadd.Text = "ADD"
                                BtnView.Text = "VIEW"
                                lblmsg.Text = ""
                                ViewState("ImageTime") = ""
                                lblgreen.Text = "Data Updated Successfully."
                                txtEmpcode.Enabled = True
                                GridView1.PageIndex = ViewState("PageIndex")
                                DispGrid()
                                GridView1.Visible = True
                            Else
                                lblgreen.Text = ""
                                lblmsg.Text = "Error while processing data, Please try again."
                            End If
                        End If
                    End If
                Else
                    lblmsg.Text = "You do not have permission, Cannot add data."
                    lblgreen.Text = ""
                End If
            Else
                lblmsg.Text = "You do not belong to this branch, Cannot add/update data."
                lblgreen.Text = ""
            End If
        Catch ex As Exception
            lblmsg.Text = "Enter Correct data."
            lblgreen.Text = ""
        End Try
    End Sub
    Protected Sub GridView1_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles GridView1.RowEditing
        'If (Session("BranchCode") = Session("ParentBranch")) Then
        a = GlobalFunction.UserPrivilage()
        If a = 1 Or a = 2 Or a = 6 Or a = 7 Then
            lblmsg.Text = ""
            lblgreen.Text = ""
            BtnView.Text = "BACK"
            Btnadd.Text = "UPDATE"
            txtEmpcode.Enabled = False

            ViewState("Emp_Id") = CType(GridView1.Rows(e.NewEditIndex).FindControl("LabelEmp_Id"), HiddenField).Value
            ddlempcategory.SelectedValue = CType(GridView1.Rows(e.NewEditIndex).FindControl("lblEmployeeCategory"), Label).Text
            ddlEmpType.SelectedValue = CType(GridView1.Rows(e.NewEditIndex).FindControl("lblEmployeeType"), Label).Text
            'RBEmpType.SelectedValue = CType(GridView1.Rows(e.NewEditIndex).FindControl("LabelEmployeeType"), Label).Text
            txtEmpName.Text = CType(GridView1.Rows(e.NewEditIndex).FindControl("LabelEmp_Name"), Label).Text.Trim
            txtEmpcode.Text = CType(GridView1.Rows(e.NewEditIndex).FindControl("LabelEmp_Code"), Label).Text
            txtAddress.Text = CType(GridView1.Rows(e.NewEditIndex).FindControl("LabelEmp_Address"), Label).Text
            txtCountry.Text = CType(GridView1.Rows(e.NewEditIndex).FindControl("LabelCountry"), Label).Text
            txtContactNo.Text = CType(GridView1.Rows(e.NewEditIndex).FindControl("LabelContactNo"), Label).Text
            txtLandlinNo.Text = CType(GridView1.Rows(e.NewEditIndex).FindControl("lblLandlinNo"), Label).Text
            txtEmail.Text = CType(GridView1.Rows(e.NewEditIndex).FindControl("LabelEmail"), Label).Text
            txtDOB.Text = CType(GridView1.Rows(e.NewEditIndex).FindControl("LabelDOB"), Label).Text
            txtDOJ.Text = CType(GridView1.Rows(e.NewEditIndex).FindControl("LabelDOJ"), Label).Text
            txtDOL.Text = CType(GridView1.Rows(e.NewEditIndex).FindControl("LabelDOL"), Label).Text
            txtPanNo.Text = CType(GridView1.Rows(e.NewEditIndex).FindControl("lblPanNo"), Label).Text
            txtqualification.Text = CType(GridView1.Rows(e.NewEditIndex).FindControl("lblQualification"), Label).Text
            ddlSex.SelectedValue = CType(GridView1.Rows(e.NewEditIndex).FindControl("LabelGender"), Label).Text
            Try
                If CType(GridView1.Rows(e.NewEditIndex).FindControl("LabelDeptId"), Label).Text = "" Then
                    ddlDept.SelectedValue = 0
                Else
                    ddlDept.SelectedValue = CType(GridView1.Rows(e.NewEditIndex).FindControl("LabelDeptId"), Label).Text
                End If
            Catch ex As Exception

            End Try
            DDLDeptType.SelectedValue = CType(GridView1.Rows(e.NewEditIndex).FindControl("LabelBranchType_ID"), Label).Text
            Ddldpt.Items.Clear()
            Ddldpt.DataSourceID = "objDept"
            Ddldpt.DataBind()
            If CType(GridView1.Rows(e.NewEditIndex).FindControl("LabelBranchMaster_ID"), Label).Text <> "0" Then
                Ddldpt.SelectedValue = CType(GridView1.Rows(e.NewEditIndex).FindControl("LabelBranchMaster_ID"), Label).Text
            End If
            ddldesignation.Items.Clear()
            ddldesignation.DataSourceID = "ObjDesignation"
            ddldesignation.DataBind()
            Dim de As String = CType(GridView1.Rows(e.NewEditIndex).FindControl("LabelDesignationCode"), Label).Text
            ddldesignation.SelectedValue = CType(GridView1.Rows(e.NewEditIndex).FindControl("LabelDesignationCode"), Label).Text
            txtSalary.Text = CType(GridView1.Rows(e.NewEditIndex).FindControl("LabelSalary"), Label).Text
            txtAccountNo.Text = CType(GridView1.Rows(e.NewEditIndex).FindControl("LabelAccountNo"), Label).Text
            txtAcctBranch.Text = CType(GridView1.Rows(e.NewEditIndex).FindControl("LabelBank_Name"), Label).Text
            HidBankId.Value = CType(GridView1.Rows(e.NewEditIndex).FindControl("LabelAgentID"), Label).Text
            txtServicePeriod.Text = CType(GridView1.Rows(e.NewEditIndex).FindControl("lableServicePeriod"), Label).Text
            If CType(GridView1.Rows(e.NewEditIndex).FindControl("lbldelegated"), Label).Text = "Y" Then
                CheckBox1.Checked = True
                txtDelegated.Enabled = True
                HidEmpCode.Value = CType(GridView1.Rows(e.NewEditIndex).FindControl("LabelDelegate"), Label).Text
                txtDelegated.Text = CType(GridView1.Rows(e.NewEditIndex).FindControl("LabelDelegateName"), Label).Text
            End If
            HidHRAEmp.Value = CType(GridView1.Rows(e.NewEditIndex).FindControl("LabelHRAEmpCode"), Label).Text
            txtHRAEmp.Text = CType(GridView1.Rows(e.NewEditIndex).FindControl("LabelHRAEmpName"), Label).Text
            HidFMEmpCode.Value = CType(GridView1.Rows(e.NewEditIndex).FindControl("LabelFMEmpCode"), Label).Text
            txtFMEmpCode.Text = CType(GridView1.Rows(e.NewEditIndex).FindControl("LabelFMEmpName"), Label).Text
            HidRMEmpCode.Value = CType(GridView1.Rows(e.NewEditIndex).FindControl("LabelRMEmpCode"), Label).Text
            txtRMEmpCode.Text = CType(GridView1.Rows(e.NewEditIndex).FindControl("LabelRMEEmpName"), Label).Text
            ViewState("ImageTime") = CType(GridView1.Rows(e.NewEditIndex).FindControl("LabelPhotos"), Label).Text.Trim
            Image2.ImageUrl = CType(GridView1.Rows(e.NewEditIndex).FindControl("LabelPhotos"), Label).Text.Trim

            txtNicNo.Text = CType(GridView1.Rows(e.NewEditIndex).FindControl("NICNO"), Label).Text
            txtCaddr.Text = CType(GridView1.Rows(e.NewEditIndex).FindControl("Corres_Address"), Label).Text
            'If CType(GridView1.Rows(e.NewEditIndex).FindControl("Hostel"), Label).Text = "Y" Then
            '    ChkHostel.Checked = True
            'Else
            '    ChkHostel.Checked = False
            'End If
            'If CType(GridView1.Rows(e.NewEditIndex).FindControl("Transport"), Label).Text = "Y" Then
            '    ChkTransport.Checked = True
            'Else
            '    ChkTransport.Checked = False
            'End If
            txtFname.Text = CType(GridView1.Rows(e.NewEditIndex).FindControl("FatherName"), Label).Text
            txtMothername.Text = CType(GridView1.Rows(e.NewEditIndex).FindControl("MotherName"), Label).Text
            txtSpouseName.Text = CType(GridView1.Rows(e.NewEditIndex).FindControl("SpouseName"), Label).Text
            txtNameinpassport.Text = CType(GridView1.Rows(e.NewEditIndex).FindControl("NameInPassport"), Label).Text
            txtPlaceofIssue.Text = CType(GridView1.Rows(e.NewEditIndex).FindControl("PlaceofIssue"), Label).Text
            txtPassportNo.Text = CType(GridView1.Rows(e.NewEditIndex).FindControl("PassportNo"), Label).Text
            txtExpiryDate.Text = CType(GridView1.Rows(e.NewEditIndex).FindControl("PassportExpiryDate"), Label).Text
            txtPassportIssueDate.Text = CType(GridView1.Rows(e.NewEditIndex).FindControl("PassportIssueDate"), Label).Text
            txtVisaIssueDate.Text = CType(GridView1.Rows(e.NewEditIndex).FindControl("VisaIssueDate"), Label).Text
            txtVisaExpDate.Text = CType(GridView1.Rows(e.NewEditIndex).FindControl("VisaExpiryDate"), Label).Text
            txtVisaNo.Text = CType(GridView1.Rows(e.NewEditIndex).FindControl("VisaNo"), Label).Text
            txtPFNo.Text = CType(GridView1.Rows(e.NewEditIndex).FindControl("PFNo"), Label).Text
            txtFRRO.Text = CType(GridView1.Rows(e.NewEditIndex).FindControl("FRROExpDate"), Label).Text
            If ddlGrade.SelectedValue = 0 Then

            End If
            ddlGrade.SelectedValue = CType(GridView1.Rows(e.NewEditIndex).FindControl("lblGrade"), Label).Text
            txtESINo.Text = CType(GridView1.Rows(e.NewEditIndex).FindControl("lblVDA"), Label).Text
            txtVDA.Text = CType(GridView1.Rows(e.NewEditIndex).FindControl("lblESINo"), Label).Text
            indmaster.Emp_Id = ViewState("Emp_Id")
            indmaster.Designation = "0"
            indmaster.Emp_Name = 0
            indmaster.EmpCode = 0
            indmaster.EmpCategory = ddlempcategory.SelectedValue
            indmaster.EmploymentType = ddlEmpType.SelectedValue
            indmaster.BranchTypeCode = 0
            indmaster.PassportNo = 0
            indmaster.ContactNo = 0
            indmaster.LandLineNo = 0
            indmaster.Email = 0
            indmaster.Qualification = 0
            indmaster.Sex = ddlSex.SelectedValue
            indmaster.Country = 0
            indmaster.DOB = "1/1/2999"
            indmaster.DOL = "1/1/3100"
            indmaster.DOJ = "1/1/3000"
            indmaster.DeptID = ddlDept.SelectedValue
            indmaster.NICNO = txtNicNo.Text
            dt = individual.GetIndividualFormMaster(indmaster)
            GridView1.DataSource = dt
            GridView1.DataBind()

            For Each rows As GridViewRow In GridView1.Rows
                If CType(rows.FindControl("LabelDOB"), Label).Text = "01-Jan-2999" Then
                    CType(rows.FindControl("LabelDOB"), Label).Text = ""
                End If
                If CType(rows.FindControl("LabelDOJ"), Label).Text = "01-Jan-3000" Then
                    CType(rows.FindControl("LabelDOJ"), Label).Text = ""
                End If
                If CType(rows.FindControl("LabelDOL"), Label).Text = "01-Jan-3100" Then
                    CType(rows.FindControl("LabelDOL"), Label).Text = ""
                End If
            Next
            GridView1.Enabled = False
            GridView1.Visible = True
        Else
            lblmsg.Text = "You do not have permission, Cannot edit data."
            lblgreen.Text = ""
        End If
        'Else
        'lblmsg.Text = "You do not belong to this branch, Cannot edit data."
        'lblgreen.Text = ""
        'End If
    End Sub
    Sub clear()
        txtEmpName.Text = ""
        txtEmpcode.Text = ""
        txtAddress.Text = ""
        txtCountry.Text = ""
        txtContactNo.Text = ""
        txtLandlinNo.Text = ""
        txtEmail.Text = ""
        txtDOB.Text = ""
        txtDOJ.Text = ""
        txtDOL.Text = ""
        txtAccountNo.Text = ""
        txtSalary.Text = ""
        txtAcctBranch.Text = ""
        lblmsg.Text = ""
        txtPath.Text = ""
        txtDelegated.Text = ""
        txtServicePeriod.Text = ""
        txtPanNo.Text = ""
        CheckBox1.Checked = False
        Image2.ImageUrl = "~\Images\imageupload.gif"
        CheckBox1.Checked = False
        txtDelegated.Enabled = False
        HidBankId.Value = 0
        HidEmpCode.Value = 0
        txtHRAEmp.Text = ""
        HidHRAEmp.Value = 0
        txtFMEmpCode.Text = ""
        HidFMEmpCode.Value = 0
        txtRMEmpCode.Text = ""
        HidRMEmpCode.Value = 0
        txtqualification.Text = ""
        'ViewState("ImageTime") = ""
        txtNicNo.Text = ""
        txtCaddr.Text = ""
        'ChkHostel.Checked = False
        'ChkTransport.Checked = False
        txtFname.Text = ""
        txtSpouseName.Text = ""
        txtNameinpassport.Text = ""
        txtPlaceofIssue.Text = ""
        txtPassportNo.Text = ""
        txtExpiryDate.Text = ""
        txtPassportIssueDate.Text = ""
        txtVisaIssueDate.Text = ""
        txtVisaExpDate.Text = ""
        txtVisaNo.Text = ""
        txtFRRO.Text = ""
        txtMothername.Text = ""
        txtPFNo.Text = ""
        txtCountry.Text = ""
        txtESINo.Text = ""
        txtVDA.Text = ""
    End Sub
    <System.Web.Services.WebMethod()> _
    Public Sub AbandonSession()
        Dim i As Int16 = UserDetailsDB.UpdateUserlog()
        Response.Redirect("LogIn.aspx")
    End Sub
    Protected Sub GridView1_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridView1.RowDeleting
        If (Session("BranchCode") = Session("ParentBranch")) Then
            a = GlobalFunction.UserPrivilage()
            If a = 1 Or a = 2 Or a = 6 Or a = 7 Then
                Dim Photo As String = Session("Path") + CType(GridView1.Rows(e.RowIndex).FindControl("LabelEmp_Photo"), Image).ImageUrl.Replace("~/", "")
                If IO.File.Exists(Photo) Then
                    IO.File.Delete(Photo)
                End If
                individual.Delete(CType(GridView1.Rows(e.RowIndex).FindControl("LabelEmp_Id"), HiddenField).Value)
                GridView1.PageIndex = ViewState("PageIndex")
                DispGrid()
                lblmsg.Text = ""
                lblgreen.Text = "Data Deleted Successfully."
                txtEmpName.Focus()
            Else
                lblmsg.Text = "You do not have permission, Cannot delete data."
                lblgreen.Text = ""
            End If
        Else
            lblmsg.Text = "You do not belong to this branch, Cannot delete data."
            lblgreen.Text = ""
        End If

    End Sub
    Protected Sub BtnView_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnView.Click
        lblmsg.Text = ""
        lblgreen.Text = ""
        If BtnView.Text = "BACK" Then
            lblmsg.Text = ""
            lblgreen.Text = ""
            Btnadd.Text = "ADD"
            BtnView.Text = "VIEW"
            clear()
            GridView1.PageIndex = ViewState("PageIndex")
            DispGrid()
            txtEmpcode.Enabled = True
        Else
            ViewState("PageIndex") = 0
            GridView1.PageIndex = 0
            DispGrid()
        End If
    End Sub
    Sub DispGrid()

        If txtEmpName.Text = "" Then
            indmaster.Emp_Name = 0
        Else
            indmaster.Emp_Name = txtEmpName.Text
        End If
        If txtEmpcode.Text = "" Then
            indmaster.EmpCode = "*"
        Else
            indmaster.EmpCode = txtEmpcode.Text
        End If
        If ddldesignation.SelectedValue = "" Then
            indmaster.Designation = 0
        Else
            indmaster.Designation = ddldesignation.SelectedValue
        End If
        If DDLDeptType.SelectedValue = "Select" Then
            indmaster.BranchTypeCode = "0"
        Else
            indmaster.BranchTypeCode = DDLDeptType.SelectedValue
        End If
        indmaster.Designation = ddldesignation.SelectedValue
        indmaster.Emp_Id = 0
        indmaster.EmpCategory = ddlempcategory.SelectedValue
        indmaster.EmploymentType = ddlEmpType.SelectedValue
        indmaster.NICNO = txtNicNo.Text

        If txtDOB.Text = "" Then
            indmaster.DOB = "1/1/2999"
        Else
            indmaster.DOB = txtDOB.Text
        End If
        If txtDOJ.Text = "" Then
            indmaster.DOJ = "1/1/3000"
        Else
            indmaster.DOJ = txtDOJ.Text
        End If
        indmaster.DeptID = ddlDept.SelectedValue
        If txtContactNo.Text = "" Then
            indmaster.ContactNo = 0
        Else
            indmaster.ContactNo = txtContactNo.Text
        End If
        If txtLandlinNo.Text = "" Then
            indmaster.LandLineNo = 0
        Else
            indmaster.ContactNo = txtContactNo.Text
        End If
        If txtEmail.Text = "" Then
            indmaster.Email = 0
        Else
            indmaster.Email = txtEmail.Text
        End If
        If txtqualification.Text = "" Then
            indmaster.Qualification = 0
        Else
            indmaster.Qualification = txtqualification.Text
        End If

        If ddlSex.SelectedValue = "Select" Then
            indmaster.Sex = "0"
        Else
            indmaster.Sex = ddlSex.SelectedValue
        End If
        If txtCountry.Text = "" Then
            indmaster.Country = 0
        Else
            indmaster.Country = txtCountry.Text
        End If
        If txtDOL.Text = "" Then
            indmaster.DOL = "1/1/3100"
        Else
            indmaster.DOL = txtDOL.Text
        End If
        If txtPassportNo.Text = "" Then
            indmaster.PassportNo = 0
        Else
            indmaster.PassportNo = txtPassportNo.Text
        End If

        dt = individual.GetIndividualFormMaster(indmaster)
        If dt.Rows.Count > 0 Then
            GridView1.DataSource = dt
            GridView1.DataBind()
            GridView1.Enabled = True
            GridView1.Visible = True
            For Each rows As GridViewRow In GridView1.Rows
                If CType(rows.FindControl("LabelDOB"), Label).Text = "01-Jan-2999" Then
                    CType(rows.FindControl("LabelDOB"), Label).Text = ""
                End If
                If CType(rows.FindControl("LabelDOJ"), Label).Text = "01-Jan-3000" Then
                    CType(rows.FindControl("LabelDOJ"), Label).Text = ""
                End If
                If CType(rows.FindControl("LabelDOL"), Label).Text = "01-Jan-3100" Then
                    CType(rows.FindControl("LabelDOL"), Label).Text = ""
                End If
            Next
            'LinkButton.Focus()
        Else
            lblgreen.Text = ""
            lblmsg.Text = "No records to display"
            GridView1.Visible = False
        End If
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            'txtDOJ.Text = Format(Today, "dd-MMM-yyyy")
            'txtEmpName.Focus()
            'TabContainer1.Focus()
            ViewState("ImageTime") = ""
            'T1.Focus()
        End If
        'Visible = "True"
        If Image2.ImageUrl = "" Then
            Image2.ImageUrl = "~\Images\imageupload.gif"
        End If
    End Sub
    Protected Sub Upload_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Upload.Click
        '25-11-2010 Kusum.C.Akki upload image to image after browsing the image
        lblmsg.Text = ""
        lblgreen.Text = ""
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
                    lblmsg.Text = ""
                    lblgreen.Text = ""
                    path = "E" & txtEmpcode.Text.Trim.ToString().Replace(" ", "") + TimeOfDay.ToString().Replace("/", "").Replace(":", "") & ".jpg"
                    If (FileUpload1.PostedFile.ContentType.ToLower() = "image/gif" Or FileUpload1.PostedFile.ContentType.ToLower() = "image/jpeg" Or FileUpload1.PostedFile.ContentType.ToLower() = "image/tiff" Or FileUpload1.PostedFile.ContentType.ToLower() = "image/pjpeg" Or FileUpload1.PostedFile.ContentType.ToLower() = "image/x-png" Or FileUpload1.PostedFile.ContentType.ToLower() = "image/jpg" Or FileUpload1.PostedFile.ContentType.ToLower() = "image/tif" Or FileUpload1.PostedFile.ContentType.ToLower() = "image/bmp") Then


                        'path = (Server.MapPath("Images/") + Convert.ToString(Guid.NewGuid()) + FileUpload1.FileName)
                        'FileUpload1.SaveAs(path)

                        Me.FileUpload1.SaveAs(Server.MapPath("~/Images/" & path))
                        path1 = "~/Images/" & path
                        ViewState("ImageTime") = "~/Images/" & path
                        txtPath.Text = path1
                        Me.Image2.ImageUrl = txtPath.Text
                    Else
                        lblmsg.Text = "Photo format should be gif/jpeg/jpg/pjpeg/bmp/x-png/tif/tiff ."
                    End If
                Catch ex As Exception
                    lblgreen.Text = ""
                    lblmsg.Text = "Error while Uploading Image. Please refresh the page and try once again."
                End Try
            Else
                lblmsg.Text = "Photo Size should be less than or equal to 30 KB."
                lblgreen.Text = ""
            End If
        Else
            lblmsg.Text = "Browse to upload the photo."
            lblgreen.Text = ""
        End If
    End Sub
    Protected Sub GridView1_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridView1.PageIndexChanging
        lblmsg.Text = ""
        lblgreen.Text = ""
        GridView1.PageIndex = e.NewPageIndex
        ViewState("PageIndex") = GridView1.PageIndex
        DispGrid()
    End Sub
    Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearch.Click
        If txtEmpName.Text <> "" Or txtEmpcode.Text <> "" Or ddlSex.SelectedValue <> "Select" Or ddldesignation.SelectedValue <> "Select" Or DDLDeptType.SelectedValue <> "Select" Then
            ViewState("Search") = "Search"
            Search()
            Dim DL As New DLIndividualFormMaster
            dt = DL.GetSearchDetails(indmaster)
            If dt.Rows.Count = 0 Then
                lblgreen.Text = ""
                lblmsg.Text = "No search results found for the given data."
                txtEmpName.Focus()
                GridView1.Visible = False
            Else
                lblgreen.Text = ""
                lblmsg.Text = ""
                GridView1.DataSource = dt
                GridView1.DataBind()
                For Each rows As GridViewRow In GridView1.Rows
                    If CType(rows.FindControl("LabelDOB"), Label).Text = "01-Jan-2999" Then
                        CType(rows.FindControl("LabelDOB"), Label).Text = ""
                    ElseIf CType(rows.FindControl("LabelDOJ"), Label).Text = "01-Jan-3000" Then
                        CType(rows.FindControl("LabelDOJ"), Label).Text = ""
                    ElseIf CType(rows.FindControl("LabelDOL"), Label).Text = "01-Jan-3100" Then
                        CType(rows.FindControl("LabelDOL"), Label).Text = ""
                    End If
                Next
                GridView1.Visible = True
            End If
        Else
            lblmsg.Text = "Fill any one Field for search"
            txtEmpName.Focus()
            lblgreen.Text = ""
        End If
        'Else
        'lblmsg.Text = "No Read Permission!"
        'End If
    End Sub
    Sub Search()
        If txtEmpName.Text <> "" Then
            indmaster.Emp_Name = txtEmpName.Text
        End If
        If txtEmpcode.Text <> "" Then
            indmaster.EmpCode = txtEmpcode.Text
        End If
        If ddlSex.SelectedValue <> "Select" Then
            indmaster.Sex = ddlSex.SelectedValue
        Else
            indmaster.Sex = "Select"
        End If
        If ddldesignation.Text <> "Select" Then
            indmaster.Designation = ddldesignation.Text
        Else
            indmaster.Designation = "Select"
        End If
        If DDLDeptType.SelectedValue <> "Select" Then
            indmaster.BranchTypeCode = DDLDeptType.SelectedValue
        Else
            indmaster.BranchTypeCode = "Select"
        End If
        If txtAddress.Text <> "" Then
            indmaster.Emp_Address = txtAddress.Text
        End If
        If txtDOB.Text <> "" Then
            indmaster.DOB = txtDOB.Text
        End If
        If txtDOJ.Text <> "" Then
            indmaster.DOJ = txtDOJ.Text
        End If
        If txtAccountNo.Text <> "" Then
            indmaster.AccountNo = txtAccountNo.Text
        End If
    End Sub

    Protected Sub DDLDeptType_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDLDeptType.TextChanged
        DDLDeptType.Focus()
    End Sub

    Protected Sub ddldesignation_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddldesignation.TextChanged
        ddldesignation.Focus()
    End Sub

    Protected Sub Ddldpt_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Ddldpt.SelectedIndexChanged
        Ddldpt.Focus()
    End Sub

    Protected Sub Ddldpt_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Ddldpt.TextChanged
        Ddldpt.Focus()
    End Sub

    Protected Sub ddlSex_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlSex.TextChanged
        ddlSex.Focus()
    End Sub

    Protected Sub CheckBox1_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBox1.CheckedChanged
        If CheckBox1.Checked = True Then
            txtDelegated.Enabled = True
            txtDelegated.Focus()
        Else
            txtDelegated.Enabled = False
            txtNameinpassport.Focus()
            txtDelegated.Text = ""
            HidEmpCode.Value = 0
        End If
    End Sub
    'Qualification form by kusum on 25-Mar-2013

    Protected Sub btnQualificationAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnQualificationAdd.Click
        Try
            If (Session("BranchCode") = Session("ParentBranch")) Then
                Dim DL As New DLEmpQualification
                If btnQualificationAdd.Text = "ADD" Then
                    el.EmployeeName = DDLEmployeeName.SelectedValue
                    el.PKID = 0
                    el.Qualification = txtQualificationf.Text
                    el.QualificationType = DDLQualificationType.Text
                    el.Remarks = txtQualificationRemarks.Text

                    el.Year = ddlYear.SelectedItem.Text

                    If DL.InsertQualification(el) > 0 Then
                        Display()
                        lblQRed.Text = ""
                        lblQGreen.Text = "Data added Successfully."
                        QClear()
                        Dim date1 As String
                        date1 = Session("CurrentYear")
                        Dim dt As DataTable
                        dt = QualificationDB.GetYear(date1)
                        Dim value As Integer = dt.Rows(0).Item("LookUpAutoID")
                        ddlYear.SelectedValue = value
                    Else
                        lblQRed.Text = "Enter correct data."
                        lblQGreen.Text = ""
                    End If
                Else
                    el.EmployeeName = DDLEmployeeName.SelectedValue
                    el.PKID = HiddenField1.Value
                    el.Qualification = txtQualificationf.Text
                    el.QualificationType = DDLQualificationType.Text
                    el.Remarks = txtQualificationRemarks.Text
                    el.Year = ddlYear.SelectedItem.Text
                    If DL.InsertQualification(el) > 0 Then
                        Display()
                        lblQRed.Text = ""
                        lblQGreen.Text = "Data updated Successfully."
                        btnQualificationAdd.Text = "ADD"
                        btnQualificationView.Text = "VIEW"
                        QClear()
                        Dim date1 As String
                        date1 = Session("CurrentYear")
                        Dim dt As DataTable
                        dt = QualificationDB.GetYear(date1)
                        Dim value As Integer = dt.Rows(0).Item("LookUpAutoID")
                        ddlYear.SelectedValue = value
                    Else
                        lblQRed.Text = "Enter correct data."
                        lblQGreen.Text = ""
                    End If
                End If
            Else
                lblQRed.Text = "You do not belong to this branch, Cannot add/update data."
                lblQGreen.Text = ""
            End If
        Catch ex As Exception
            lblERed.Text = "Enter correct date."
            lblEGreen.Text = ""
        End Try
    End Sub
    Sub QClear()
        txtQualificationf.Text = ""
        txtQualificationRemarks.Text = ""
        'txtYear.Text = ""
    End Sub
    Sub Display()
        Dim dl As New DLEmpQualification
        el.PKID = 0
        el.EmployeeName = DDLEmployeeName.SelectedValue
        dt = dl.GetEmpQualification(el)
        If dt.Rows.Count > 0 Then
            GVQualification.DataSource = dt
            GVQualification.DataBind()
            GVQualification.Enabled = True
            panel1.Visible = True
            GVQualification.Visible = True
        Else
            panel1.Visible = False
            GVQualification.Visible = False
            lblQRed.Text = "No records to display."
            lblQGreen.Text = ""
        End If
    End Sub

    Protected Sub GVQualification_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GVQualification.PageIndexChanging
        GVQualification.PageIndex = e.NewPageIndex
        ViewState("PageIndexQ") = GVQualification.PageIndex
        Display()
        GridView1.Visible = True
        lblQGreen.Text = ""
        lblQRed.Text = ""
    End Sub

    Protected Sub GVQualification_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GVQualification.RowDeleting
        If (Session("BranchCode") = Session("ParentBranch")) Then
            el.PKID = CType(GVQualification.Rows(e.RowIndex).FindControl("PKID"), Label).Text
            Dim DL As New DLEmpQualification
            DL.DeleteQualification(el)
            lblQRed.Text = ""
            DDLEmployeeName.Focus()
            QClear()
            GVQualification.PageIndex = ViewState("PageIndexQ")
            Display()
            lblQGreen.Text = "Data Deleted Successfully."
            lblQRed.Text = ""
        Else
            lblPRed.Text = "You do not belong to this branch, Cannot delete data."
            lblPGreen.Text = ""
        End If
    End Sub

    Protected Sub GVQualification_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles GVQualification.RowEditing
        HiddenField1.Value = CType(GVQualification.Rows(e.NewEditIndex).FindControl("PKID"), Label).Text
        'DDLEmployeeName.SelectedValue = CType(GVQualification.Rows(e.NewEditIndex).FindControl("EmpID"), Label).Text
        DDLQualificationType.SelectedValue = CType(GVQualification.Rows(e.NewEditIndex).FindControl("QualificationTypeID"), Label).Text
        txtQualificationf.Text = CType(GVQualification.Rows(e.NewEditIndex).FindControl("Qualification"), Label).Text
        txtQualificationRemarks.Text = CType(GVQualification.Rows(e.NewEditIndex).FindControl("Remarks"), Label).Text
        'txtYear.Text = CType(GVQualification.Rows(e.NewEditIndex).FindControl("Year"), Label).Text
        Dim date1 As String
        date1 = CType(GVQualification.Rows(e.NewEditIndex).FindControl("Year"), Label).Text
        Dim dt As DataTable
        dt = QualificationDB.GetYear(date1)
        Dim value As Integer = dt.Rows(0).Item("LookUpAutoID")
        ddlYear.SelectedValue = value
        lblQRed.Text = ""
        lblQGreen.Text = ""
        Dim dl As New DLEmpQualification
        el.PKID = HiddenField1.Value
        el.EmployeeName = DDLEmployeeName.SelectedValue
        dt = dl.GetEmpQualification(el)
        GVQualification.DataSource = dt
        GVQualification.DataBind()
        panel1.Visible = True
        GVQualification.Enabled = False
        GVPublication.Visible = False
        GVExperience.Visible = False
        btnQualificationAdd.Text = "UPDATE"
        btnQualificationView.Text = "BACK"
    End Sub

    Protected Sub btnQualificationView_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnQualificationView.Click
        Dim dl As New DLEmpQualification
        el.PKID = 0
        lblQRed.Text = ""
        lblQGreen.Text = ""
        el.EmployeeName = DDLEmployeeName.SelectedValue
        dt = dl.GetEmpQualification(el)
        'Dim date1 As String
        'date1 = Session("CurrentYear")
        'Dim dt1 As DataTable
        'dt1 = QualificationDB.GetYear(date1)
        'Dim value As Integer = dt1.Rows(0).Item("LookUpAutoID")
        'ddlYear.SelectedValue = value
        If dt.Rows.Count > 0 Then
            GVQualification.DataSource = dt
            GVQualification.DataBind()
            panel1.Visible = True
        Else
            lblQRed.Text = "No records to display."
            lblQGreen.Text = ""
            panel1.Visible = False
        End If
        If btnQualificationView.Text = "BACK" Then
            btnQualificationAdd.Text = "ADD"
            btnQualificationView.Text = "VIEW"
            lblQRed.Text = ""
            lblQGreen.Text = ""
            txtQualificationf.Text = ""
            txtQualificationRemarks.Text = ""
        End If
        btnQualificationAdd.Text = "ADD"
        btnQualificationView.Text = "VIEW"
        GVQualification.Enabled = True
        GVQualification.Focus()
    End Sub
    'Experience form by kusum on 25-Mar-2013

    Protected Sub btnExperienceAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExperienceAdd.Click
        Try
            If (Session("BranchCode") = Session("ParentBranch")) Then
                Dim DL As New DLEmpQualification
                If btnExperienceAdd.Text = "ADD" Then
                    el.EmployeeName = DDLEmployeeName.SelectedValue
                    el.PKIDE = 0
                    el.Experience = txtExperience.Text
                    el.ExperienceType = DDLExperienceType.Text
                    If txtFromDt.Text = "" Then
                        el.FromDate = Nothing
                    Else
                        el.FromDate = txtFromDt.Text
                    End If
                    If txtToDate.Text = "" Then
                        el.ToDate = Nothing
                    Else
                        el.ToDate = txtToDate.Text
                    End If
                    el.RemarksE = txtExperienceRemarks.Text

                    el.Year = ddlYear.SelectedItem.Text

                    If txtFromDt.Text <> "" And txtToDate.Text <> "" Then
                        If CDate(txtFromDt.Text) > CDate(txtToDate.Text) Then
                            lblERed.Text = "From date cannot be greater than To date."
                            lblEGreen.Text = ""
                            Exit Sub
                        End If
                    End If

                    If DL.InsertExperience(el) > 0 Then
                        EQClear()
                        DisplayE()
                        lblERed.Text = ""
                        lblEGreen.Text = "Data added Successfully."
                    Else
                        lblERed.Text = "Enter correct data."
                        lblEGreen.Text = ""
                    End If
                Else
                    el.EmployeeName = DDLEmployeeName.SelectedValue
                    el.PKIDE = txtid.Text
                    el.Experience = txtExperience.Text
                    el.ExperienceType = DDLExperienceType.Text
                    If txtFromDt.Text = "" Then
                        el.FromDate = Nothing
                    Else
                        el.FromDate = txtFromDt.Text
                    End If
                    If txtToDate.Text = "" Then
                        el.ToDate = Nothing
                    Else
                        el.ToDate = txtToDate.Text
                    End If
                    el.RemarksE = txtExperienceRemarks.Text
                    el.Year = ddlYear.SelectedItem.Text
                    If txtFromDt.Text <> "" And txtToDate.Text <> "" Then
                        If CDate(txtFromDt.Text) > CDate(txtToDate.Text) Then
                            lblERed.Text = "From date cannot be greater than To date."
                            lblEGreen.Text = ""
                            Exit Sub
                        End If
                    End If
                    If DL.InsertExperience(el) > 0 Then
                        EQClear()
                        DisplayE()
                        lblERed.Text = ""
                        lblEGreen.Text = "Data updated Successfully."
                        btnExperienceAdd.Text = "ADD"
                        btnExperienceView.Text = "VIEW"
                    Else
                        lblERed.Text = "Enter correct data."
                        lblEGreen.Text = ""
                    End If
                End If
            Else
                lblERed.Text = "You do not belong to this branch, Cannot add/update data."
                lblEGreen.Text = ""
            End If
        Catch ex As Exception
            lblERed.Text = "Enter correct date."
            lblEGreen.Text = ""
        End Try
    End Sub
    Sub EQClear()
        txtExperience.Text = ""
        txtExperienceRemarks.Text = ""
        txtFromDt.Text = ""
        txtToDate.Text = ""
    End Sub
    Sub DisplayE()
        Dim dl As New DLEmpQualification
        el.PKIDE = 0
        el.EmployeeName = DDLEmployeeName.SelectedValue
        dt = dl.GetEmpExperience(el)
        If dt.Rows.Count > 0 Then
            GVExperience.DataSource = dt
            GVExperience.DataBind()
            GVExperience.Enabled = True
            GVExperience.Visible = True
            PExp.Visible = True
            GVExperience.Visible = True
        Else
            GVExperience.Visible = False
            lblERed.Text = "No records to Display."
            lblEGreen.Text = ""
            PExp.Visible = False
        End If
    End Sub

    Protected Sub GVExperience_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GVExperience.PageIndexChanging
        GVExperience.PageIndex = e.NewPageIndex
        ViewState("PageIndexE") = GVExperience.PageIndex
        DisplayE()
        GridView1.Visible = True
        lblEGreen.Text = ""
        lblERed.Text = ""
    End Sub

    Protected Sub GVExperience_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GVExperience.RowDeleting
        If (Session("BranchCode") = Session("ParentBranch")) Then
            el.PKIDE = CType(GVExperience.Rows(e.RowIndex).FindControl("PKID"), Label).Text
            Dim DL As New DLEmpQualification
            DL.DeleteExperience(el)
            lblERed.Text = " "
            DDLEmployeeName.Focus()
            EQClear()
            GVExperience.PageIndex = ViewState("PageIndexE")
            DisplayE()
            lblEGreen.Text = "Data Deleted Successfully."
            lblERed.Text = ""
        Else
            lblERed.Text = "You do not belong to this branch, Cannot delete data."
            lblEGreen.Text = ""
        End If
    End Sub

    Protected Sub GVExperience_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles GVExperience.RowEditing
        txtid.Text = CType(GVExperience.Rows(e.NewEditIndex).FindControl("PKID"), Label).Text
        'DDLEmployeeName.SelectedValue = CType(GVExperience.Rows(e.NewEditIndex).FindControl("EmpID"), Label).Text
        DDLExperienceType.SelectedValue = CType(GVExperience.Rows(e.NewEditIndex).FindControl("ExperienceTypeID"), Label).Text
        txtExperience.Text = CType(GVExperience.Rows(e.NewEditIndex).FindControl("Experience"), Label).Text
        txtExperienceRemarks.Text = CType(GVExperience.Rows(e.NewEditIndex).FindControl("Remarks"), Label).Text
        txtFromDt.Text = CType(GVExperience.Rows(e.NewEditIndex).FindControl("FromDate"), Label).Text
        txtToDate.Text = CType(GVExperience.Rows(e.NewEditIndex).FindControl("ToDate"), Label).Text
        lblERed.Text = ""
        lblEGreen.Text = ""
        Dim dl As New DLEmpQualification
        el.PKID = txtid.Text
        el.EmployeeName = DDLEmployeeName.SelectedValue
        dt = dl.GetEmpExperience(el)
        GVExperience.DataSource = dt
        GVExperience.DataBind()
        PExp.Visible = True
        GVExperience.Enabled = False
        GVPublication.Visible = False
        GVQualification.Visible = False
        btnExperienceAdd.Text = "UPDATE"
        btnExperienceView.Text = "BACK"
    End Sub

    Protected Sub btnExperienceView_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExperienceView.Click
        Dim dl As New DLEmpQualification
        el.PKID = 0
        lblERed.Text = ""
        lblEGreen.Text = ""
        el.EmployeeName = DDLEmployeeName.SelectedValue
        dt = dl.GetEmpExperience(el)
        If dt.Rows.Count > 0 Then
            GVExperience.DataSource = dt
            GVExperience.DataBind()
            PExp.Visible = True
        Else
            lblERed.Text = "No records to Display."
            lblEGreen.Text = ""
            PExp.Visible = False
        End If
        If btnExperienceView.Text = "BACK" Then
            EQClear()
        End If
        btnExperienceAdd.Text = "ADD"
        btnExperienceView.Text = "VIEW"
        GVExperience.Enabled = True
        GVExperience.Focus()
    End Sub

    Protected Sub DDLEmployeeName_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDLEmployeeName.SelectedIndexChanged
        panel1.Visible = False
        PExp.Visible = False
        PnlP.Visible = False
        'EQClear()
        'QClear()
        lblQRed.Text = ""
        lblQGreen.Text = ""
        lblERed.Text = ""
        lblEGreen.Text = ""
        lblPRed.Text = ""
        lblPGreen.Text = ""
    End Sub

    'Publication form by kusum on 25-Mar-2013

    Protected Sub btnPublicationAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPublicationAdd.Click
        Try
            If (Session("BranchCode") = Session("ParentBranch")) Then
                Dim DL As New DLEmpQualification
                If btnPublicationAdd.Text = "ADD" Then
                    el.EmployeeName = DDLEmployeeName.SelectedValue
                    el.PKIDP = 0
                    el.PublicationTitle = txtTitle.Text
                    el.PublisherName = txtName.Text

                    If txtPYear.Text = "" Then
                        el.YearOfPublishing = Nothing
                    Else
                        el.YearOfPublishing = txtPYear.Text
                    End If
                    el.RemarksP = txtPublicationRemarks.Text

                    If DL.InsertPublication(el) > 0 Then
                        PClear()
                        DisplayP()
                        lblPRed.Text = ""
                        lblPGreen.Text = "Data added Successfully."
                    Else
                        lblPRed.Text = "Enter correct data."
                        lblPGreen.Text = ""
                    End If
                Else
                    el.EmployeeName = DDLEmployeeName.SelectedValue
                    el.PKIDP = txtPID.Text
                    el.PublicationTitle = txtTitle.Text
                    el.PublisherName = txtName.Text

                    If txtPYear.Text = "" Then
                        el.YearOfPublishing = Nothing
                    Else
                        el.YearOfPublishing = txtPYear.Text
                    End If
                    el.RemarksP = txtPublicationRemarks.Text

                    If DL.InsertPublication(el) > 0 Then
                        PClear()
                        DisplayP()
                        lblPRed.Text = ""
                        lblPGreen.Text = "Data updated Successfully."
                        btnPublicationAdd.Text = "ADD"
                        btnPublicationView.Text = "VIEW"
                    Else
                        lblPRed.Text = "Enter correct data."
                        lblPGreen.Text = ""
                    End If
                End If
            Else
                lblPRed.Text = "You do not belong to this branch, Cannot add/update data."
                lblPGreen.Text = ""
            End If
        Catch ex As Exception
            lblPRed.Text = "Enter correct date."
            lblPGreen.Text = ""
        End Try
    End Sub
    Sub PClear()
        txtTitle.Text = ""
        txtPublicationRemarks.Text = ""
        txtPYear.Text = ""
        txtName.Text = ""
    End Sub
    Sub DisplayP()
        Dim dl As New DLEmpQualification
        el.PKIDP = 0
        el.EmployeeName = DDLEmployeeName.SelectedValue
        dt = dl.GetEmpPublication(el)
        If dt.Rows.Count > 0 Then
            GVPublication.DataSource = dt
            GVPublication.DataBind()
            GVPublication.Enabled = True
            GVPublication.Visible = True
            PnlP.Visible = True
            GVPublication.Visible = True
        Else
            GVPublication.Visible = False
            lblPRed.Text = "No records to Display."
            lblPGreen.Text = ""
            PnlP.Visible = False
        End If
    End Sub

    Protected Sub GVPublication_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GVPublication.PageIndexChanging
        GVPublication.PageIndex = e.NewPageIndex
        ViewState("PageIndexP") = GVPublication.PageIndex
        DisplayP()
        GVPublication.Visible = True
        lblPGreen.Text = ""
        lblPRed.Text = ""
    End Sub

    Protected Sub GVPublication_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GVPublication.RowDeleting
        If (Session("BranchCode") = Session("ParentBranch")) Then
            el.PKIDP = CType(GVPublication.Rows(e.RowIndex).FindControl("PKID"), Label).Text
            Dim DL As New DLEmpQualification
            DL.DeletePublication(el)
            lblPRed.Text = " "
            DDLEmployeeName.Focus()
            PClear()
            GVPublication.PageIndex = ViewState("PageIndexP")
            DisplayP()
            btnPublicationAdd.Focus()
            lblPGreen.Text = "Data Deleted Successfully."
            lblPRed.Text = ""
        Else
            lblPRed.Text = "You do not belong to this branch, Cannot delete data."
            lblPGreen.Text = ""
        End If

    End Sub

    Protected Sub GVPublication_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles GVPublication.RowEditing
        txtPID.Text = CType(GVPublication.Rows(e.NewEditIndex).FindControl("PKID"), Label).Text
        DDLEmployeeName.SelectedValue = CType(GVPublication.Rows(e.NewEditIndex).FindControl("EmpID"), Label).Text
        txtTitle.Text = CType(GVPublication.Rows(e.NewEditIndex).FindControl("PublicationTitle"), Label).Text
        txtName.Text = CType(GVPublication.Rows(e.NewEditIndex).FindControl("PublisherName"), Label).Text
        txtPublicationRemarks.Text = CType(GVPublication.Rows(e.NewEditIndex).FindControl("Remarks"), Label).Text
        txtPYear.Text = CType(GVPublication.Rows(e.NewEditIndex).FindControl("YearOfPublishing"), Label).Text
        lblPRed.Text = ""
        lblPGreen.Text = ""
        Dim dl As New DLEmpQualification
        el.PKIDP = txtPID.Text
        el.EmployeeName = DDLEmployeeName.SelectedValue
        dt = dl.GetEmpPublication(el)
        GVPublication.DataSource = dt
        GVPublication.DataBind()
        PnlP.Visible = True
        GVPublication.Enabled = False
        GVExperience.Visible = False
        GVQualification.Visible = False
        btnPublicationAdd.Text = "UPDATE"
        btnPublicationView.Text = "BACK"
    End Sub

    Protected Sub btnPublicationView_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPublicationView.Click
        Dim dl As New DLEmpQualification
        lblPRed.Text = ""
        lblPGreen.Text = ""
        el.PKIDP = 0
        lblERed.Text = ""
        lblEGreen.Text = ""
        el.EmployeeName = DDLEmployeeName.SelectedValue
        dt = dl.GetEmpPublication(el)
        Dim date1 As String
        date1 = Session("CurrentYear")
        Dim dt1 As DataTable
        dt1 = QualificationDB.GetYear(date1)
        Dim value As Integer = dt1.Rows(0).Item("LookUpAutoID")
        ddlYear.SelectedValue = value
        If dt.Rows.Count > 0 Then
            GVPublication.DataSource = dt
            GVPublication.DataBind()
            PnlP.Visible = True
        Else
            lblPRed.Text = "No records to Display."
            lblPGreen.Text = ""
            PnlP.Visible = False
        End If
        If btnPublicationView.Text = "BACK" Then
            PClear()
        End If
        btnPublicationAdd.Text = "ADD"
        btnPublicationView.Text = "VIEW"
        GVPublication.Enabled = True
        GVPublication.Focus()
    End Sub

    Protected Sub txtHRAEmp_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtHRAEmp.TextChanged
        If Trim(txtHRAEmp.Text) = "" Then
            HidHRAEmp.Value = ""
        Else
            HidHRAEmp.Value = HidHRAEmp.Value
        End If
    End Sub

    Protected Sub txtFMEmpCode_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtFMEmpCode.TextChanged
        If Trim(txtFMEmpCode.Text) = "" Then
            HidFMEmpCode.Value = ""
        Else
            HidFMEmpCode.Value = HidFMEmpCode.Value
        End If
    End Sub

    Protected Sub txtRMEmpCode_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRMEmpCode.TextChanged
        If Trim(txtRMEmpCode.Text) = "" Then
            HidRMEmpCode.Value = ""
        Else
            HidRMEmpCode.Value = HidRMEmpCode.Value
        End If
    End Sub

    Protected Sub txtAcctBranch_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtAcctBranch.TextChanged
        If txtAcctBranch.Text = "" Then
            HidBankId.Value = ""
        Else
            HidBankId.Value = HidBankId.Value
        End If
    End Sub

    Sub clearMed()
        HidId.Value = ""
        txtHeight.Text = ""
        txtWeight.Text = ""
        txtHeight.Text = ""
        txtIdentificationMark.Text = ""
        txtBloodGroup.Text = ""
        txtImmunizationRecord.Text = ""
        txtDetailsofanyseriousillness.Text = ""
        txtParticularsofanyallergies.Text = ""
        txtEmergencyContactName.Text = ""
        txtEmergencyContactNumber.Text = ""
        txtDisabilitiesifany.Text = ""
    End Sub

    Protected Sub btnInsert_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsert.Click
        If (Session("BranchCode") = Session("ParentBranch")) Then
            Try
                ELMed.Emp_Id = DDLEmployeeName1.SelectedValue
                ELMed.Id = IIf(HidId.Value = Nothing, 0, HidId.Value)
                ELMed.Height = txtHeight.Text
                ELMed.Weight = txtWeight.Text
                ELMed.Height = txtHeight.Text
                ELMed.IdentificationMark = txtIdentificationMark.Text
                ELMed.BloodGroup = txtBloodGroup.Text
                ELMed.ImmunizationRecord = txtImmunizationRecord.Text
                ELMed.Detailsofanyseriousillness = txtDetailsofanyseriousillness.Text
                ELMed.Particularsofanyallergies = txtParticularsofanyallergies.Text
                ELMed.EmergencyContactName = txtEmergencyContactName.Text
                ELMed.EmergencyContactNumber = txtEmergencyContactNumber.Text
                ELMed.Disabilitiesifany = txtDisabilitiesifany.Text
                ELMed.LoginType = "Employee"
                If btnInsert.Text = "ADD" Then
                    Dim i As Integer = DlMedicalDetails.InsertEmp(ELMed)
                    If i > 0 Then
                        lblGrn.Text = "Data Saved Successfully."
                        lblRd.Text = ""
                        clearMed()
                    End If
                Else
                    Dim i As Integer = DlMedicalDetails.UpdateEmp(ELMed)
                    If i > 0 Then
                        lblGrn.Text = "Data Updated Successfully."
                        lblRd.Text = ""
                        clearMed()
                        GridMedical.Enabled = True
                        btnInsert.Text = "ADD"
                        btnBack.Text = "VIEW"
                    End If
                End If
                DisplayMedical(0)
            Catch ex As Exception
                lblRd.Text = "Error in processing the data."
                lblGrn.Text = ""
            End Try
        Else
            lblRd.Text = "You do not belong to this branch, Cannot delete data."
            lblGrn.Text = ""
        End If
    End Sub

    Protected Sub btnBack_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnBack.Click
        LinkButton3.Focus()
        Try
            lblRd.Text = ""
            lblGrn.Text = ""
            If btnBack.Text = "VIEW" Then
                DisplayMedical(0)
            Else
                DisplayMedical(0)
                btnInsert.Text = "ADD"
                btnBack.Text = "VIEW"
                clearMed()
                GridMedical.Enabled = True
            End If
        Catch ex As Exception

        End Try
    End Sub
    Sub DisplayMedical(ByVal i As Integer)
        Dim dt As New DataTable
        ELMed.Id = i
        ELMed.LoginType = "Employee"
        dt = DlMedicalDetails.GetEmpData(ELMed)
        If dt.Rows.Count <> 0 Then
            GridMedical.DataSource = dt
            GridMedical.DataBind()
            GridMedical.Visible = True
        Else
            lblRd.Text = "No records to display."
            lblGrn.Text = ""
            GridMedical.Visible = False
        End If
    End Sub

    Protected Sub GridMedical_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridMedical.PageIndexChanging
        Try
            GridMedical.PageIndex = e.NewPageIndex
            ViewState("PageIndex") = GridMedical.PageIndex
            GridMedical.DataBind()
            DisplayMedical(0)
        Catch ex As Exception

        End Try
    End Sub
    Protected Sub GridMedical_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridMedical.RowDeleting
        lblRd.Text = ""
        lblGrn.Text = ""
        If (Session("BranchCode") = Session("ParentBranch")) Then
            ELMed.Id = CType(GridMedical.Rows(e.RowIndex).Cells(1).FindControl("lblID"), System.Web.UI.WebControls.Label).Text
            DlMedicalDetails.GetDelete(ELMed)
            DisplayMedical(0)
            GridMedical.Visible = True

            GridMedical.PageIndex = ViewState("PageIndex")
            DisplayMedical(0)
            lblRd.Text = ""
            lblGrn.Text = "Data Deleted Successfully."
        Else
            lblRd.Text = "You do not belong to this branch, Cannot delete data."
            lblGrn.Text = ""
        End If
    End Sub

    Protected Sub GridMedical_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles GridMedical.RowEditing
        lblRd.Text = ""
        lblGrn.Text = ""
        Try
            HidId.Value = CType(GridMedical.Rows(e.NewEditIndex).FindControl("lblID"), System.Web.UI.WebControls.Label).Text
            DDLEmployeeName1.SelectedValue = CType(GridMedical.Rows(e.NewEditIndex).FindControl("lblEmpId"), System.Web.UI.WebControls.Label).Text
            txtHeight.Text = CType(GridMedical.Rows(e.NewEditIndex).FindControl("lblHeight"), System.Web.UI.WebControls.Label).Text
            txtWeight.Text = CType(GridMedical.Rows(e.NewEditIndex).FindControl("lblWeight"), System.Web.UI.WebControls.Label).Text
            txtIdentificationMark.Text = CType(GridMedical.Rows(e.NewEditIndex).FindControl("lblIdentificationMark"), System.Web.UI.WebControls.Label).Text
            txtBloodGroup.Text = CType(GridMedical.Rows(e.NewEditIndex).FindControl("lblBloodGroup"), System.Web.UI.WebControls.Label).Text
            txtImmunizationRecord.Text = CType(GridMedical.Rows(e.NewEditIndex).FindControl("lblImmunizationRecord"), System.Web.UI.WebControls.Label).Text
            txtDetailsofanyseriousillness.Text = CType(GridMedical.Rows(e.NewEditIndex).FindControl("lblDetailsofanyseriousillness"), System.Web.UI.WebControls.Label).Text
            txtParticularsofanyallergies.Text = CType(GridMedical.Rows(e.NewEditIndex).FindControl("lblParticularsofanyallergies"), System.Web.UI.WebControls.Label).Text
            txtEmergencyContactName.Text = CType(GridMedical.Rows(e.NewEditIndex).FindControl("lblEmergencyContactName"), System.Web.UI.WebControls.Label).Text
            txtEmergencyContactNumber.Text = CType(GridMedical.Rows(e.NewEditIndex).FindControl("lblEmergencyContactNumber"), System.Web.UI.WebControls.Label).Text
            txtDisabilitiesifany.Text = CType(GridMedical.Rows(e.NewEditIndex).FindControl("lblDisabilitiesifany"), System.Web.UI.WebControls.Label).Text
            ELMed.Id = HidId.Value
            btnInsert.Text = "UPDATE"
            btnBack.Text = "BACK"
            Dim dt As New DataTable
            GridMedical.Enabled = False
            DisplayMedical(ELMed.Id)
        Catch ex As Exception
            lblRd.Text = "Enter correct data."
            lblGrn.Text = ""
        End Try
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
        If txtEmpName.Text = "" Then
            indmaster.Emp_Name = 0
        Else
            indmaster.Emp_Name = txtEmpName.Text
        End If
        If txtEmpcode.Text = "" Then
            indmaster.EmpCode = "*"
        Else
            indmaster.EmpCode = txtEmpcode.Text
        End If
        If ddldesignation.SelectedValue = "" Then
            indmaster.Designation = 0
        Else
            indmaster.Designation = ddldesignation.SelectedValue
        End If
        If DDLDeptType.SelectedValue = "Select" Then
            indmaster.BranchTypeCode = "0"
        Else
            indmaster.BranchTypeCode = DDLDeptType.SelectedValue
        End If
        indmaster.Designation = ddldesignation.SelectedValue
        indmaster.Emp_Id = 0
        indmaster.EmpCategory = ddlempcategory.SelectedValue
        indmaster.EmploymentType = ddlEmpType.SelectedValue
        indmaster.NICNO = txtNicNo.Text

        If txtDOB.Text = "" Then
            indmaster.DOB = "1/1/2999"
        Else
            indmaster.DOB = txtDOB.Text
        End If
        If txtDOJ.Text = "" Then
            indmaster.DOJ = "1/1/3000"
        Else
            indmaster.DOJ = txtDOJ.Text
        End If
        indmaster.DeptID = ddlDept.SelectedValue
        If txtContactNo.Text = "" Then
            indmaster.ContactNo = 0
        Else
            indmaster.ContactNo = txtContactNo.Text
        End If
        If txtLandlinNo.Text = "" Then
            indmaster.LandLineNo = 0
        Else
            indmaster.ContactNo = txtContactNo.Text
        End If
        If txtEmail.Text = "" Then
            indmaster.Email = 0
        Else
            indmaster.Email = txtEmail.Text
        End If
        If txtqualification.Text = "" Then
            indmaster.Qualification = 0
        Else
            indmaster.Qualification = txtqualification.Text
        End If

        If ddlSex.SelectedValue = "Select" Then
            indmaster.Sex = "0"
        Else
            indmaster.Sex = ddlSex.SelectedValue
        End If
        If txtCountry.Text = "" Then
            indmaster.Country = 0
        Else
            indmaster.Country = txtCountry.Text
        End If
        If txtDOL.Text = "" Then
            indmaster.DOL = "1/1/3100"
        Else
            indmaster.DOL = txtDOL.Text
        End If
        If txtPassportNo.Text = "" Then
            indmaster.PassportNo = 0
        Else
            indmaster.PassportNo = txtPassportNo.Text
        End If

        dt = individual.GetIndividualFormMaster(indmaster)
        Dim sortedView As New DataView(dt)
        sortedView.Sort = Convert.ToString(e.SortExpression) & " " & sortingDirection
        GridView1.DataSource = sortedView
        GridView1.DataBind()
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
