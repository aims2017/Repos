Imports System.Data.SqlClient
Imports System.Data
Imports Microsoft.VisualBasic
Public Class BLHandlingCharges
    Dim DL As New DLHandlingCharges
    Public Function InsertHandlingCharges(ByVal EL As ELHandlingCharges) As Integer
        Return DL.InsertHandlingCharges(EL)
    End Function
    Public Function DeleteHandlingCharges(ByVal EL As ELHandlingCharges) As Integer
        Return DL.DeleteHandlingCharges(EL)
    End Function
    Public Function DisplayGridview(ByVal EL As ELHandlingCharges) As DataTable
        Return DLHandlingCharges.DisplayGridview(EL)
    End Function
   
    Public Function UpdateHandling(ByVal EL As ELHandlingCharges) As Integer
        Return DLHandlingCharges.UpdateHandlingCharges(EL)
    End Function
    Public Function CheckDuplicate(ByVal EL As ELHandlingCharges) As System.Data.DataTable
        Return DL.CheckDuplicate(EL)
    End Function
End Class
