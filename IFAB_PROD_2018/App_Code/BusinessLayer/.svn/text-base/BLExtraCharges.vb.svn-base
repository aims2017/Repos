Imports Microsoft.VisualBasic
Imports System.Data.SqlClient

Public Class BLExtraCharges
    Dim DL As New DLExtraCharges
    Public Function InsertExtraCharges(ByVal EL As ELExtraCharges) As Integer
        Return DL.InsertExtraCharges(EL)
    End Function
    Public Function DeleteExtraCharges(ByVal EL As ELExtraCharges) As Integer
        Return DL.DeleteExtraCharges(EL)
    End Function
    Public Function DisplayGridview(ByVal EL As ELExtraCharges) As DataTable
        Return DLExtraCharges.DisplayGridview(EL)
    End Function
    Public Function UpdateExtraCharges(ByVal EL As ELExtraCharges) As String
        Return DLExtraCharges.UpdateExtraCharges(EL)
    End Function
    Public Function CheckDuplicate(ByVal EL As ELExtraCharges) As System.Data.DataTable
        Return DL.CheckDuplicate(EL)
    End Function
End Class
