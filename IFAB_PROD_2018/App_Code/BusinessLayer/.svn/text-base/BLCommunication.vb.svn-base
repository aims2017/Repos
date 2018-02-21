Imports Microsoft.VisualBasic

Public Class BLCommunication
    Dim Dl As New DLCommunicationModule
    Public Function GetNameCombo(ByVal GroupID As Integer) As DataTable
        Return DLCommunicationModule.GetNameCombo(GroupID)
    End Function
    Public Function InsertCommunication(ByVal el As ELCommunication) As Integer
        Return DLCommunicationModule.InsertCommunication(el)
    End Function
    Public Function GetViewStatus() As DataTable
        Return Dl.GetViewStatus()
    End Function
    Public Function GetSMSTemplate() As DataTable
        Return DLCommunicationModule.GetSMSTemplate()
    End Function
    Public Function GetSMSMessage(ByVal Id As Integer) As DataTable
        Return DLCommunicationModule.GetSMSMessage(Id)
    End Function
End Class
