Imports Microsoft.VisualBasic
Imports System.Data.SqlClient

Public Class DLIfabReportsR
    Shared Function Proc_GetGrowerNameDDLALL() As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Try
            Dim Parms() As SqlParameter = New SqlParameter(1) {}

            Parms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
            Parms(0).Value = HttpContext.Current.Session("BranchCode")

            Parms(1) = New SqlParameter("@Office", SqlDbType.VarChar, 2)
            Parms(1).Value = HttpContext.Current.Session("Office")

            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Proc_GetGrowerNameDDLALL", Parms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    Shared Function Rpt_GoodsReceivedNote(ByVal GrowerId As Integer, ByVal EntryDate As DateTime) As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Try
            Dim Parms() As SqlParameter = New SqlParameter(3) {}

            Parms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
            Parms(0).Value = HttpContext.Current.Session("BranchCode")

            Parms(1) = New SqlParameter("@Office", SqlDbType.VarChar, 2)
            Parms(1).Value = HttpContext.Current.Session("Office")

            Parms(2) = New SqlParameter("@GrowerId", SqlDbType.Int)
            Parms(2).Value = GrowerId

            Parms(3) = New SqlParameter("@Date", SqlDbType.DateTime)
            Parms(3).Value = EntryDate


            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Rpt_GoodsReceivedNote", Parms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    Shared Function Proc_GetFlowerNameDDLALL() As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Try
            Dim Parms() As SqlParameter = New SqlParameter(1) {}

            Parms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
            Parms(0).Value = HttpContext.Current.Session("BranchCode")

            Parms(1) = New SqlParameter("@Office", SqlDbType.VarChar, 2)
            Parms(1).Value = HttpContext.Current.Session("Office")

            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Proc_GetFlowerNameDDLALL", Parms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    Shared Function Rpt_FlowerPerformance(ByVal FlowerId As Integer, ByVal FromDate As DateTime, ByVal Todate As DateTime) As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Try
            Dim Parms() As SqlParameter = New SqlParameter(4) {}

            Parms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
            Parms(0).Value = HttpContext.Current.Session("BranchCode")

            Parms(1) = New SqlParameter("@Office", SqlDbType.VarChar, 2)
            Parms(1).Value = HttpContext.Current.Session("Office")

            Parms(2) = New SqlParameter("@FlowerId", SqlDbType.Int)
            Parms(2).Value = FlowerId

            Parms(3) = New SqlParameter("@FromDate", SqlDbType.DateTime)
            Parms(3).Value = FromDate

            Parms(4) = New SqlParameter("@ToDate", SqlDbType.DateTime)
            Parms(4).Value = Todate

            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Rpt_FlowerPerformance", Parms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    Shared Function Proc_GetBuyerDDLALL() As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Try
            Dim Parms() As SqlParameter = New SqlParameter(1) {}

            Parms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
            Parms(0).Value = HttpContext.Current.Session("BranchCode")

            Parms(1) = New SqlParameter("@Office", SqlDbType.VarChar, 2)
            Parms(1).Value = HttpContext.Current.Session("Office")

            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Proc_GetBuyerDDLALL", Parms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    Shared Function Rpt_CashBillReport(ByVal BuyerId As Integer, ByVal AuctionDate As DateTime, ByVal CashBillNo As String) As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Try
            Dim Parms() As SqlParameter = New SqlParameter(4) {}

            Parms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
            Parms(0).Value = HttpContext.Current.Session("BranchCode")

            Parms(1) = New SqlParameter("@Office", SqlDbType.VarChar, 2)
            Parms(1).Value = HttpContext.Current.Session("Office")

            Parms(2) = New SqlParameter("@BuyerId", SqlDbType.Int)
            Parms(2).Value = BuyerId

            Parms(3) = New SqlParameter("@AuctionDate", SqlDbType.DateTime)
            Parms(3).Value = AuctionDate

            Parms(4) = New SqlParameter("@CashBillNo", SqlDbType.VarChar)
            Parms(4).Value = CashBillNo

            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Rpt_CashBillReport", Parms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    Shared Function Rpt_CommisionBillReport(ByVal GrowerId As Integer, ByVal FlowerId As Integer, ByVal AuctionDate As DateTime) As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Try
            Dim Parms() As SqlParameter = New SqlParameter(4) {}

            Parms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
            Parms(0).Value = HttpContext.Current.Session("BranchCode")

            Parms(1) = New SqlParameter("@Office", SqlDbType.VarChar, 2)
            Parms(1).Value = HttpContext.Current.Session("Office")

            Parms(2) = New SqlParameter("@GrowerId", SqlDbType.Int)
            Parms(2).Value = GrowerId

            Parms(3) = New SqlParameter("@FlowerId", SqlDbType.Int)
            Parms(3).Value = FlowerId

            Parms(4) = New SqlParameter("@AuctionDate", SqlDbType.DateTime)
            Parms(4).Value = AuctionDate

            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Rpt_CommisionBillReport", Parms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    Shared Function Proc_GetFlowerCategoryDDLALL() As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Try
            Dim Parms() As SqlParameter = New SqlParameter(1) {}

            Parms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
            Parms(0).Value = HttpContext.Current.Session("BranchCode")

            Parms(1) = New SqlParameter("@Office", SqlDbType.VarChar, 2)
            Parms(1).Value = HttpContext.Current.Session("Office")

            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Proc_GetFlowerCategoryDDLALL", Parms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    Shared Function Proc_GetYear() As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Try
            Dim Parms() As SqlParameter = New SqlParameter(1) {}

            Parms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
            Parms(0).Value = HttpContext.Current.Session("BranchCode")

            Parms(1) = New SqlParameter("@Office", SqlDbType.VarChar, 2)
            Parms(1).Value = HttpContext.Current.Session("Office")

            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Proc_GetYear", Parms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    Shared Function Rpt_WeeklySalesReport(ByVal GrowerId As Integer, ByVal Week As String, ByVal Month As String, ByVal Year As String) As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Try
            Dim Parms() As SqlParameter = New SqlParameter(5) {}

            Parms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
            Parms(0).Value = HttpContext.Current.Session("BranchCode")

            Parms(1) = New SqlParameter("@Office", SqlDbType.VarChar, 2)
            Parms(1).Value = HttpContext.Current.Session("Office")

            Parms(2) = New SqlParameter("@GrowerId", SqlDbType.Int)
            Parms(2).Value = GrowerId

            Parms(3) = New SqlParameter("@Week", SqlDbType.VarChar)
            Parms(3).Value = Week

            Parms(4) = New SqlParameter("@Month", SqlDbType.VarChar)
            Parms(4).Value = Month

            Parms(5) = New SqlParameter("@Year", SqlDbType.VarChar)
            Parms(5).Value = Year

            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Rpt_WeeklySalesReport", Parms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    Shared Function GetCashBillNo(ByVal BuyerId As Integer) As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Try
            Dim Parms() As SqlParameter = New SqlParameter(2) {}

            Parms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
            Parms(0).Value = HttpContext.Current.Session("BranchCode")

            Parms(1) = New SqlParameter("@Office", SqlDbType.VarChar, 2)
            Parms(1).Value = HttpContext.Current.Session("Office")

            Parms(2) = New SqlParameter("@BuyerId", SqlDbType.Int)
            Parms(2).Value = BuyerId

            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Proc_GetCashBillNo", Parms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    Shared Function GetCommissionBillNo(ByVal GrowerId As Integer) As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Try
            Dim Parms() As SqlParameter = New SqlParameter(2) {}

            Parms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
            Parms(0).Value = HttpContext.Current.Session("BranchCode")

            Parms(1) = New SqlParameter("@Office", SqlDbType.VarChar, 2)
            Parms(1).Value = HttpContext.Current.Session("Office")

            Parms(2) = New SqlParameter("@GrowerId", SqlDbType.Int)
            Parms(2).Value = GrowerId

            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Proc_GetCommissionBillNo", Parms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    Shared Function Rpt_CashBillReportDraft(ByVal BuyerId As Integer, ByVal CashBillNo As String) As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Try
            Dim Parms() As SqlParameter = New SqlParameter(3) {}

            Parms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
            Parms(0).Value = HttpContext.Current.Session("BranchCode")

            Parms(1) = New SqlParameter("@Office", SqlDbType.VarChar, 2)
            Parms(1).Value = HttpContext.Current.Session("Office")

            Parms(2) = New SqlParameter("@BuyerId", SqlDbType.Int)
            Parms(2).Value = BuyerId

            Parms(3) = New SqlParameter("@CashBillNo", SqlDbType.VarChar)
            Parms(3).Value = CashBillNo

            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Rpt_CashBillReportDraft", Parms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    Shared Function RptFlwGrowerPerformance(ByVal GrowerId As Integer, ByVal FlowerId As Integer, ByVal FromDate As DateTime, ByVal Todate As DateTime) As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Dim arParms() As SqlParameter = New SqlParameter(5) {}
        arParms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        arParms(0).Value = HttpContext.Current.Session("BranchCode")


        arParms(1) = New SqlParameter("@Office", SqlDbType.VarChar, 20)
        arParms(1).Value = HttpContext.Current.Session("Office")

        arParms(2) = New SqlParameter("@FromDate", SqlDbType.DateTime)
        arParms(2).Value = FromDate

        arParms(3) = New SqlParameter("@ToDate", SqlDbType.DateTime)
        arParms(3).Value = Todate

        arParms(4) = New SqlParameter("@GrowerID", SqlDbType.Int)
        arParms(4).Value = GrowerId

        arParms(5) = New SqlParameter("@FlowerId", SqlDbType.Int)
        arParms(5).Value = FlowerId

        Try
            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Rpt_flowerVarietyGrowerPerformance", arParms)

        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    Shared Function Proc_GetFlowerNameDDL() As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Try
            Dim Parms() As SqlParameter = New SqlParameter(1) {}

            Parms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
            Parms(0).Value = HttpContext.Current.Session("BranchCode")

            Parms(1) = New SqlParameter("@Office", SqlDbType.VarChar, 2)
            Parms(1).Value = HttpContext.Current.Session("Office")

            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Proc_GetFlowerNameDDL", Parms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function

End Class
