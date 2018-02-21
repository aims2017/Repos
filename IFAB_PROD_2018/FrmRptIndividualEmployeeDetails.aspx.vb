
Partial Class FrmRptIndividualEmployeeDetails
    Inherits BasePage
    Dim BLL As New RptStudentAdmissionDetailsBL
    Dim dt As DataTable
    'Code written By Niraj
    '21-Mar-2013

    Protected Sub Btnreport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Btnreport.Click
        lblmsg.Text = ""
        msginfo.Text = ""
        Dim QS As String
        Dim BN As String
        Dim Dept As String
        Dim EmpType As String
        Dim EmpCat As String
        Dim EmpName As String
        Try

            BN = DdlBranchName.SelectedValue
            Dept = ddlDept.SelectedValue
            EmpType = ddlEmpType.SelectedValue
            EmpCat = ddlempcategory.SelectedValue
            EmpName = DdlEmpName.SelectedValue

            QS = Request.QueryString.Get("QS")
            Dim qrystring As String = "RptIndividualEmployeeDetailsV.aspx?" & QueryStr.Querystring() & "&BN=" & BN & "&Dept=" & Dept & "&EmpType=" & EmpType & "&EmpCat=" & EmpCat & "&EmpName=" & EmpName
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "message", "<script>window.open('" & qrystring & "',null,'toolbar=no,scrollbars=yes,location=no,resizable =yes,width=1050,height=700,left=0,top=0')</script>", False)
            msginfo.Text = ""
            lblmsg.Text = ""
        Catch ex As Exception
            msginfo.Text = "Enter correct data."
            lblmsg.Text = ""
        End Try
    End Sub
    Protected Sub btnBack_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Btnback.Click
        Response.Redirect("Report.aspx")
    End Sub
    <System.Web.Services.WebMethod()> Public Sub AbandonSession()
        Dim i As Int16 = UserDetailsDB.UpdateUserlog()
        Response.Redirect("LogIn.aspx")
    End Sub

    Protected Sub DdlBranchName_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DdlBranchName.SelectedIndexChanged
        DdlBranchName.Focus()
    End Sub

    Protected Sub ddlDept_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlDept.SelectedIndexChanged
        ddlDept.Focus()
    End Sub

    Protected Sub ddlempcategory_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlempcategory.SelectedIndexChanged
        ddlempcategory.Focus()
    End Sub

    Protected Sub DdlEmpName_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DdlEmpName.SelectedIndexChanged
        DdlEmpName.Focus()
    End Sub

    Protected Sub ddlEmpType_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlEmpType.SelectedIndexChanged
        ddlEmpType.Focus()
    End Sub

    Protected Sub Page_Load1(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            DdlBranchName.SelectedValue = Session("BranchCode")
            DdlBranchName.Focus()
        End If
    End Sub
End Class
