Imports Microsoft.VisualBasic
Imports System.Data.OleDb
Imports System.Data


Public Class TreeView_FormAccess
    Dim new_dbconn1 As New OleDbConnection

    Sub Flag_Execute(ByVal SqlFlag As String)
        Dim myDS As New GlobalDataSet
        Dim myDA As New OleDbDataAdapter()
        Dim dbcommand As New OleDbCommand
        dbcommand.Connection = new_dbconn1
        new_dbconn1.Open()
        dbcommand.CommandType = CommandType.Text
        dbcommand.CommandText = SqlFlag
        myDA.SelectCommand = dbcommand
        myDS.Clear()
        myDA.Fill(myDS, "TreeView_Data")
        dbcommand.ExecuteNonQuery()
        new_dbconn1.Close()
    End Sub

End Class
