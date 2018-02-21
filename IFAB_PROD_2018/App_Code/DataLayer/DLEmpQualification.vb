Imports Microsoft.VisualBasic
Imports System.Data.SqlClient

Public Class DLEmpQualification
    Public Function DeletePublication(ByVal EL As ELEmpQualification) As Integer
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As Integer
        Dim arParms() As SqlParameter = New SqlParameter(0) {}

        arParms(0) = New SqlParameter("@PKID", SqlDbType.Int)
        arParms(0).Value = EL.PKIDP

        ds = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "Proc_DeleteEmpPublication", arParms)
        Return ds
    End Function
    Public Function InsertPublication(ByVal EL As ELEmpQualification) As Integer
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As Integer
        Dim arParms() As SqlParameter = New SqlParameter(8) {}

        arParms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        arParms(0).Value = HttpContext.Current.Session("BranchCode")

        arParms(1) = New SqlParameter("@Empcode", SqlDbType.VarChar, 50)
        arParms(1).Value = HttpContext.Current.Session("EmpCode")

        arParms(2) = New SqlParameter("@UserCode", SqlDbType.VarChar, 50)
        arParms(2).Value = HttpContext.Current.Session("UserCode")

        arParms(3) = New SqlParameter("@EmpID", SqlDbType.Int)
        arParms(3).Value = EL.EmployeeName

        arParms(4) = New SqlParameter("@PublicationTitle", SqlDbType.VarChar, 250)
        arParms(4).Value = EL.PublicationTitle

        arParms(5) = New SqlParameter("@PublisherName", SqlDbType.VarChar, 250)
        arParms(5).Value = EL.PublisherName

        arParms(6) = New SqlParameter("@Remarks", SqlDbType.VarChar, 250)
        arParms(6).Value = EL.RemarksP

        If EL.YearOfPublishing = Nothing Then
            arParms(7) = New SqlParameter("@YearOfPublishing", SqlDbType.VarChar)
            arParms(7).Value = DBNull.Value
        Else
            arParms(7) = New SqlParameter("@YearOfPublishing", SqlDbType.Int)
            arParms(7).Value = EL.YearOfPublishing
        End If

        arParms(8) = New SqlParameter("@PKID", SqlDbType.Int)
        arParms(8).Value = EL.PKIDP

        ds = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "Proc_InsertEmpPublication", arParms)
        Return ds
    End Function
    Public Function GetEmpPublication(ByVal EL As ELEmpQualification) As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Dim arParms() As SqlParameter = New SqlParameter(3) {}

        arParms(0) = New SqlParameter("@Office", SqlDbType.VarChar, 50)
        arParms(0).Value = HttpContext.Current.Session("Office")

        arParms(1) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        arParms(1).Value = HttpContext.Current.Session("BranchCode")

        arParms(2) = New SqlParameter("@PKID", SqlDbType.Int)
        arParms(2).Value = EL.PKIDP

        arParms(3) = New SqlParameter("@EmpID", SqlDbType.Int)
        arParms(3).Value = EL.EmployeeName

        ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Proc_GetEmpPublication", arParms)
        Return ds.Tables(0)
    End Function

    ''' ''' '''''''''''
    Public Function DeleteExperience(ByVal EL As ELEmpQualification) As Integer
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As Integer
        Dim arParms() As SqlParameter = New SqlParameter(0) {}

        arParms(0) = New SqlParameter("@PKID", SqlDbType.Int)
        arParms(0).Value = EL.PKIDE

        ds = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "Proc_DeleteEmpExperience", arParms)
        Return ds
    End Function
    Public Function InsertExperience(ByVal EL As ELEmpQualification) As Integer
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As Integer
        Dim arParms() As SqlParameter = New SqlParameter(9) {}

        arParms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        arParms(0).Value = HttpContext.Current.Session("BranchCode")

        arParms(1) = New SqlParameter("@Empcode", SqlDbType.VarChar, 50)
        arParms(1).Value = HttpContext.Current.Session("EmpCode")

        arParms(2) = New SqlParameter("@UserCode", SqlDbType.VarChar, 50)
        arParms(2).Value = HttpContext.Current.Session("UserCode")

        arParms(3) = New SqlParameter("@EmpID", SqlDbType.Int)
        arParms(3).Value = EL.EmployeeName

        arParms(4) = New SqlParameter("@Experience", SqlDbType.VarChar, 250)
        arParms(4).Value = EL.Experience

        arParms(5) = New SqlParameter("@ExperienceTypeID", SqlDbType.Int)
        arParms(5).Value = EL.ExperienceType

        arParms(6) = New SqlParameter("@Remarks", SqlDbType.VarChar, 250)
        arParms(6).Value = EL.RemarksE

        If EL.FromDate = Nothing Then
            arParms(7) = New SqlParameter("@FromDate", SqlDbType.VarChar)
            arParms(7).Value = DBNull.Value
        Else
            arParms(7) = New SqlParameter("@FromDate", SqlDbType.DateTime)
            arParms(7).Value = EL.FromDate
        End If

        If EL.ToDate = Nothing Then
            arParms(8) = New SqlParameter("@ToDate", SqlDbType.VarChar)
            arParms(8).Value = DBNull.Value
        Else
            arParms(8) = New SqlParameter("@ToDate", SqlDbType.DateTime)
            arParms(8).Value = EL.ToDate
        End If

        arParms(9) = New SqlParameter("@PKID", SqlDbType.Int)
        arParms(9).Value = EL.PKIDE

        ds = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "Proc_InsertEmpExperience", arParms)
        Return ds
    End Function
    Public Function GetEmpExperienceType() As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Dim arParms() As SqlParameter = New SqlParameter(1) {}

        arParms(0) = New SqlParameter("@Office", SqlDbType.VarChar, 50)
        arParms(0).Value = HttpContext.Current.Session("Office")

        arParms(1) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        arParms(1).Value = HttpContext.Current.Session("BranchCode")

        ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Proc_GetEmpExperienceTypeDDL", arParms)
        Return ds.Tables(0)
    End Function
    Public Function GetEmpExperience(ByVal EL As ELEmpQualification) As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Dim arParms() As SqlParameter = New SqlParameter(3) {}

        arParms(0) = New SqlParameter("@Office", SqlDbType.VarChar, 50)
        arParms(0).Value = HttpContext.Current.Session("Office")

        arParms(1) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        arParms(1).Value = HttpContext.Current.Session("BranchCode")

        arParms(2) = New SqlParameter("@PKID", SqlDbType.Int)
        arParms(2).Value = EL.PKIDE

        arParms(3) = New SqlParameter("@EmpID", SqlDbType.Int)
        arParms(3).Value = EL.EmployeeName

        ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Proc_GetEmpExperience", arParms)
        Return ds.Tables(0)
    End Function

    ''' ''' '''''''''''
    Public Function DeleteQualification(ByVal EL As ELEmpQualification) As Integer
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As Integer
        Dim arParms() As SqlParameter = New SqlParameter(0) {}

        arParms(0) = New SqlParameter("@PKID", SqlDbType.Int)
        arParms(0).Value = EL.PKID

        ds = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "Proc_DeleteEmpQualification", arParms)
        Return ds
    End Function
    Public Function InsertQualification(ByVal EL As ELEmpQualification) As Integer
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As Integer
        Dim arParms() As SqlParameter = New SqlParameter(8) {}

        arParms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        arParms(0).Value = HttpContext.Current.Session("BranchCode")

        arParms(1) = New SqlParameter("@Empcode", SqlDbType.VarChar, 50)
        arParms(1).Value = HttpContext.Current.Session("EmpCode")

        arParms(2) = New SqlParameter("@UserCode", SqlDbType.VarChar, 50)
        arParms(2).Value = HttpContext.Current.Session("UserCode")

        arParms(3) = New SqlParameter("@EmpID", SqlDbType.Int)
        arParms(3).Value = EL.EmployeeName

        arParms(4) = New SqlParameter("@Qualification", SqlDbType.VarChar, 250)
        arParms(4).Value = EL.Qualification

        arParms(5) = New SqlParameter("@QualificationTypeID", SqlDbType.Int)
        arParms(5).Value = EL.QualificationType

        arParms(6) = New SqlParameter("@Remarks", SqlDbType.VarChar, 250)
        arParms(6).Value = EL.Remarks

        If EL.Year = Nothing Then
            arParms(7) = New SqlParameter("@Year", SqlDbType.VarChar)
            arParms(7).Value = DBNull.Value
        Else
            arParms(7) = New SqlParameter("@Year", SqlDbType.VarChar, 50)
            arParms(7).Value = EL.Year
        End If

        arParms(8) = New SqlParameter("@PKID", SqlDbType.Int)
        arParms(8).Value = EL.PKID

        ds = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "Proc_InsertEmpQualification", arParms)
        Return ds
    End Function
    Public Function GetEmpQualificationType() As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Dim arParms() As SqlParameter = New SqlParameter(1) {}

        arParms(0) = New SqlParameter("@Office", SqlDbType.VarChar, 50)
        arParms(0).Value = HttpContext.Current.Session("Office")

        arParms(1) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        arParms(1).Value = HttpContext.Current.Session("BranchCode")

        ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Proc_GetEmpQualificationTypeDDL", arParms)
        Return ds.Tables(0)
    End Function
    Public Function GetEmpQualification(ByVal EL As ELEmpQualification) As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Dim arParms() As SqlParameter = New SqlParameter(3) {}

        arParms(0) = New SqlParameter("@Office", SqlDbType.VarChar, 50)
        arParms(0).Value = HttpContext.Current.Session("Office")

        arParms(1) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        arParms(1).Value = HttpContext.Current.Session("BranchCode")

        arParms(2) = New SqlParameter("@PKID", SqlDbType.Int)
        arParms(2).Value = EL.PKID

        arParms(3) = New SqlParameter("@EmpID", SqlDbType.Int)
        arParms(3).Value = EL.EmployeeName

        ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Proc_GetEmpQualification", arParms)
        Return ds.Tables(0)
    End Function
    Public Function GetEmpNameDDL() As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Dim arParms() As SqlParameter = New SqlParameter(1) {}

        arParms(0) = New SqlParameter("@Office", SqlDbType.VarChar, 50)
        arParms(0).Value = HttpContext.Current.Session("Office")

        arParms(1) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        arParms(1).Value = HttpContext.Current.Session("BranchCode")

        ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Proc_GetEmpNameDDL", arParms)
        Return ds.Tables(0)
    End Function
End Class
