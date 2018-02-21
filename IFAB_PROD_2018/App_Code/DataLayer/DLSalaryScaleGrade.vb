Imports Microsoft.VisualBasic
Imports System.Data.SqlClient

Public Class DLSalaryScaleGrade
    Public Function InsertSalaryScale(ByVal EL As ELSalaryScaleGrade) As Integer
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim arParms() As SqlParameter = New SqlParameter(5) {}
        Dim rowsAffected As Integer = 0
        arParms(0) = New SqlParameter("@Office", SqlDbType.VarChar, 50)
        arParms(0).Value = HttpContext.Current.Session("Office")
        arParms(1) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        arParms(1).Value = HttpContext.Current.Session("BranchCode")
        arParms(2) = New SqlParameter("@Empcode", SqlDbType.VarChar, 50)
        arParms(2).Value = HttpContext.Current.Session("Empcode")
        arParms(3) = New SqlParameter("@Grade", SqlDbType.VarChar, 250)
        arParms(3).Value = EL.Grade
        arParms(4) = New SqlParameter("@ScaleRange", SqlDbType.VarChar, 250)
        arParms(4).Value = EL.ScaleRange
        'arParms(5) = New SqlParameter("@id", SqlDbType.Int)
        'arParms(5).Value = EL.id
        arParms(5) = New SqlParameter("@UserCode", SqlDbType.VarChar, 50)
        arParms(5).Value = HttpContext.Current.Session("UserCode")



        Try
            rowsAffected = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "InsertSalryGradeMaster", arParms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return rowsAffected
    End Function
    Public Function DeleteSalryScale(ByVal EL As ELSalaryScaleGrade) As Integer
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString

        Dim arParms() As SqlParameter = New SqlParameter(0) {}
        Dim rowsAffected As Integer = 0

        arParms(0) = New SqlParameter("@id", SqlDbType.Int)
        arParms(0).Value = EL.id
        rowsaffected = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "proc_DeleteSalryGraid", arParms)
        Return rowsaffected
    End Function
    Shared Function DisplayGridview(ByVal id As Integer) As DataTable

        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        'Dim para() As SqlParameter = New SqlParameter(2) {}
        Dim rowsAffected As Integer = 0
        Dim Params() As SqlParameter = New SqlParameter(2) {}
        Params(0) = New SqlParameter("@id", Data.SqlDbType.Int)
        Params(0).Value = id


        Params(1) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        Params(1).Value = HttpContext.Current.Session("BranchCode")

        Params(2) = New SqlParameter("@Office", SqlDbType.VarChar, 2)
        Params(2).Value = HttpContext.Current.Session("Office")


        Try
            ds = SqlHelper.ExecuteDataset(ConnectionString, CommandType.StoredProcedure, "DisplaySalaryScale", Params)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    Shared Function UpdateSalaryScale(ByVal EL As ELSalaryScaleGrade) As Integer
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim rowsAffected As Integer = 0
        Dim arParms() As SqlParameter = New SqlParameter(6) {}
        arParms(0) = New SqlParameter("@Office", SqlDbType.VarChar, 50)
        arParms(0).Value = HttpContext.Current.Session("Office")
        arParms(1) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        arParms(1).Value = HttpContext.Current.Session("BranchCode")
        arParms(2) = New SqlParameter("@Grade", SqlDbType.VarChar, 250)
        arParms(2).Value = EL.Grade
        arParms(3) = New SqlParameter("@ScaleRange", SqlDbType.VarChar, 250)
        arParms(3).Value = EL.ScaleRange
        arParms(4) = New SqlParameter("@id", SqlDbType.Int)
        arParms(4).Value = EL.id
        arParms(5) = New SqlParameter("@UserCode", SqlDbType.VarChar, 50)
        arParms(5).Value = HttpContext.Current.Session("UserCode")
        arParms(6) = New SqlParameter("@Empcode", SqlDbType.VarChar, 50)
        arParms(6).Value = HttpContext.Current.Session("Empcode")
        Try
            rowsAffected = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "UpdateSalryGraid", arParms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try

        Return rowsAffected
    End Function
    Shared Function CheckDuplicate(ByVal EL As ELSalaryScaleGrade) As Data.DataTable
        Dim connectionstring As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Dim rowsAffected As Integer = 0
        Dim arParms() As SqlParameter = New SqlParameter(3) {}

        arParms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        arParms(0).Value = HttpContext.Current.Session("BranchCode")
        arParms(1) = New SqlParameter("@Grade", SqlDbType.VarChar, 250)
        arParms(1).Value = EL.Grade
        arParms(2) = New SqlParameter("@ScaleRange", SqlDbType.VarChar, 250)
        arParms(2).Value = EL.ScaleRange
        arParms(3) = New SqlParameter("@id", SqlDbType.Int)
        arParms(3).Value = EL.id

        Try
            ds = SqlHelper.ExecuteDataset(connectionstring, CommandType.StoredProcedure, "Proc_GetDuplicateScaleSalaryGrade", arParms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)

    End Function
End Class
