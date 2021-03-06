﻿Imports Microsoft.VisualBasic
Imports System.Data.SqlClient

Public Class InDockDL
    Public Shared Function Insert(ByVal InD As InDockEL) As Integer
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim rowsAffected As Integer = 0
        Dim arParms() As SqlParameter = New SqlParameter(15) {}

        arParms(0) = New SqlParameter("@LotNumber", SqlDbType.VarChar, 50)
        arParms(0).Value = InD.LotNo

        arParms(1) = New SqlParameter("@DCNumber", SqlDbType.VarChar, 50)
        arParms(1).Value = InD.DCNo

        arParms(2) = New SqlParameter("@GrowerId", SqlDbType.Int)
        arParms(2).Value = InD.CompanyName

        arParms(3) = New SqlParameter("@IndockEntryDate", SqlDbType.DateTime)
        arParms(3).Value = InD.EntryDate

        arParms(4) = New SqlParameter("@IndockEntryTime", SqlDbType.VarChar, 15)
        arParms(4).Value = InD.EntryTime

        arParms(5) = New SqlParameter("@AuctionDate", SqlDbType.DateTime)
        arParms(5).Value = InD.AucDate

        arParms(6) = New SqlParameter("@FlowerId", SqlDbType.Int)
        arParms(6).Value = InD.FlowerCode

        arParms(7) = New SqlParameter("@Quantity", SqlDbType.Int)
        arParms(7).Value = InD.Quantity

        arParms(8) = New SqlParameter("@MinPrice", SqlDbType.Money)
        arParms(8).Value = InD.MinPrice

        arParms(9) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        arParms(9).Value = HttpContext.Current.Session("BranchCode")

        arParms(10) = New SqlParameter("@Empcode", SqlDbType.VarChar, 50)
        arParms(10).Value = HttpContext.Current.Session("EmpCode")

        arParms(11) = New SqlParameter("@UserCode", SqlDbType.VarChar, 50)
        arParms(11).Value = HttpContext.Current.Session("UserCode")

        arParms(12) = New SqlParameter("@StemLength", SqlDbType.VarChar, 20)
        arParms(12).Value = InD.StemLength

        arParms(13) = New SqlParameter("@Unit", SqlDbType.Int)
        arParms(13).Value = InD.Unit

        arParms(14) = New SqlParameter("@Packaging", SqlDbType.VarChar, 50)
        arParms(14).Value = InD.Packaging

        arParms(15) = New SqlParameter("@Grade", SqlDbType.VarChar, 30)
        arParms(15).Value = InD.Grade

        Try
            rowsAffected = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "[Proc_SaveInDock]", arParms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try

        Return rowsAffected
    End Function

    Public Shared Function Update(ByVal InD As InDockEL) As Integer
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString

        Dim rowsAffected As Integer = 0
        Dim arParms() As SqlParameter = New SqlParameter(16) {}

        arParms(0) = New SqlParameter("@LotNumber", SqlDbType.VarChar, 50)
        arParms(0).Value = InD.LotNo

        arParms(1) = New SqlParameter("@DCNumber", SqlDbType.VarChar, 50)
        arParms(1).Value = InD.DCNo

        arParms(2) = New SqlParameter("@GrowerId", SqlDbType.Int)
        arParms(2).Value = InD.CompanyName

        arParms(3) = New SqlParameter("@IndockEntryDate", SqlDbType.DateTime)
        arParms(3).Value = InD.EntryDate

        arParms(4) = New SqlParameter("@IndockEntryTime", SqlDbType.VarChar, 15)
        arParms(4).Value = InD.EntryTime

        arParms(5) = New SqlParameter("@AuctionDate", SqlDbType.DateTime)
        arParms(5).Value = InD.AucDate

        arParms(6) = New SqlParameter("@FlowerId", SqlDbType.Int)
        arParms(6).Value = InD.FlowerCode

        arParms(7) = New SqlParameter("@Quantity", SqlDbType.Int)
        arParms(7).Value = InD.Quantity

        arParms(8) = New SqlParameter("@MinPrice", SqlDbType.Money)
        arParms(8).Value = InD.MinPrice

        arParms(9) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        arParms(9).Value = HttpContext.Current.Session("BranchCode")

        arParms(10) = New SqlParameter("@Empcode", SqlDbType.VarChar, 50)
        arParms(10).Value = HttpContext.Current.Session("EmpCode")

        arParms(11) = New SqlParameter("@UserCode", SqlDbType.VarChar, 50)
        arParms(11).Value = HttpContext.Current.Session("UserCode")

        arParms(12) = New SqlParameter("@ID", SqlDbType.Int)
        arParms(12).Value = InD.InDocID

        arParms(13) = New SqlParameter("@StemLength", SqlDbType.VarChar, 20)
        arParms(13).Value = InD.StemLength

        arParms(14) = New SqlParameter("@Unit", SqlDbType.Int)
        arParms(14).Value = InD.Unit

        arParms(15) = New SqlParameter("@Packaging", SqlDbType.VarChar, 50)
        arParms(15).Value = InD.Packaging

        arParms(16) = New SqlParameter("@Grade", SqlDbType.VarChar, 30)
        arParms(16).Value = InD.Grade

        Try
            rowsAffected = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "[Proc_UpdateInDock]", arParms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try

        Return rowsAffected
    End Function
    Shared Function Delete(ByVal ID As Integer) As Integer
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString


        Dim rowsAffected As Integer = 0


        Dim arParms() As SqlParameter = New SqlParameter(0) {}

        arParms(0) = New SqlParameter("@InDockID", SqlDbType.Int)
        arParms(0).Value = ID
        Try
            rowsAffected = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "[Proc_DeleteInDock]", arParms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try

        Return rowsAffected
    End Function
    Public Shared Function GridviewDetails(ByVal InD As InDockEL) As Data.DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet

        Dim arParms() As SqlParameter = New SqlParameter(5) {}
        arParms(0) = New SqlParameter("@Office", SqlDbType.VarChar, 50)
        arParms(0).Value = HttpContext.Current.Session("Office")

        arParms(1) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        arParms(1).Value = HttpContext.Current.Session("BranchCode")

        arParms(2) = New SqlParameter("@InDockAutoID", SqlDbType.Int)
        arParms(2).Value = InD.InDocID

        arParms(3) = New SqlParameter("@CompanyName", SqlDbType.Int)
        arParms(3).Value = InD.CompanyName

        arParms(4) = New SqlParameter("@AuctionDate", SqlDbType.DateTime)
        arParms(4).Value = InD.AucDate

        arParms(5) = New SqlParameter("@DcNo", SqlDbType.VarChar, 50)
        arParms(5).Value = InD.DCNo

        Try
            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "[proc_getIndock]", arParms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    Shared Function GetCompanyCobmo() As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Try
            Dim Parms() As SqlParameter = New SqlParameter(1) {}

            Parms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
            Parms(0).Value = HttpContext.Current.Session("BranchCode")

            Parms(1) = New SqlParameter("@Office", SqlDbType.VarChar, 2)
            Parms(1).Value = HttpContext.Current.Session("Office")

            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "[Proc_CompanyNameCombo]", Parms)
            Return ds.Tables(0)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    Shared Function GetFlowerCobmo() As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Try
            Dim Parms() As SqlParameter = New SqlParameter(1) {}

            Parms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
            Parms(0).Value = HttpContext.Current.Session("BranchCode")

            Parms(1) = New SqlParameter("@Office", SqlDbType.VarChar, 2)
            Parms(1).Value = HttpContext.Current.Session("Office")

            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "[Proc_FlowerCombo]", Parms)
            Return ds.Tables(0)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    Shared Function GetStemLength(ByVal a As Integer) As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Try
            Dim Parms() As SqlParameter = New SqlParameter(2) {}

            Parms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
            Parms(0).Value = HttpContext.Current.Session("BranchCode")

            Parms(1) = New SqlParameter("@Office", SqlDbType.VarChar, 2)
            Parms(1).Value = HttpContext.Current.Session("Office")

            Parms(2) = New SqlParameter("@FlowerAutoID", SqlDbType.Int)
            Parms(2).Value = a

            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "[Proc_StemLength]", Parms)
            Return ds.Tables(0)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    Shared Function GetLotNumber() As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Try
            Dim Parms() As SqlParameter = New SqlParameter(1) {}

            Parms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
            Parms(0).Value = HttpContext.Current.Session("BranchCode")

            Parms(1) = New SqlParameter("@Office", SqlDbType.VarChar, 2)
            Parms(1).Value = HttpContext.Current.Session("Office")


            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "[Proc_GetLotNumber]", Parms)
            Return ds.Tables(0)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function

    Shared Function GetMaxQuantity() As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Try
            Dim Parms() As SqlParameter = New SqlParameter(1) {}

            Parms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
            Parms(0).Value = HttpContext.Current.Session("BranchCode")

            Parms(1) = New SqlParameter("@Office", SqlDbType.VarChar, 2)
            Parms(1).Value = HttpContext.Current.Session("Office")


            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "[Proc_GetMaxQty]", Parms)
            Return ds.Tables(0)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    Shared Function GetUnitCobmo() As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Try
            Dim Parms() As SqlParameter = New SqlParameter(1) {}

            Parms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
            Parms(0).Value = HttpContext.Current.Session("BranchCode")

            Parms(1) = New SqlParameter("@Office", SqlDbType.VarChar, 2)
            Parms(1).Value = HttpContext.Current.Session("Office")

            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "[Mfg_ddlUnit]", Parms)
            Return ds.Tables(0)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    Shared Function GetPackagingCombo() As DataTable

        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Dim para() As SqlParameter = New SqlParameter(1) {}

        para(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar)
        para(0).Value = HttpContext.Current.Session("BranchCode")

        para(1) = New SqlParameter("@Office", SqlDbType.VarChar)
        para(1).Value = HttpContext.Current.Session("Office")

        Try
            ds = SqlHelper.ExecuteDataset(ConnectionString, CommandType.StoredProcedure, "[Proc_GetPackaging]", para)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    Public Shared Function GetAucStatusFlag(ByVal id As Integer) As Data.DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet

        Dim arParms() As SqlParameter = New SqlParameter(2) {}
        arParms(0) = New SqlParameter("@Office", SqlDbType.VarChar, 50)
        arParms(0).Value = HttpContext.Current.Session("Office")

        arParms(1) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        arParms(1).Value = HttpContext.Current.Session("BranchCode")

        arParms(2) = New SqlParameter("@id", SqlDbType.Int)
        arParms(2).Value = id
        Try

            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "[proc_getAucStatusFlag]", arParms)


        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)

    End Function
    Public Shared Function ClearSeq(AuctionDate As Date, IndockDate As Date) As Integer
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim rowsAffected As Integer = 0
        Dim arParms() As SqlParameter = New SqlParameter(3) {}

        arParms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar)
        arParms(0).Value = HttpContext.Current.Session("BranchCode")

        arParms(1) = New SqlParameter("@Office", SqlDbType.VarChar)
        arParms(1).Value = HttpContext.Current.Session("Office")

        arParms(2) = New SqlParameter("@AuctionDate", SqlDbType.Date)
        arParms(2).Value = AuctionDate

        arParms(3) = New SqlParameter("@IndockDate", SqlDbType.Date)
        arParms(3).Value = IndockDate

        Try
            rowsAffected = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "[Proc_ClearSeq]", arParms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try

        Return rowsAffected
    End Function
    Public Shared Function RunSeq(AuctionDate As Date, IndockDate As Date) As Integer
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString

        Dim rowsAffected As Integer = 0
        Dim arParms() As SqlParameter = New SqlParameter(3) {}

        arParms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar)
        arParms(0).Value = HttpContext.Current.Session("BranchCode")

        arParms(1) = New SqlParameter("@Office", SqlDbType.VarChar)
        arParms(1).Value = HttpContext.Current.Session("Office")

        arParms(2) = New SqlParameter("@AuctionDate", SqlDbType.Date)
        arParms(2).Value = AuctionDate

        arParms(3) = New SqlParameter("@IndockDate", SqlDbType.Date)
        arParms(3).Value = IndockDate

        'arParms(11) = New SqlParameter("@UserCode", SqlDbType.VarChar, 50)
        'arParms(11).Value = HttpContext.Current.Session("UserCode")


        Try
            rowsAffected = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "[Proc_RunSeq]", arParms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try

        Return rowsAffected
    End Function
    Shared Function GetDateTime() As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Try
            Dim Parms() As SqlParameter = New SqlParameter(1) {}

            Parms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
            Parms(0).Value = HttpContext.Current.Session("BranchCode")

            Parms(1) = New SqlParameter("@Office", SqlDbType.VarChar, 2)
            Parms(1).Value = HttpContext.Current.Session("Office")


            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "[Proc_GetDateTime]", Parms)
            Return ds.Tables(0)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    Shared Function GetGrowerSequence(AuctionDate As Date) As String
        Dim GrowerSequence As String = ""
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
    Dim ds As New DataSet
        Try
            Dim Parms() As SqlParameter = New SqlParameter(1) {}

            Parms(0) = New SqlParameter("@AuctionDate", SqlDbType.Date)
            Parms(0).Value = AuctionDate

            Parms(1) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
            Parms(1).Value = HttpContext.Current.Session("BranchCode")

            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "[Proc_GetGrowerSequence]", Parms)
            GrowerSequence = ds.Tables(0).Rows(0)(0).ToString

        Catch ex As Exception
            MsgBox(ex.ToString)
    End Try
        Return GrowerSequence
    End Function
End Class
