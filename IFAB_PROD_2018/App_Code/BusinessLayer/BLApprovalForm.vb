﻿Imports Microsoft.VisualBasic
Imports System.Collections.Generic
Imports System.Data

Public Class BLApprovalForm
    Public Function GetGrid(ByVal TableCode As Integer) As DataTable
        Return DLApprovalForm.GetGrid(TableCode)
    End Function
    Public Function GetGrid1(ByVal TableCode As Integer) As DataTable
        Return DLApprovalForm.GetGrid1(TableCode)
    End Function
    Public Function GetBatchGrid(ByVal BatchCode As String) As DataTable
        Return DLApprovalForm.GetBatchGrid(BatchCode)
    End Function
    Public Function Approval(ByVal appr As ApprovalForm) As Integer
        Return DLApprovalForm.Approval(appr)
    End Function
    Public Function ApprovalStudent(ByVal appr As ApprovalForm) As Integer
        Return DLApprovalForm.ApprovalStudent(appr)
    End Function
    Public Function Approval1(ByVal appr As ApprovalForm) As Integer
        Return DLApprovalForm.Approval1(appr)
    End Function
    Public Function Rejection() As Integer
        Return DLApprovalForm.Rejection()
    End Function
    Public Function SCRejection() As Integer
        Return DLApprovalForm.SCRejection()
    End Function
    Public Function PRejection() As Integer
        Return DLApprovalForm.PRejection()
    End Function
    Public Function RRejection(ByVal Remarks As String) As Integer
        Return DLApprovalForm.RRejection(Remarks)
    End Function
    Public Function GratuityRejection() As Integer
        Return DLApprovalForm.GratuityRejection()
    End Function
  
    Public Function GetEnrollAgentDdl(ByVal branch As String) As Data.DataTable
        Return DLApprovalForm.GetEnrollAgentDdl(branch)
    End Function
End Class
