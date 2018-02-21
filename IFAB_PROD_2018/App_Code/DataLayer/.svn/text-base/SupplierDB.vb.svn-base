Imports Microsoft.VisualBasic
Imports System.IO
Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.UI.WebControls.Button

Public Class SupplierDB
    Shared Function GetDatSup(ByVal prefixText As String) As System.Data.DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Dim arParms() As SqlParameter = New SqlParameter(2) {}
        arParms(0) = New SqlParameter("@Supp_Name", SqlDbType.VarChar, 50)
        arParms(0).Value = prefixText

        arParms(1) = New SqlParameter("@Office", SqlDbType.VarChar, 50)
        arParms(1).Value = HttpContext.Current.Session("Office")

        arParms(2) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        arParms(2).Value = HttpContext.Current.Session("BranchCode")


        ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "GetSupExt", arParms)
        Return ds.Tables(0)
    End Function
    Shared Function GetSuppComboDayBook(ByVal id As Long) As System.Data.DataSet
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Try
            If id = 0 Then
                Dim arParms() As SqlParameter = New SqlParameter(1) {}
                arParms(0) = New SqlParameter("@Office", SqlDbType.VarChar, 50)
                arParms(0).Value = HttpContext.Current.Session("Office")
                arParms(1) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
                arParms(1).Value = HttpContext.Current.Session("BranchCode")
                ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Proc_GetSuppComboDB", arParms)
            Else
                Dim arParms() As SqlParameter = New SqlParameter(2) {}
                arParms(0) = New SqlParameter("@Supp_Id", SqlDbType.Int)
                arParms(0).Value = id
                arParms(1) = New SqlParameter("@Office", SqlDbType.VarChar, 50)
                arParms(1).Value = HttpContext.Current.Session("Office")
                arParms(2) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
                arParms(2).Value = HttpContext.Current.Session("BranchCode")
                ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Proc_GetSuppComboDBbyID", arParms)
            End If
        Catch e As Exception
            ds = New DataSet
        End Try
        Return ds
    End Function
    Public Shared Function GridviewDetails(ByVal se As Supplier) As Data.DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet


        Dim arParms() As SqlParameter = New SqlParameter(4) {}
        arParms(0) = New SqlParameter("@Office", SqlDbType.VarChar, 50)
        arParms(0).Value = HttpContext.Current.Session("Office")
        arParms(1) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        arParms(1).Value = HttpContext.Current.Session("BranchCode")
        arParms(2) = New SqlParameter("id", SqlDbType.Int)
        arParms(2).Value = se.Supp_ID
        arParms(3) = New SqlParameter("@Supp_Name", SqlDbType.NVarChar, 50)
        arParms(3).Value = se.Supp_Name
        arParms(4) = New SqlParameter("@Supp_Code", SqlDbType.VarChar, 50)
        arParms(4).Value = se.Supp_Code
      
        Try

            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Proc_GetSupplierDetails", arParms)


        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)

    End Function
    Public Shared Function SupplierDetailsRpt() As System.Data.DataSet
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As DataSet
        Try

            Dim arParms() As SqlParameter = New SqlParameter(1) {}
            arParms(0) = New SqlParameter("@Office", SqlDbType.VarChar, 50)
            arParms(0).Value = HttpContext.Current.Session("Office")
            arParms(1) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
            arParms(1).Value = HttpContext.Current.Session("BranchCode")


            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Rpt_SupplierDetails", arParms)


        Catch e As Exception
            ds = New DataSet
        End Try
        Return ds
    End Function

    Public Shared Function Insert(ByVal SE As Supplier) As Integer
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim rowsAffected As Integer = 0
        Dim arParms() As SqlParameter = New SqlParameter(34) {}

        arParms(0) = New SqlParameter("@supp_name", SqlDbType.NVarChar, 50)
        arParms(0).Value = SE.Supp_Name

        arParms(1) = New SqlParameter("@code", SqlDbType.NVarChar, 50)
        arParms(1).Value = SE.Supp_Code

        'arParms(2) = New SqlParameter("@registered", SqlDbType.NVarChar, 4)
        'arParms(2).Value = DBNull.Value


        'If SE.PostalCode = "" Then
        '    arParms(7) = New SqlParameter("@postalcode", SqlDbType.VarChar, 50)
        '    arParms(7).Value = DBNull.Value
        'Else
        '    arParms(7) = New SqlParameter("@postalcode", SqlDbType.VarChar, 50)
        '    arParms(7).Value = SE.PostalCode
        'End If


        'arParms(10) = New SqlParameter("@dlno ", SqlDbType.NVarChar, 50)
        'arParms(10).Value = DBNull.Value

        'arParms(16) = New SqlParameter("@credit_Period", SqlDbType.Int)
        'arParms(16).Value = SE.Credit_Period

        'arParms(17) = New SqlParameter("@credit_Limit", SqlDbType.Float)
        'arParms(17).Value = SE.Credit_Limit

        'arParms(18) = New SqlParameter("@suptorec", SqlDbType.Float)
        'arParms(18).Value = SE.Opening_Balance_CR

        'arParms(19) = New SqlParameter("@suptopay", SqlDbType.Float)
        'arParms(19).Value = SE.Opening_Balance_DR

        'If SE.OpBalanceDate = "01-01-9100" Then
        '    arParms(20) = New SqlParameter("@ob_date", SqlDbType.DateTime)
        '    arParms(20).Value = DBNull.Value
        'Else
        '    arParms(20) = New SqlParameter("@ob_date", SqlDbType.DateTime)
        '    arParms(20).Value = SE.OpBalanceDate
        'End If
        'arParms(24) = New SqlParameter("@Buyer", SqlDbType.VarChar)
        'arParms(24).Value = DBNull.Value
        'If SE.OpBalanceDate = "01-01-9100" Then
        'Else
        'arParms(20) = New SqlParameter("@ob_date", SqlDbType.DateTime)
        'arParms(20).Value = SE.OpBalanceDate
        'End If


        If SE.Tin = "0" Then
            arParms(2) = New SqlParameter("@tin", SqlDbType.NVarChar, 50)
            arParms(2).Value = DBNull.Value
        Else
            arParms(2) = New SqlParameter("@tin", SqlDbType.NVarChar, 50)
            arParms(2).Value = SE.Tin
        End If

        If SE.CSTNo = "" Then
            arParms(3) = New SqlParameter("@cstno", SqlDbType.NVarChar, 50)
            arParms(3).Value = DBNull.Value

        Else
            arParms(3) = New SqlParameter("@cstno", SqlDbType.NVarChar, 50)
            arParms(3).Value = SE.CSTNo

        End If
        arParms(4) = New SqlParameter("@supp_Address", SqlDbType.NVarChar, 250)
        arParms(4).Value = SE.Supp_Address

        arParms(5) = New SqlParameter("@city ", SqlDbType.NVarChar, 50)
        arParms(5).Value = SE.City

        arParms(6) = New SqlParameter("@State", SqlDbType.Int)
        arParms(6).Value = SE.State

        arParms(7) = New SqlParameter("@country", SqlDbType.NVarChar, 50)
        arParms(7).Value = SE.Country

        arParms(8) = New SqlParameter("@contact_Person", SqlDbType.NVarChar, 50)
        arParms(8).Value = SE.Contact_Person

        arParms(9) = New SqlParameter("@contact_Number1", SqlDbType.VarChar, 50)
        arParms(9).Value = SE.Contact_Number1

        arParms(10) = New SqlParameter("@contact_Number2", SqlDbType.VarChar, 50)
        arParms(10).Value = SE.Contactno2

        arParms(11) = New SqlParameter("@faxno", SqlDbType.VarChar, 50)
        arParms(11).Value = SE.FaxNO

        arParms(12) = New SqlParameter("@email", SqlDbType.VarChar, 50)
        arParms(12).Value = SE.Email

       

        arParms(13) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        arParms(13).Value = HttpContext.Current.Session("BranchCode")

        arParms(14) = New SqlParameter("@Empcode", SqlDbType.VarChar, 50)
        arParms(14).Value = HttpContext.Current.Session("EmpCode")

        arParms(15) = New SqlParameter("@UserCode", SqlDbType.VarChar, 50)
        arParms(15).Value = HttpContext.Current.Session("UserCode")

       
        arParms(16) = New SqlParameter("@Photos", SqlDbType.VarChar, SE.Photos.Length())
        arParms(16).Value = SE.Photos

        
        If SE.Pani = "" Then
            arParms(17) = New SqlParameter("@Pani", SqlDbType.VarChar, 50)
            arParms(17).Value = DBNull.Value
        Else
            arParms(17) = New SqlParameter("@Pani", SqlDbType.VarChar, 50)
            arParms(17).Value = SE.Pani
        End If
        

        arParms(18) = New SqlParameter("@Pan", SqlDbType.VarChar, 50)
        arParms(18).Value = SE.PAN


        arParms(19) = New SqlParameter("@Email2", SqlDbType.VarChar, 50)
        arParms(19).Value = SE.Email2
       

        arParms(20) = New SqlParameter("@BankName", SqlDbType.VarChar, 50)
        arParms(20).Value = SE.BankName

        arParms(21) = New SqlParameter("@BankArea", SqlDbType.VarChar, 50)
        arParms(21).Value = SE.BankArea

        arParms(22) = New SqlParameter("@IFSCCode", SqlDbType.VarChar, 50)
        arParms(22).Value = SE.IFSCCode

        arParms(23) = New SqlParameter("@AcNo", SqlDbType.VarChar, 50)
        arParms(23).Value = SE.AcNo

        arParms(24) = New SqlParameter("@ToAc", SqlDbType.Int)
        arParms(24).Value = SE.ToAc

        arParms(25) = New SqlParameter("@SurveyNumber", SqlDbType.VarChar, 50)
        arParms(25).Value = SE.SurveyNumber

        arParms(26) = New SqlParameter("@GreenHouse", SqlDbType.VarChar, 50)
        arParms(26).Value = SE.GreenHouseArea

        arParms(27) = New SqlParameter("@GrowerType", SqlDbType.VarChar, 50)
        arParms(27).Value = SE.GrowerType

        arParms(28) = New SqlParameter("@ContactPer2", SqlDbType.VarChar, 100)
        arParms(28).Value = SE.ContactPerson2

        arParms(29) = New SqlParameter("@District1", SqlDbType.VarChar, 50)
        arParms(29).Value = SE.District1

        arParms(30) = New SqlParameter("@Village", SqlDbType.VarChar, 50)
        arParms(30).Value = SE.Village

        arParms(31) = New SqlParameter("@Taluk", SqlDbType.VarChar, 50)
        arParms(31).Value = SE.Taluk

        arParms(32) = New SqlParameter("@District2", SqlDbType.VarChar, 50)
        arParms(32).Value = SE.District2

        arParms(33) = New SqlParameter("@State2", SqlDbType.Int)
        arParms(33).Value = SE.State2

        arParms(34) = New SqlParameter("@Country2", SqlDbType.VarChar, 50)
        arParms(34).Value = SE.Country2

        Try
            rowsAffected = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "Proc_SaveSupplierDetails", arParms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try

        Return rowsAffected
    End Function
   
    Public Shared Function Update(ByVal SE As Supplier) As Integer
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        
        Dim rowsAffected As Integer = 0

        Dim arParms() As SqlParameter = New SqlParameter(35) {}
        arParms(0) = New SqlParameter("@supp_name", SqlDbType.NVarChar, 50)
        arParms(0).Value = SE.Supp_Name

        arParms(1) = New SqlParameter("@code", SqlDbType.NVarChar, 50)
        arParms(1).Value = SE.Supp_Code

       
        If SE.Tin = "0" Then
            arParms(2) = New SqlParameter("@tin", SqlDbType.NVarChar, 50)
            arParms(2).Value = DBNull.Value
        Else
            arParms(2) = New SqlParameter("@tin", SqlDbType.NVarChar, 50)
            arParms(2).Value = SE.Tin
        End If

        If SE.CSTNo = "" Then
            arParms(3) = New SqlParameter("@cstno", SqlDbType.NVarChar, 50)
            arParms(3).Value = DBNull.Value

        Else
            arParms(3) = New SqlParameter("@cstno", SqlDbType.NVarChar, 50)
            arParms(3).Value = SE.CSTNo

        End If
        arParms(4) = New SqlParameter("@supp_Address", SqlDbType.NVarChar, 250)
        arParms(4).Value = SE.Supp_Address

        arParms(5) = New SqlParameter("@city ", SqlDbType.NVarChar, 50)
        arParms(5).Value = SE.City

        arParms(6) = New SqlParameter("@State", SqlDbType.Int)
        arParms(6).Value = SE.State

        arParms(7) = New SqlParameter("@country", SqlDbType.NVarChar, 50)
        arParms(7).Value = SE.Country

        arParms(8) = New SqlParameter("@contact_Person", SqlDbType.NVarChar, 50)
        arParms(8).Value = SE.Contact_Person

        arParms(9) = New SqlParameter("@contact_Number1", SqlDbType.VarChar, 50)
        arParms(9).Value = SE.Contact_Number1

        arParms(10) = New SqlParameter("@contact_Number2", SqlDbType.VarChar, 50)
        arParms(10).Value = SE.Contactno2

        arParms(11) = New SqlParameter("@faxno", SqlDbType.VarChar, 50)
        arParms(11).Value = SE.FaxNO

        arParms(12) = New SqlParameter("@email", SqlDbType.VarChar, 50)
        arParms(12).Value = SE.Email



        arParms(13) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        arParms(13).Value = HttpContext.Current.Session("BranchCode")

        arParms(14) = New SqlParameter("@Empcode", SqlDbType.VarChar, 50)
        arParms(14).Value = HttpContext.Current.Session("EmpCode")

        arParms(15) = New SqlParameter("@UserCode", SqlDbType.VarChar, 50)
        arParms(15).Value = HttpContext.Current.Session("UserCode")


        arParms(16) = New SqlParameter("@Photos", SqlDbType.VarChar, SE.Photos.Length())
        arParms(16).Value = SE.Photos


        If SE.Pani = "" Then
            arParms(17) = New SqlParameter("@Pani", SqlDbType.VarChar, 50)
            arParms(17).Value = DBNull.Value
        Else
            arParms(17) = New SqlParameter("@Pani", SqlDbType.VarChar, 50)
            arParms(17).Value = SE.Pani
        End If


        arParms(18) = New SqlParameter("@Pan", SqlDbType.VarChar, 50)
        arParms(18).Value = SE.PAN


        arParms(19) = New SqlParameter("@Email2", SqlDbType.VarChar, 50)
        arParms(19).Value = SE.Email2


        arParms(20) = New SqlParameter("@BankName", SqlDbType.VarChar, 50)
        arParms(20).Value = SE.BankName

        arParms(21) = New SqlParameter("@BankArea", SqlDbType.VarChar, 50)
        arParms(21).Value = SE.BankArea

        arParms(22) = New SqlParameter("@IFSCCode", SqlDbType.VarChar, 50)
        arParms(22).Value = SE.IFSCCode

        arParms(23) = New SqlParameter("@AcNo", SqlDbType.VarChar, 50)
        arParms(23).Value = SE.AcNo

        arParms(24) = New SqlParameter("@ToAc", SqlDbType.Int)
        arParms(24).Value = SE.ToAc

        arParms(25) = New SqlParameter("@SurveyNumber", SqlDbType.VarChar, 50)
        arParms(25).Value = SE.SurveyNumber

        arParms(26) = New SqlParameter("@GreenHouse", SqlDbType.VarChar, 50)
        arParms(26).Value = SE.GreenHouseArea

        arParms(27) = New SqlParameter("@GrowerType", SqlDbType.VarChar, 50)
        arParms(27).Value = SE.GrowerType

        arParms(28) = New SqlParameter("@ContactPer2", SqlDbType.VarChar, 100)
        arParms(28).Value = SE.ContactPerson2

        arParms(29) = New SqlParameter("@District1", SqlDbType.VarChar, 50)
        arParms(29).Value = SE.District1

        arParms(30) = New SqlParameter("@Village", SqlDbType.VarChar, 50)
        arParms(30).Value = SE.Village

        arParms(31) = New SqlParameter("@Taluk", SqlDbType.VarChar, 50)
        arParms(31).Value = SE.Taluk

        arParms(32) = New SqlParameter("@District2", SqlDbType.VarChar, 50)
        arParms(32).Value = SE.District2

        arParms(33) = New SqlParameter("@State2", SqlDbType.Int)
        arParms(33).Value = SE.State2

        arParms(34) = New SqlParameter("@Country2", SqlDbType.VarChar, 50)
        arParms(34).Value = SE.Country2

        arParms(35) = New SqlParameter("@id", SqlDbType.Int)
        arParms(35).Value = SE.Supp_ID

        Try
            rowsAffected = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "Proc_UpdateSupplierDetails", arParms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try

        Return rowsAffected
    End Function
    Shared Function Delete(ByVal id As Long) As Integer
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString

        Dim SE As New Supplier
        Dim rowsAffected As Integer = 0


        Dim arParms() As SqlParameter = New SqlParameter(0) {}

        arParms(0) = New SqlParameter("supp_Id", SqlDbType.Int)
        arParms(0).Value = id
        Try
            rowsAffected = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "Proc_DeleteSupplierDetails", arParms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try

        Return rowsAffected
    End Function
    Shared Function GetReport(ByVal insID As Int64, ByVal brnID As Int64) As Data.DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As DataSet
        Try
            Dim arParms() As SqlParameter = New SqlParameter(1) {}
            arParms(0) = New SqlParameter("@Office", SqlDbType.VarChar, 50)
            arParms(0).Value = HttpContext.Current.Session("Office")
            arParms(1) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
            arParms(1).Value = HttpContext.Current.Session("BranchCode")

            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Proc_RptSupplierMaster", arParms)
        Catch e As Exception
            ds = New DataSet

        End Try
        Return ds.Tables(0)
    End Function
    Shared Function GetAreaCobmo() As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Try
            Dim Parms() As SqlParameter = New SqlParameter(1) {}

            Parms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
            Parms(0).Value = HttpContext.Current.Session("BranchCode")

            Parms(1) = New SqlParameter("@Office", SqlDbType.VarChar, 2)
            Parms(1).Value = HttpContext.Current.Session("Office")

            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Mfg_AreaCombo", Parms)
            Return ds.Tables(0)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    Shared Function GetSECobmo() As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Try
            Dim Parms() As SqlParameter = New SqlParameter(1) {}

            Parms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
            Parms(0).Value = HttpContext.Current.Session("BranchCode")

            Parms(1) = New SqlParameter("@Office", SqlDbType.VarChar, 2)
            Parms(1).Value = HttpContext.Current.Session("Office")

            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Mfg_SECombo", Parms)
            Return ds.Tables(0)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    
    Shared Function GetSuppDuplicateType(ByVal SE As Supplier) As Data.DataTable
        Dim con As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString

        ''Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim rowsAffected As Integer = 0
        Dim arParms() As SqlParameter = New SqlParameter(3) {}

        Dim ds As New DataSet
        'arParms(0) = New SqlParameter("@supp_name", SqlDbType.Char, SE.Supp_Name.Length)
        'arParms(0).Value = SE.Supp_Name

       

        'arParms(2) = New SqlParameter("@supp_Address", SqlDbType.Char, SE.Supp_Address.Length)
        'arParms(2).Value = SE.Supp_Address

        'arParms(3) = New SqlParameter("@contact_Number1", SqlDbType.Char, SE.Contact_Number1.Length)
        'arParms(3).Value = SE.Contact_Number1

        arParms(0) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        arParms(0).Value = HttpContext.Current.Session("BranchCode")

        arParms(1) = New SqlParameter("@Office", SqlDbType.VarChar, 50)
        arParms(1).Value = HttpContext.Current.Session("Office")

        arParms(2) = New SqlParameter("@id", SqlDbType.Int)
        arParms(2).Value = SE.Supp_ID
        arParms(3) = New SqlParameter("@Supp_Code", SqlDbType.Char, SE.Supp_Code.Length)
        arParms(3).Value = SE.Supp_Code
        Try

            ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "Proc_GetSuppDuplicateType", arParms)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return ds.Tables(0)
    End Function
    Shared Function GetState(ByVal StateId As Long) As System.Data.DataSet
        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As DataSet
        'If StateId = 0 Then
        '    ds = SqlHelper.ExecuteDataset(ConnectionString, CommandType.Text, "Select StateId,StateName From State")
        'Else
        'Dim arParms() As SqlParameter = New SqlParameter(0) {}
        'arParms(0) = New SqlParameter("@StateId", SqlDbType.Int)
        'arParms(0).Value = StateId
        ds = SqlHelper.ExecuteDataset(ConnectionString, CommandType.StoredProcedure, "Proc_GetStateByID")
        'End If
        Return ds
    End Function
    Public Function GetDDlAccountType() As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("Advant").ConnectionString
        Dim ds As New DataSet
        Dim arParms() As SqlParameter = New SqlParameter(1) {}

        arParms(0) = New SqlParameter("@Office", SqlDbType.VarChar, 50)
        arParms(0).Value = HttpContext.Current.Session("Office")

        arParms(1) = New SqlParameter("@BranchCode", SqlDbType.VarChar, 50)
        arParms(1).Value = HttpContext.Current.Session("BranchCode")

        ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Proc_GetAccountTypeCombo", arParms)
        Return ds.Tables(0)
    End Function
End Class
