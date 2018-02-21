Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
    Public Class DLFlowerCategory
    Public Function InsertFlowerCategory(ByVal EL As ELFlowerCategory) As Integer
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim arParms() As SqlParameter = New SqlParameter(4) {}
        Dim rowsAffected As Integer = 0
        arParms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        arParms(0).Value = HttpContext.Current.Session("BranchCode")
        arParms(1) = New SqlParameter("@UserCode", SqlDbType.VarChar, 50)
        arParms(1).Value = HttpContext.Current.Session("UserCode")
        arParms(2) = New SqlParameter("@EmpCode", SqlDbType.VarChar, 50)
        arParms(2).Value = HttpContext.Current.Session("EmpCode")
        arParms(3) = New SqlParameter("@Office", SqlDbType.VarChar, 50)
        arParms(3).Value = HttpContext.Current.Session("Office")
        arParms(4) = New SqlParameter("@FlowerCategory", Data.SqlDbType.VarChar, 100)
        arParms(4).Value = EL.FlowerCategory
        Try
            rowsAffected = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "InsertFlowerCategory", arParms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return rowsAffected
    End Function
   
    Shared Function DisplayGridview(ByVal EL As ELFlowerCategory) As DataTable

        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        'Dim para() As SqlParameter = New SqlParameter(2) {}
        Dim rowsAffected As Integer = 0
        Dim Params() As SqlParameter = New SqlParameter(3) {}
        Params(0) = New SqlParameter("@id", Data.SqlDbType.Int)
        Params(0).Value = EL.id
        Params(1) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        Params(1).Value = HttpContext.Current.Session("BranchCode")
        Params(2) = New SqlParameter("@Office", SqlDbType.VarChar, 2)
        Params(2).Value = HttpContext.Current.Session("Office")
        Params(3) = New SqlParameter("@FlowerCategory", Data.SqlDbType.VarChar, 100)
        Params(3).Value = EL.FlowerCategory
        Try
            ds = SqlHelper.ExecuteDataset(ConnectionString, CommandType.StoredProcedure, "DisplayFlowerCategory", Params)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
      
    Shared Function UpdateFlowerCategory(ByVal EL As ELFlowerCategory) As Integer
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString

        Dim rowsAffected As Integer = 0
        Dim arParms() As SqlParameter = New SqlParameter(5) {}
        arParms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        arParms(0).Value = HttpContext.Current.Session("BranchCode")
        arParms(1) = New SqlParameter("@UserCode", SqlDbType.VarChar, 50)
        arParms(1).Value = HttpContext.Current.Session("UserCode")
        arParms(2) = New SqlParameter("@EmpCode", SqlDbType.VarChar, 50)
        arParms(2).Value = HttpContext.Current.Session("EmpCode")
        arParms(3) = New SqlParameter("@Office", SqlDbType.VarChar, 50)
        arParms(3).Value = HttpContext.Current.Session("Office")
        arParms(4) = New SqlParameter("@FlowerCategory", Data.SqlDbType.VarChar, 100)
        arParms(4).Value = EL.FlowerCategory
        arParms(5) = New SqlParameter("@id", Data.SqlDbType.Int)
        arParms(5).Value = EL.id


        Try
            rowsAffected = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "UpdateFlowerCategory", arParms)

        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try

        Return rowsAffected
    End Function
    Shared Function CheckDuplicate(ByVal EL As ELFlowerCategory) As Data.DataTable
        Dim connectionstring As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Dim rowsAffected As Integer = 0
        Dim arParms() As SqlParameter = New SqlParameter(2) {}

        arParms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        arParms(0).Value = HttpContext.Current.Session("BranchCode")
        arParms(1) = New SqlParameter("@FlowerCategory", SqlDbType.VarChar, 100)
        arParms(1).Value = EL.FlowerCategory
        arParms(2) = New SqlParameter("@id", SqlDbType.Int)
        arParms(2).Value = EL.id

        Try
            ds = SqlHelper.ExecuteDataset(connectionstring, CommandType.StoredProcedure, "Proc_GetDuplicateFlowerCategory", arParms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)

    End Function
    End Class
