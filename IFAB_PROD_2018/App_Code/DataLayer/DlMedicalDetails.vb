Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Public Class DlMedicalDetails
    Shared Function Insert(ByVal m As ElMedicalDetails) As Integer
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim rowsAffected As Integer = 0
        Dim Parms() As SqlParameter = New SqlParameter(14) {}
        Parms(0) = New SqlParameter("@Std_ID", SqlDbType.Int)
        Parms(0).Value = m.Std_ID

        Parms(1) = New SqlParameter("@Height", SqlDbType.VarChar, 50)
        Parms(1).Value = m.Height

        Parms(2) = New SqlParameter("@Weight", SqlDbType.VarChar, 50)
        Parms(2).Value = m.Weight

        Parms(3) = New SqlParameter("@IdentificationMark", SqlDbType.VarChar, 500)
        Parms(3).Value = m.IdentificationMark

        Parms(4) = New SqlParameter("@BloodGroup", SqlDbType.VarChar, 50)
        Parms(4).Value = m.BloodGroup

        Parms(5) = New SqlParameter("@ImmunizationRecord", SqlDbType.VarChar, 500)
        Parms(5).Value = m.ImmunizationRecord

        Parms(6) = New SqlParameter("@Detailsofanyseriousillness", SqlDbType.VarChar, 500)
        Parms(6).Value = m.Detailsofanyseriousillness

        Parms(7) = New SqlParameter("@Particularsofanyallergies", SqlDbType.VarChar, 500)
        Parms(7).Value = m.Particularsofanyallergies

        Parms(8) = New SqlParameter("@EmergencyContactName", SqlDbType.VarChar, 100)
        Parms(8).Value = m.EmergencyContactName

        Parms(9) = New SqlParameter("@EmergencyContactNumber", SqlDbType.VarChar, 150)
        Parms(9).Value = m.EmergencyContactNumber

        Parms(10) = New SqlParameter("@Disabilitiesifany", SqlDbType.VarChar, 500)
        Parms(10).Value = m.Disabilitiesifany

        Parms(11) = New SqlParameter("@UserCode", SqlDbType.VarChar, 50)
        Parms(11).Value = HttpContext.Current.Session("UserCode")

        Parms(12) = New SqlParameter("@EmpCode", SqlDbType.VarChar, 50)
        Parms(12).Value = HttpContext.Current.Session("EmpCode")

        Parms(13) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        Parms(13).Value = HttpContext.Current.Session("BranchCode")

        Parms(14) = New SqlParameter("@LoginType", SqlDbType.VarChar, 50)
        Parms(14).Value = m.LoginType
        Try
            rowsAffected = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "proc_InsertMedicalDetails", Parms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return rowsAffected
    End Function
    Shared Function InsertEmp(ByVal m As ElMedicalDetails) As Integer
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim rowsAffected As Integer = 0
        Dim Parms() As SqlParameter = New SqlParameter(14) {}
        Parms(0) = New SqlParameter("@Emp_Id", SqlDbType.Int)
        Parms(0).Value = m.Emp_Id

        Parms(1) = New SqlParameter("@Height", SqlDbType.VarChar, 50)
        Parms(1).Value = m.Height

        Parms(2) = New SqlParameter("@Weight", SqlDbType.VarChar, 50)
        Parms(2).Value = m.Weight

        Parms(3) = New SqlParameter("@IdentificationMark", SqlDbType.VarChar, 500)
        Parms(3).Value = m.IdentificationMark

        Parms(4) = New SqlParameter("@BloodGroup", SqlDbType.VarChar, 50)
        Parms(4).Value = m.BloodGroup

        Parms(5) = New SqlParameter("@ImmunizationRecord", SqlDbType.VarChar, 500)
        Parms(5).Value = m.ImmunizationRecord

        Parms(6) = New SqlParameter("@Detailsofanyseriousillness", SqlDbType.VarChar, 500)
        Parms(6).Value = m.Detailsofanyseriousillness

        Parms(7) = New SqlParameter("@Particularsofanyallergies", SqlDbType.VarChar, 500)
        Parms(7).Value = m.Particularsofanyallergies

        Parms(8) = New SqlParameter("@EmergencyContactName", SqlDbType.VarChar, 100)
        Parms(8).Value = m.EmergencyContactName

        Parms(9) = New SqlParameter("@EmergencyContactNumber", SqlDbType.VarChar, 150)
        Parms(9).Value = m.EmergencyContactNumber

        Parms(10) = New SqlParameter("@Disabilitiesifany", SqlDbType.VarChar, 500)
        Parms(10).Value = m.Disabilitiesifany

        Parms(11) = New SqlParameter("@UserCode", SqlDbType.VarChar, 50)
        Parms(11).Value = HttpContext.Current.Session("UserCode")

        Parms(12) = New SqlParameter("@EmpCode", SqlDbType.VarChar, 50)
        Parms(12).Value = HttpContext.Current.Session("EmpCode")

        Parms(13) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        Parms(13).Value = HttpContext.Current.Session("BranchCode")

        Parms(14) = New SqlParameter("@LoginType", SqlDbType.VarChar, 50)
        Parms(14).Value = m.LoginType
        Try
            rowsAffected = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "proc_InsertEmpMedicalDetails", Parms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return rowsAffected
    End Function
    Shared Function Update(ByVal m As ElMedicalDetails) As Integer
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim rowsAffected As Integer = 0
        Dim Parms() As SqlParameter = New SqlParameter(15) {}
        Parms(0) = New SqlParameter("@Std_ID", SqlDbType.Int)
        Parms(0).Value = m.Std_ID

        Parms(1) = New SqlParameter("@Height", SqlDbType.VarChar, 50)
        Parms(1).Value = m.Height

        Parms(2) = New SqlParameter("@Weight", SqlDbType.VarChar, 50)
        Parms(2).Value = m.Weight

        Parms(3) = New SqlParameter("@IdentificationMark", SqlDbType.VarChar, 500)
        Parms(3).Value = m.IdentificationMark

        Parms(4) = New SqlParameter("@BloodGroup", SqlDbType.VarChar, 50)
        Parms(4).Value = m.BloodGroup

        Parms(5) = New SqlParameter("@ImmunizationRecord", SqlDbType.VarChar, 500)
        Parms(5).Value = m.ImmunizationRecord

        Parms(6) = New SqlParameter("@Detailsofanyseriousillness", SqlDbType.VarChar, 500)
        Parms(6).Value = m.Detailsofanyseriousillness

        Parms(7) = New SqlParameter("@Particularsofanyallergies", SqlDbType.VarChar, 500)
        Parms(7).Value = m.Particularsofanyallergies

        Parms(8) = New SqlParameter("@EmergencyContactName", SqlDbType.VarChar, 100)
        Parms(8).Value = m.EmergencyContactName

        Parms(9) = New SqlParameter("@EmergencyContactNumber", SqlDbType.VarChar, 150)
        Parms(9).Value = m.EmergencyContactNumber

        Parms(10) = New SqlParameter("@Disabilitiesifany", SqlDbType.VarChar, 500)
        Parms(10).Value = m.Disabilitiesifany

        Parms(11) = New SqlParameter("@UserCode", SqlDbType.VarChar, 50)
        Parms(11).Value = HttpContext.Current.Session("UserCode")

        Parms(12) = New SqlParameter("@EmpCode", SqlDbType.VarChar, 50)
        Parms(12).Value = HttpContext.Current.Session("EmpCode")

        Parms(13) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        Parms(13).Value = HttpContext.Current.Session("BranchCode")

        Parms(14) = New SqlParameter("@LoginType", SqlDbType.VarChar, 50)
        Parms(14).Value = m.LoginType

        Parms(15) = New SqlParameter("@ID", SqlDbType.Int)
        Parms(15).Value = m.Id
        Try
            rowsAffected = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "proc_UpdateMedicalDetails", Parms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return rowsAffected
    End Function
    Shared Function UpdateEmp(ByVal m As ElMedicalDetails) As Integer
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim rowsAffected As Integer = 0
        Dim Parms() As SqlParameter = New SqlParameter(15) {}
        Parms(0) = New SqlParameter("@Emp_Id", SqlDbType.Int)
        Parms(0).Value = m.Emp_Id

        Parms(1) = New SqlParameter("@Height", SqlDbType.VarChar, 50)
        Parms(1).Value = m.Height

        Parms(2) = New SqlParameter("@Weight", SqlDbType.VarChar, 50)
        Parms(2).Value = m.Weight

        Parms(3) = New SqlParameter("@IdentificationMark", SqlDbType.VarChar, 500)
        Parms(3).Value = m.IdentificationMark

        Parms(4) = New SqlParameter("@BloodGroup", SqlDbType.VarChar, 50)
        Parms(4).Value = m.BloodGroup

        Parms(5) = New SqlParameter("@ImmunizationRecord", SqlDbType.VarChar, 500)
        Parms(5).Value = m.ImmunizationRecord

        Parms(6) = New SqlParameter("@Detailsofanyseriousillness", SqlDbType.VarChar, 500)
        Parms(6).Value = m.Detailsofanyseriousillness

        Parms(7) = New SqlParameter("@Particularsofanyallergies", SqlDbType.VarChar, 500)
        Parms(7).Value = m.Particularsofanyallergies

        Parms(8) = New SqlParameter("@EmergencyContactName", SqlDbType.VarChar, 100)
        Parms(8).Value = m.EmergencyContactName

        Parms(9) = New SqlParameter("@EmergencyContactNumber", SqlDbType.VarChar, 150)
        Parms(9).Value = m.EmergencyContactNumber

        Parms(10) = New SqlParameter("@Disabilitiesifany", SqlDbType.VarChar, 500)
        Parms(10).Value = m.Disabilitiesifany

        Parms(11) = New SqlParameter("@UserCode", SqlDbType.VarChar, 50)
        Parms(11).Value = HttpContext.Current.Session("UserCode")

        Parms(12) = New SqlParameter("@EmpCode", SqlDbType.VarChar, 50)
        Parms(12).Value = HttpContext.Current.Session("EmpCode")

        Parms(13) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        Parms(13).Value = HttpContext.Current.Session("BranchCode")

        Parms(14) = New SqlParameter("@LoginType", SqlDbType.VarChar, 50)
        Parms(14).Value = m.LoginType

        Parms(15) = New SqlParameter("@ID", SqlDbType.Int)
        Parms(15).Value = m.Id
        Try
            rowsAffected = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "proc_UpdateEmpMedicalDetails", Parms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return rowsAffected
    End Function
    Shared Function GetData(ByVal m As ElMedicalDetails) As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim dt As New DataSet
        Dim Parms() As SqlParameter = New SqlParameter(4) {}
        Parms(0) = New SqlParameter("@ID", SqlDbType.Int)
        Parms(0).Value = m.Id

        Parms(1) = New SqlParameter("@Std_ID", SqlDbType.Int)
        Parms(1).Value = m.Std_ID

        Parms(2) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        Parms(2).Value = HttpContext.Current.Session("BranchCode")

        Parms(3) = New SqlParameter("@LoginType", SqlDbType.VarChar, 50)
        Parms(3).Value = m.LoginType

        Parms(4) = New SqlParameter("@Office", SqlDbType.VarChar, 50)
        Parms(4).Value = HttpContext.Current.Session("Office")
        Try
            dt = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "proc_GetMedicalDetails", Parms)
            Return dt.Tables(0)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
    End Function
    Shared Function GetEmpData(ByVal m As ElMedicalDetails) As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim dt As New DataSet
        Dim Parms() As SqlParameter = New SqlParameter(4) {}
        Parms(0) = New SqlParameter("@ID", SqlDbType.Int)
        Parms(0).Value = m.Id

        Parms(1) = New SqlParameter("@Emp_Id", SqlDbType.Int)
        Parms(1).Value = m.Emp_Id

        Parms(2) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        Parms(2).Value = HttpContext.Current.Session("BranchCode")

        Parms(3) = New SqlParameter("@LoginType", SqlDbType.VarChar, 50)
        Parms(3).Value = m.LoginType

        Parms(4) = New SqlParameter("@Office", SqlDbType.VarChar, 50)
        Parms(4).Value = HttpContext.Current.Session("Office")
        Try
            dt = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "proc_GetEmpMedicalDetails", Parms)
            Return dt.Tables(0)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
    End Function
    Shared Function GetDuplicate(ByVal m As ElMedicalDetails) As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim dt As New DataSet
        Dim Parms() As SqlParameter = New SqlParameter(3) {}
        Parms(0) = New SqlParameter("@ID", SqlDbType.Int)
        Parms(0).Value = m.Id

        Parms(1) = New SqlParameter("@Std_ID", SqlDbType.Float)
        Parms(1).Value = m.Std_ID

        Parms(2) = New SqlParameter("@BranchCode", SqlDbType.Float)
        Parms(2).Value = HttpContext.Current.Session("BranchCode")

        Parms(3) = New SqlParameter("@LoginType", SqlDbType.VarChar, 50)
        Parms(3).Value = m.LoginType
        Try
            dt = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "proc_GetDuplicateMedicalDetails", Parms)
            Return dt.Tables(0)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
    End Function
    'Shared Function GetDelete(ByVal m As ElMedicalDetails) As Integer
    '    Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
    '    Dim rowsAffected As String = ""
    '    Try
    '        rowsAffected = SqlHelper.ExecuteNonQuery(connectionString, "update MedicalDetails set MedicalDetails.Del_Flag='Y' where id=" + m.Id)
    '    Catch ex As Exception
    '        MsgBox(ex.ToString)
    '    End Try
    '    Return rowsAffected
    'End Function
    'Code written by Niraj on 12 July 2013
    Shared Function RptMedicalDetails(ByVal m As ElMedicalDetails) As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim dt As New DataSet
        Dim Parms() As SqlParameter = New SqlParameter(3) {}

        Parms(0) = New SqlParameter("@Std_ID", SqlDbType.Int)
        Parms(0).Value = m.Std_ID

        Parms(1) = New SqlParameter("@BranchCode", SqlDbType.Float)
        Parms(1).Value = HttpContext.Current.Session("BranchCode")

        Parms(2) = New SqlParameter("@LoginType", SqlDbType.VarChar, 500)
        Parms(2).Value = HttpContext.Current.Session("LoginType")

        Parms(3) = New SqlParameter("@Office", SqlDbType.VarChar, 50)
        Parms(3).Value = HttpContext.Current.Session("Office")
        Try
            dt = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Rpt_GetMedicalDetails", Parms)
            Return dt.Tables(0)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
    End Function
    Shared Function GetDelete(ByVal m As ElMedicalDetails) As Integer
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim rowsAffected As Integer = 0
        Dim arParms() As SqlParameter = New SqlParameter(0) {}

        arParms(0) = New SqlParameter("@Id", SqlDbType.Int)
        arParms(0).Value = m.Id

        Try
            rowsAffected = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "Proc_DeleteEmpMedical", arParms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try

        Return rowsAffected
    End Function
End Class