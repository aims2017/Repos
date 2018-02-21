Imports System.Data.SqlClient
Imports Microsoft.VisualBasic

Public Class DLInvoice
    Shared Function DispGrid() As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Dim arParms() As SqlParameter = New SqlParameter(1) {}

        arParms(0) = New SqlParameter("@Buyer_id", SqlDbType.Int)
        arParms(0).Value = HttpContext.Current.Session("Buyerid")

        arParms(1) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        arParms(1).Value = HttpContext.Current.Session("BranchCode")

        Try
            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "[proc_Invoice]", arParms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    Shared Function GetKey() As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Dim arParms() As SqlParameter = New SqlParameter(0) {}



        arParms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        arParms(0).Value = HttpContext.Current.Session("BranchCode")

        Try
            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "[Get_PaymentKey]", arParms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function

    Shared Function InsertInvoice(ByVal c As Invoice) As Integer

        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString

        Dim rowsAffected As Integer = 0

        Dim arParms() As SqlParameter = New SqlParameter(10) {}

        arParms(0) = New SqlParameter("@Buyer_id", SqlDbType.Int)
        arParms(0).Value = HttpContext.Current.Session("Buyerid")

        arParms(1) = New SqlParameter("@Invoice_NO ", SqlDbType.Char)
        arParms(1).Value = c.Invoice_NO

        arParms(2) = New SqlParameter("@Invoice_Amount", SqlDbType.Money)
        arParms(2).Value = c.Invoice_Amount

        arParms(3) = New SqlParameter("@Amount_Paid ", SqlDbType.Money)
        arParms(3).Value = c.Amount_Paid

        arParms(4) = New SqlParameter("@UTR_NO", SqlDbType.Int)
        arParms(4).Value = c.UTR_NO

        arParms(5) = New SqlParameter("@Pay_Mode", SqlDbType.Int)
        arParms(5).Value = c.Pay_Mode

        arParms(6) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        arParms(6).Value = HttpContext.Current.Session("BranchCode")

        arParms(7) = New SqlParameter("@UserCode", SqlDbType.VarChar, 50)
        arParms(7).Value = HttpContext.Current.Session("UserName")

        arParms(8) = New SqlParameter("@Emp_Code", SqlDbType.VarChar, 50)
        arParms(8).Value = HttpContext.Current.Session("StudentCode")

        arParms(9) = New SqlParameter("@TransactionDate", SqlDbType.DateTime)
        arParms(9).Value = c.Transactiondate

        arParms(10) = New SqlParameter("@AuctionDate", SqlDbType.DateTime)
        arParms(10).Value = HttpContext.Current.Session("AuctionDate")

        Try
            rowsAffected = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "Proc_InsertInvoice", arParms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try

        Return rowsAffected
    End Function
    Shared Function UpdateInvoice(ByVal c As Invoice) As Integer

        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString

        Dim rowsAffected As Integer = 0

        Dim arParms() As SqlParameter = New SqlParameter(4) {}

        arParms(0) = New SqlParameter("@Buyer_id", SqlDbType.Int)
        arParms(0).Value = HttpContext.Current.Session("Buyerid")


        arParms(1) = New SqlParameter("@Invoice_NO ", SqlDbType.Char)
        arParms(1).Value = HttpContext.Current.Session("Invoice_NO")

        arParms(2) = New SqlParameter("@UTR_NO", SqlDbType.Int)
        arParms(2).Value = c.UTR_NO

        arParms(3) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        arParms(3).Value = HttpContext.Current.Session("BranchCode")

        arParms(4) = New SqlParameter("@TransactionDate", SqlDbType.DateTime)
        arParms(4).Value = c.Transactiondate

        Try
            rowsAffected = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "Proc_UpdateInvoice", arParms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try

        Return rowsAffected
    End Function
End Class
