Imports Microsoft.VisualBasic
Imports System.Data.SqlClient

Public Class DLExtraCharges
    Public Function InsertExtraCharges(ByVal EL As ELExtraCharges) As Integer
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim arParms() As SqlParameter = New SqlParameter(10) {}
        Dim rowsAffected As Integer = 0
        arParms(0) = New SqlParameter("@Office", SqlDbType.VarChar, 50)
        arParms(0).Value = HttpContext.Current.Session("Office")
        arParms(1) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        arParms(1).Value = HttpContext.Current.Session("BranchCode")
        arParms(2) = New SqlParameter("@Empcode", SqlDbType.VarChar, 50)
        arParms(2).Value = HttpContext.Current.Session("Empcode")
        arParms(3) = New SqlParameter("@Growerid", SqlDbType.Int)
        arParms(3).Value = EL.Growerid
        arParms(4) = New SqlParameter("@Date", SqlDbType.DateTime)
        arParms(4).Value = EL.StartDate
        'arParms(5) = New SqlParameter("@id", SqlDbType.Int)
        'arParms(5).Value = EL.id
        arParms(5) = New SqlParameter("@UserCode", SqlDbType.VarChar, 50)
        arParms(5).Value = HttpContext.Current.Session("UserCode")
        'If EL.Freight = 0 Then
        '    arParms(6) = New SqlParameter("@Freight", SqlDbType.Float)
        '    arParms(6).Value = DBNull.Value
        'Else
        arParms(6) = New SqlParameter("@Freight", SqlDbType.Float)
        arParms(6).Value = EL.Freight
        'End If
        'If EL.Chemical = 0 Then
        '    arParms(7) = New SqlParameter("@Chemical", SqlDbType.Float)
        '    arParms(7).Value = DBNull.Value
        'Else
        arParms(7) = New SqlParameter("@Chemical", SqlDbType.Float)
        arParms(7).Value = EL.Chemical
        'End If
        'If EL.Fertilizer = 0 Then
        '    arParms(8) = New SqlParameter("@Fertilizer", SqlDbType.Float)
        '    arParms(8).Value = DBNull.Value
        'Else
        arParms(8) = New SqlParameter("@Fertilizer", SqlDbType.Float)
        arParms(8).Value = EL.Fertilizer
        'End If
        'If EL.FlowerPurchase = 0 Then
        '    arParms(9) = New SqlParameter("@FlowerPurchase", SqlDbType.Float)
        '    arParms(9).Value = DBNull.Value
        'Else
        arParms(9) = New SqlParameter("@FlowerPurchase", SqlDbType.Float)
        arParms(9).Value = EL.FlowerPurchase
        'End If
        'If EL.OtherCharges = 0 Then
        '    arParms(10) = New SqlParameter("@OtherCharges", SqlDbType.Float)
        '    arParms(10).Value = DBNull.Value
        'Else
        arParms(10) = New SqlParameter("@OtherCharges", SqlDbType.Float)
        arParms(10).Value = EL.OtherCharges

        'End If
        
        Try
            rowsAffected = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "InsertExtraCharges", arParms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return rowsAffected
    End Function
    Public Function DeleteExtraCharges(ByVal EL As ELExtraCharges) As Integer
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString

        Dim arParms() As SqlParameter = New SqlParameter(0) {}
        Dim rowsAffected As Integer = 0

        arParms(0) = New SqlParameter("@id", SqlDbType.Int)
        arParms(0).Value = EL.id
        rowsAffected = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "proc_DeleteExtraCharges", arParms)
        Return rowsAffected
    End Function
    Shared Function DisplayGridview(ByVal EL As ELExtraCharges) As DataTable

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

        Params(3) = New SqlParameter("@GrowerId", SqlDbType.Int)
        Params(3).Value = EL.Growerid


        Try
            ds = SqlHelper.ExecuteDataset(ConnectionString, CommandType.StoredProcedure, "DisplayExtraCharges", Params)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    Shared Function UpdateExtraCharges(ByVal EL As ELExtraCharges) As Integer
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim rowsAffected As Integer = 0
        Dim arParms() As SqlParameter = New SqlParameter(11) {}
        arParms(0) = New SqlParameter("@Office", SqlDbType.VarChar, 50)
        arParms(0).Value = HttpContext.Current.Session("Office")
        arParms(1) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        arParms(1).Value = HttpContext.Current.Session("BranchCode")
        arParms(2) = New SqlParameter("@Empcode", SqlDbType.VarChar, 50)
        arParms(2).Value = HttpContext.Current.Session("Empcode")
        arParms(3) = New SqlParameter("@Growerid", SqlDbType.Float)
        arParms(3).Value = EL.Growerid
        arParms(4) = New SqlParameter("@Date", SqlDbType.DateTime)
        arParms(4).Value = EL.StartDate
        arParms(5) = New SqlParameter("@id", SqlDbType.Int)
        arParms(5).Value = EL.id
        arParms(6) = New SqlParameter("@UserCode", SqlDbType.VarChar, 50)
        arParms(6).Value = HttpContext.Current.Session("UserCode")
        arParms(7) = New SqlParameter("@Freight", SqlDbType.Float)
        arParms(7).Value = EL.Freight
        arParms(8) = New SqlParameter("@Chemical", SqlDbType.Float)
        arParms(8).Value = EL.Chemical
        arParms(9) = New SqlParameter("@Fertilizer", SqlDbType.Float)
        arParms(9).Value = EL.Fertilizer
        arParms(10) = New SqlParameter("@FlowerPurchase", SqlDbType.Float)
        arParms(10).Value = EL.FlowerPurchase
        arParms(11) = New SqlParameter("@OtherCharges", SqlDbType.Float)
        arParms(11).Value = EL.OtherCharges

        Try
            rowsAffected = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "UpdateExtraCharges", arParms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try

        Return rowsAffected
    End Function
    Shared Function CheckDuplicate(ByVal EL As ELExtraCharges) As Data.DataTable
        Dim connectionstring As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Dim rowsAffected As Integer = 0
        Dim arParms() As SqlParameter = New SqlParameter(3) {}

        arParms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        arParms(0).Value = HttpContext.Current.Session("BranchCode")
        arParms(1) = New SqlParameter("@StartDate", SqlDbType.DateTime)
        arParms(1).Value = EL.StartDate
        arParms(2) = New SqlParameter("@Growerid", SqlDbType.Int)
        arParms(2).Value = EL.Growerid
        arParms(3) = New SqlParameter("@id", SqlDbType.Int)
        arParms(3).Value = EL.id

        Try
            ds = SqlHelper.ExecuteDataset(connectionstring, CommandType.StoredProcedure, "Proc_GetDuplicateExtraCharges", arParms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)

    End Function
    Public Function GetDDlGrowerName() As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Dim arParms() As SqlParameter = New SqlParameter(1) {}

        arParms(0) = New SqlParameter("@Office", SqlDbType.VarChar, 50)
        arParms(0).Value = HttpContext.Current.Session("Office")

        arParms(1) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        arParms(1).Value = HttpContext.Current.Session("BranchCode")

        ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Proc_GetGrowerNameDDL", arParms)
        Return ds.Tables(0)
    End Function
End Class


