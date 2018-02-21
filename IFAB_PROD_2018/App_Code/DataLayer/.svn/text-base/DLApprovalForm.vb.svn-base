Imports Microsoft.VisualBasic
Imports System.Data.SqlClient

Public Class DLApprovalForm
    Shared Function GetGrid(ByVal TableCode As Integer) As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet

        Dim para() As SqlParameter = New SqlParameter(1) {}

        para(0) = New SqlParameter("@EmpCode", SqlDbType.VarChar)
        para(0).Value = HttpContext.Current.Session("EmpCode")

        para(1) = New SqlParameter("@TableCode", SqlDbType.Int)
        para(1).Value = TableCode

        'para(1) = New SqlParameter("@EnrollNo", SqlDbType.VarChar)
        'para(1).Value = enroll      

        Try
            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Proc_DisplayApproveFormGrid", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try

        Return ds.Tables(0)
    End Function
    Shared Function GetGrid1(ByVal TableCode As Integer) As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet

        Dim para() As SqlParameter = New SqlParameter(1) {}

        para(0) = New SqlParameter("@EmpCode", SqlDbType.VarChar)
        para(0).Value = HttpContext.Current.Session("EmpCode")

        para(1) = New SqlParameter("@TableCode", SqlDbType.Int)
        para(1).Value = TableCode

        'para(1) = New SqlParameter("@EnrollNo", SqlDbType.VarChar)
        'para(1).Value = enroll      

        Try
            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Proc_DisplayApproveFormGrid1", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try

        Return ds.Tables(0)
    End Function

    Shared Function GetBatchGrid(ByVal BatchCode As String) As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet

        Dim para() As SqlParameter = New SqlParameter(1) {}

        para(0) = New SqlParameter("@EmpCode", SqlDbType.VarChar)
        para(0).Value = HttpContext.Current.Session("EmpCode")

        para(1) = New SqlParameter("@BatchCode", SqlDbType.VarChar)
        para(1).Value = BatchCode

        Try
            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Proc_DisplayApproveFormGridBatch", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try

        Return ds.Tables(0)
    End Function
    Shared Function Approval(ByVal app As ApprovalForm) As Integer
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim rowsAffected As Integer = 0

        Dim para() As SqlParameter = New SqlParameter(2) {}

        para(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar)
        para(0).Value = HttpContext.Current.Session("BranchCode")

        para(1) = New SqlParameter("@ApproveId", SqlDbType.VarChar, 150)
        para(1).Value = app.ApproveId

        para(2) = New SqlParameter("@Remarks", SqlDbType.VarChar, 150)
        para(2).Value = app.Remarks

        Try
            rowsAffected = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "Proc_Approval", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try

        Return rowsAffected
    End Function
    Shared Function ApprovalStudent(ByVal app As ApprovalForm) As Integer
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim rowsAffected As Integer = 0

        Dim para() As SqlParameter = New SqlParameter(2) {}

        para(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar)
        para(0).Value = HttpContext.Current.Session("BranchCode")

        para(1) = New SqlParameter("@ApproveId", SqlDbType.VarChar, 150)
        para(1).Value = app.ApproveId

        para(2) = New SqlParameter("@Remarks", SqlDbType.VarChar, 150)
        para(2).Value = app.Remarks

        Try
            rowsAffected = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "Proc_ApprovalStudent", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try

        Return rowsAffected
    End Function
    Shared Function Approval1(ByVal app As ApprovalForm) As Integer
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim rowsAffected As Integer = 0

        Dim para() As SqlParameter = New SqlParameter(2) {}

        para(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar)
        para(0).Value = HttpContext.Current.Session("BranchCode")

        para(1) = New SqlParameter("@ApproveId", SqlDbType.Int)
        para(1).Value = app.ApproveId

        para(2) = New SqlParameter("@Remarks", SqlDbType.VarChar, 150)
        para(2).Value = app.Remarks

        Try
            rowsAffected = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "Proc_Approval1", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try

        Return rowsAffected
    End Function
    Shared Function Rejection() As Integer
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim rowsAffected As Integer = 0

        Dim para() As SqlParameter = New SqlParameter(0) {}

        para(0) = New SqlParameter("@RowId", SqlDbType.VarChar)
        para(0).Value = HttpContext.Current.Session("RowID")
        'Dim s As Integer = HttpContext.Current.Session("RowID")
        Try
            rowsAffected = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "Proc_RejectionEnroll", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try

        Return rowsAffected
    End Function
    Shared Function SCRejection() As Integer
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim rowsAffected As Integer = 0

        Dim para() As SqlParameter = New SqlParameter(0) {}

        para(0) = New SqlParameter("@RowId", SqlDbType.VarChar)
        para(0).Value = HttpContext.Current.Session("RowID")
        Dim s As Integer = HttpContext.Current.Session("RowID")
        Try
            rowsAffected = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "Proc_SCRejection", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return rowsAffected
    End Function
    Shared Function PRejection() As Integer
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim rowsAffected As Integer = 0

        Dim para() As SqlParameter = New SqlParameter(0) {}

        para(0) = New SqlParameter("@RowId", SqlDbType.VarChar)
        para(0).Value = HttpContext.Current.Session("RowID")
        Dim s As Integer = HttpContext.Current.Session("RowID")
        Try
            rowsAffected = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "Proc_PRejection", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return rowsAffected
    End Function
    Shared Function RRejection(ByVal Remarks As String) As Integer
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim rowsAffected As Integer = 0

        Dim para() As SqlParameter = New SqlParameter(1) {}

        para(0) = New SqlParameter("@RowId", SqlDbType.Int)
        para(0).Value = CInt(HttpContext.Current.Session("RowID"))

        para(1) = New SqlParameter("@Remarks", SqlDbType.VarChar, Remarks.Length)
        para(1).Value = Remarks

        Try
            rowsAffected = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "Proc_RRejection", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return rowsAffected
    End Function
    Shared Function GratuityRejection() As Integer
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim rowsAffected As Integer = 0

        Dim para() As SqlParameter = New SqlParameter(0) {}

        para(0) = New SqlParameter("@RowId", SqlDbType.VarChar)
        para(0).Value = HttpContext.Current.Session("RowID")

        Try
            rowsAffected = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "Proc_GratuityRejection", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return rowsAffected
    End Function
    Shared Function GetEnrollAgentDdl(ByVal branch As String) As Data.DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString

        Dim arParms() As SqlParameter = New SqlParameter(0) {}

        arParms(0) = New SqlParameter("@Batch", SqlDbType.VarChar)
        arParms(0).Value = branch

        Dim ds As DataSet
        ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Proc_ApprovalEnrolldll", arParms)
        Return ds.Tables(0)
    End Function
    Shared Function GetEnrDetails(ByVal ID As Integer) As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim arParms() As SqlParameter = New SqlParameter(2) {}

        arParms(0) = New SqlClient.SqlParameter("@branch", SqlDbType.VarChar)
        arParms(0).Value = HttpContext.Current.Session("BranchCode")

        arParms(1) = New SqlParameter("@office", SqlDbType.VarChar)
        arParms(1).Value = HttpContext.Current.Session("Office")

        arParms(2) = New SqlParameter("@ID", SqlDbType.Int)
        arParms(2).Value = ID

        Dim ds As DataSet
        ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Proc_GetEnrDetials", arParms)
        Dim dt As New DataTable()
        dt = ds.Tables(0)
        Return dt
    End Function
    Shared Function GetApproveEnr(ByVal AppID As Integer) As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim arParms() As SqlParameter = New SqlParameter(0) {}

        arParms(0) = New SqlParameter("@AppID", SqlDbType.Int)
        arParms(0).Value = AppID

        Dim ds As DataSet
        ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Proc_GetApproveEnr", arParms)
        Dim dt As New DataTable()
        dt = ds.Tables(0)
        Return dt
    End Function
    Shared Function UpdateRemarks(ByVal RowId As Integer, ByVal Remarks As String, ByVal Form As String) As Integer
        Dim rowsAffected As Integer = 0
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString


        Dim arParms() As SqlParameter = New SqlParameter(2) {}

        arParms(0) = New SqlParameter("@RowId", SqlDbType.Int)
        arParms(0).Value = RowId

        arParms(1) = New SqlParameter("@Remarks", SqlDbType.VarChar)
        arParms(1).Value = Remarks

        arParms(2) = New SqlParameter("@Form", SqlDbType.VarChar)
        arParms(2).Value = Form
        Try
            rowsAffected = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "Proc_UpdateRemarks", arParms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return rowsAffected
    End Function
    Public Function CRMApptReport(ByVal Emp As Integer, ByVal FromDate As DateTime, ByVal ToDate As DateTime) As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet

        Dim arParms() As SqlParameter = New SqlParameter(4) {}

        arParms(0) = New SqlParameter("@EmpId", SqlDbType.Int)
        arParms(0).Value = Emp

        arParms(1) = New SqlParameter("@FromDate", SqlDbType.DateTime)
        arParms(1).Value = FromDate

        arParms(2) = New SqlParameter("@ToDate", SqlDbType.DateTime)
        arParms(2).Value = ToDate

        arParms(3) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        arParms(3).Value = HttpContext.Current.Session("BranchCode")

        arParms(4) = New SqlParameter("@Office", SqlDbType.VarChar, 50)
        arParms(4).Value = HttpContext.Current.Session("Office")


        Try
            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Rpt_CRMAppointment", arParms)
            Return ds.Tables(0)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
    End Function
End Class
