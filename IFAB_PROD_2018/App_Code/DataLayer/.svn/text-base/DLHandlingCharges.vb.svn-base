Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Public Class DLHandlingCharges
    Public Function InsertHandlingCharges(ByVal EL As ELHandlingCharges) As Integer
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim arParms() As SqlParameter = New SqlParameter(9) {}
        Dim rowsAffected As Integer = 0
        arParms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        arParms(0).Value = HttpContext.Current.Session("BranchCode")
        arParms(1) = New SqlParameter("@UserCode", SqlDbType.VarChar, 50)
        arParms(1).Value = HttpContext.Current.Session("UserCode")
        arParms(2) = New SqlParameter("@EmpCode", SqlDbType.VarChar, 50)
        arParms(2).Value = HttpContext.Current.Session("EmpCode")
        arParms(3) = New SqlParameter("@Office", SqlDbType.VarChar, 50)
        arParms(3).Value = HttpContext.Current.Session("Office")
        arParms(4) = New SqlParameter("@FromDate", Data.SqlDbType.DateTime)
        arParms(4).Value = EL.FromDate
        arParms(5) = New SqlParameter("@ToDate", Data.SqlDbType.DateTime)
        arParms(5).Value = EL.ToDate
        arParms(6) = New SqlParameter("@ChargesForBuyerPerc", Data.SqlDbType.Float)
        arParms(6).Value = EL.ChargesForBuyerPerc
        arParms(7) = New SqlParameter("@ChargesForSellerPerc", Data.SqlDbType.Float)
        arParms(7).Value = EL.ChargesForSellerPerc
        arParms(8) = New SqlParameter("@MinChargesForBuyer", Data.SqlDbType.Money)
        arParms(8).Value = EL.MinChargesForBuyer
        arParms(9) = New SqlParameter("@PenaltyCharges", Data.SqlDbType.Float)
        arParms(9).Value = EL.PenaltyCharges

        Try
            rowsAffected = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "InsertHandlingCharges", arParms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return rowsAffected
    End Function
    Public Function DeleteHandlingCharges(ByVal EL As ELHandlingCharges) As Integer
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString

        Dim arParms() As SqlParameter = New SqlParameter(0) {}
        Dim rowsAffected As Integer = 0

        arParms(0) = New SqlParameter("@id", SqlDbType.Int)
        arParms(0).Value = EL.id
        rowsAffected = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "proc_DeleteHandlingCharges", arParms)
        Return rowsAffected
    End Function
    Shared Function DisplayGridview(ByVal EL As ELHandlingCharges) As DataTable

        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        'Dim para() As SqlParameter = New SqlParameter(2) {}
        Dim rowsAffected As Integer = 0
        Dim Params() As SqlParameter = New SqlParameter(2) {}
        Params(0) = New SqlParameter("@id", Data.SqlDbType.Int)
        Params(0).Value = EL.id

        Params(1) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        Params(1).Value = HttpContext.Current.Session("BranchCode")

        Params(2) = New SqlParameter("@Office", SqlDbType.VarChar, 2)
        Params(2).Value = HttpContext.Current.Session("Office")

       


        Try
            ds = SqlHelper.ExecuteDataset(ConnectionString, CommandType.StoredProcedure, "DisplayHandlingCharges", Params)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    'Shared Function GetHandling() As DataTable
    '    Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
    '    Dim dt As DataSet

    '    Dim arParms() As SqlParameter = New SqlParameter(0) {}

    '    arParms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
    '    arParms(0).Value = HttpContext.Current.Session("BranchCode")


    '    Try
    '        dt = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "GetHandlingCharge", arParms)
    '        Return dt.Tables(0)
    '    Catch ex As Exception
    '        MsgBox(ex.ToString)
    '    End Try

    'End Function
    Shared Function UpdateHandlingCharges(ByVal EL As ELHandlingCharges) As Integer
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString

        Dim rowsAffected As Integer = 0
        Dim arParms() As SqlParameter = New SqlParameter(9) {}
        arParms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        arParms(0).Value = HttpContext.Current.Session("BranchCode")
        arParms(1) = New SqlParameter("@UserCode", SqlDbType.VarChar, 50)
        arParms(1).Value = HttpContext.Current.Session("UserCode")
        arParms(2) = New SqlParameter("@EmpCode", SqlDbType.VarChar, 50)
        arParms(2).Value = HttpContext.Current.Session("EmpCode")
        arParms(3) = New SqlParameter("@FromDate", Data.SqlDbType.DateTime)
        arParms(3).Value = EL.FromDate
        arParms(4) = New SqlParameter("@ToDate", Data.SqlDbType.DateTime)
        arParms(4).Value = EL.ToDate
        
        arParms(5) = New SqlParameter("@ChargesForBuyerPerc", Data.SqlDbType.Float)
        arParms(5).Value = EL.ChargesForBuyerPerc
        arParms(6) = New SqlParameter("@ChargesForSellerPerc", Data.SqlDbType.Float)
        arParms(6).Value = EL.ChargesForSellerPerc
        arParms(7) = New SqlParameter("@MinChargesForBuyer", Data.SqlDbType.Money)
        arParms(7).Value = EL.MinChargesForBuyer
        arParms(8) = New SqlParameter("@PenaltyCharges", Data.SqlDbType.Float)
        arParms(8).Value = EL.PenaltyCharges
        arParms(9) = New SqlParameter("@id", Data.SqlDbType.Int)
        arParms(9).Value = EL.id


        Try
            rowsAffected = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "UpdateHandlingCharges", arParms)

        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try

        Return rowsAffected
    End Function
    Shared Function CheckDuplicate(ByVal EL As ELHandlingCharges) As Data.DataTable
        Dim connectionstring As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Dim rowsAffected As Integer = 0
        Dim arParms() As SqlParameter = New SqlParameter(3) {}

        arParms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        arParms(0).Value = HttpContext.Current.Session("BranchCode")
        arParms(1) = New SqlParameter("@FromDate", SqlDbType.DateTime)
        arParms(1).Value = EL.FromDate
        arParms(2) = New SqlParameter("@ToDate", SqlDbType.DateTime)
        arParms(2).Value = EL.ToDate
        arParms(3) = New SqlParameter("@id", SqlDbType.Int)
        arParms(3).Value = EL.id

        Try
            ds = SqlHelper.ExecuteDataset(connectionstring, CommandType.StoredProcedure, "Proc_GetDuplicateHandlingCharges", arParms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)

    End Function
End Class
