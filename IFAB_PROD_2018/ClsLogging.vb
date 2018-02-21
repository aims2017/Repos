
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Configuration
Imports System.IO

Namespace RequestAndResponse

    Public Class ClsLogging

        Public Enum LogType
            Worldline
        End Enum

        Public Shared Sub writefileE(ByVal msg As String, ByVal ProcessType As LogType)
            Dim Islogging As String = ConfigurationManager.AppSettings("Islogging")
            If Islogging <> "Y" Then
                Return
            End If

            Dim LogFilePath As String = ConfigurationManager.AppSettings("LogFilePath")
            Try
                If Not System.IO.Directory.Exists(LogFilePath) Then
                    System.IO.Directory.CreateDirectory(LogFilePath)
                End If

                Dim dt As String = DateTime.Now.ToString("dd/MM/yyyy")
                Dim dd As String = dt.Substring(0, 2)
                Dim mm As String = dt.Substring(3, 2)
                Dim yy As String = dt.Substring(6, 4)
                Dim errdt As String = dd & mm & yy
                Dim fs As FileStream = New FileStream(LogFilePath & ProcessType & errdt & ".txt", FileMode.OpenOrCreate, FileAccess.Write)
                Dim m_sr As StreamWriter = New StreamWriter(fs)
                m_sr.BaseStream.Seek(0, SeekOrigin.[End])
                m_sr.WriteLine("[" & System.DateTime.Now & "]  " & vbTab & msg)
                m_sr.Flush()
                m_sr.Close()
                fs.Dispose()
            Catch __unusedException1__ As Exception
            End Try
        End Sub
    End Class
End Namespace

'=======================================================
'Service provided by Telerik (www.telerik.com)
'Conversion powered by Refactoring Essentials.
'Twitter: @telerik
'Facebook: facebook.com/telerik
'=======================================================
