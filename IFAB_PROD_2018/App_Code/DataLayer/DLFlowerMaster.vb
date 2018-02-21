Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class DLFlowerMaster
    Shared Function InsertFlowerMaster(ByVal ElFlower As FlowerMaster) As Integer

        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim Rowsaffected As New Integer
        Dim para() As SqlParameter = New SqlParameter(7) {}

        para(0) = New SqlParameter("@FlowerName", SqlDbType.VarChar)
        para(0).Value = ElFlower.FlowerName

        para(1) = New SqlParameter("@FlowerCode", SqlDbType.VarChar)
        para(1).Value = ElFlower.FlowerCode

        para(2) = New SqlParameter("@FlowerCategory", SqlDbType.Int)
        para(2).Value = ElFlower.FlowerCategory

        If ElFlower.Photo = Nothing Then
            para(3) = New SqlParameter("@photo", SqlDbType.VarChar)
            para(3).Value = ""
        Else
            para(3) = New SqlParameter("@photo", SqlDbType.VarChar)
            para(3).Value = ElFlower.Photo
        End If

        para(4) = New SqlParameter("@BranchCode", SqlDbType.VarChar)
        para(4).Value = HttpContext.Current.Session("BranchCode")

        para(5) = New SqlParameter("@Office", SqlDbType.VarChar)
        para(5).Value = HttpContext.Current.Session("Office")

        para(6) = New SqlParameter("@EmpCode", SqlDbType.VarChar)
        para(6).Value = HttpContext.Current.Session("EmpCode")

        para(7) = New SqlParameter("@UserCode", SqlDbType.VarChar)
        para(7).Value = HttpContext.Current.Session("UserCode")

        Try
            Rowsaffected = SqlHelper.ExecuteNonQuery(ConnectionString, CommandType.StoredProcedure, "Proc_InsertFlowerMaster", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return Rowsaffected
    End Function
    Shared Function UpdateFlowerMaster(ByVal ElFlower As FlowerMaster) As Integer

        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim Rowsaffected As New Integer
        Dim para() As SqlParameter = New SqlParameter(8) {}

        para(0) = New SqlParameter("@FlowerName", SqlDbType.VarChar)
        para(0).Value = ElFlower.FlowerName

        para(1) = New SqlParameter("@FlowerCode", SqlDbType.VarChar)
        para(1).Value = ElFlower.FlowerCode

        para(2) = New SqlParameter("@FlowerCategory", SqlDbType.Int)
        para(2).Value = ElFlower.FlowerCategory

        If ElFlower.Photo = Nothing Then
            para(3) = New SqlParameter("@photo", SqlDbType.VarChar)
            para(3).Value = ""
        Else
            para(3) = New SqlParameter("@photo", SqlDbType.VarChar)
            para(3).Value = ElFlower.Photo
        End If

        para(4) = New SqlParameter("@Id", SqlDbType.Int)
        para(4).Value = ElFlower.FlowerId

        para(5) = New SqlParameter("@BranchCode", SqlDbType.VarChar)
        para(5).Value = HttpContext.Current.Session("BranchCode")

        para(6) = New SqlParameter("@Office", SqlDbType.VarChar)
        para(6).Value = HttpContext.Current.Session("Office")

        para(7) = New SqlParameter("@EmpCode", SqlDbType.VarChar)
        para(7).Value = HttpContext.Current.Session("EmpCode")

        para(8) = New SqlParameter("@UserCode", SqlDbType.VarChar)
        para(8).Value = HttpContext.Current.Session("UserCode")
        Try
            Rowsaffected = SqlHelper.ExecuteNonQuery(ConnectionString, CommandType.StoredProcedure, "Proc_UpdateFlowerMaster", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return Rowsaffected
    End Function
    Shared Function GetGridFlowerMaster(ByVal ElFlower As FlowerMaster) As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Dim Parms() As SqlParameter = New SqlParameter(5) {}
        Try
            Parms(0) = New SqlParameter("@Id", SqlDbType.Int)
            Parms(0).Value = ElFlower.FlowerId
            Parms(1) = New SqlParameter("@FlowerCode", SqlDbType.VarChar)
            Parms(1).Value = ElFlower.FlowerCode
            Parms(2) = New SqlParameter("@FlowerName", SqlDbType.VarChar)
            Parms(2).Value = ElFlower.FlowerName
            Parms(3) = New SqlParameter("@FlowerCategory", SqlDbType.Int)
            Parms(3).Value = ElFlower.FlowerCategory
            Parms(4) = New SqlParameter("@BranchCode", SqlDbType.VarChar)
            Parms(4).Value = HttpContext.Current.Session("BranchCode")
            Parms(5) = New SqlParameter("@Office", SqlDbType.VarChar)
            Parms(5).Value = HttpContext.Current.Session("Office")
            'Parms(2) = New SqlParameter("@Office", SqlDbType.VarChar, 1)
            'Parms(2).Value = HttpContext.Current.Session("Office")
            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Proc_GridviewFlowerMaster", Parms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    Shared Function DeleteRecord(ByVal ElFlower As FlowerMaster) As Integer

        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim Rowsaffected As New Integer
        Dim para() As SqlParameter = New SqlParameter(2) {}

        para(0) = New SqlParameter("@Id", SqlDbType.Int)
        para(0).Value = ElFlower.FlowerId
        para(1) = New SqlParameter("@BranchCode", SqlDbType.VarChar)
        para(1).Value = HttpContext.Current.Session("BranchCode")

        para(2) = New SqlParameter("@Office", SqlDbType.VarChar)
        para(2).Value = HttpContext.Current.Session("Office")

        Try
            Rowsaffected = SqlHelper.ExecuteNonQuery(ConnectionString, CommandType.StoredProcedure, "Proc_DeleteFlowerMaster", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return Rowsaffected
    End Function
    Shared Function CheckDuplicate(ByVal ElFlower As FlowerMaster) As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Dim Parms() As SqlParameter = New SqlParameter(2) {}
        Try
            Parms(0) = New SqlParameter("@FlowerId", SqlDbType.Int)
            Parms(0).Value = ElFlower.FlowerId
            Parms(1) = New SqlParameter("@FlowerCode", SqlDbType.VarChar)
            Parms(1).Value = ElFlower.FlowerCode
            Parms(2) = New SqlParameter("@BranchCode", SqlDbType.VarChar)
            Parms(2).Value = HttpContext.Current.Session("BranchCode")
            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Proc_CheckDuplicateFlowerMaster", Parms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
End Class
