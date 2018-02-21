Imports Microsoft.VisualBasic

Public Class EmpTranferB

    Public Function finalExamRpt(ByVal Desig As Integer, ByVal doj As Integer, ByVal fromdate As Date, ByVal todate As Date, ByVal DeptId As Integer, ByVal SortBy As Integer) As DataTable
        Return EmpTransD.finalExamRpt(Desig, doj, fromdate, todate, DeptId, SortBy)
    End Function

    'Public Function Branch() As DataTable
    '    Return EmpDetailsD.Branch()
    'End Function

    Public Function Designation() As DataTable
        Return EmpTransD.Designation()
    End Function

    Public Function GetEmp(ByVal prefix As String) As DataTable
        'Dim dataSet As New DataSet
        'dataSet = EmpTransD.GetEmp(prefix)
        Return EmpTransD.GetEmp(prefix)
    End Function
    Public Function GetEmpDetails() As DataTable
        'Dim dataSet As New DataSet
        'dataSet = EmpTransD.GetEmp(prefix)
        Return EmpTransD.GetEmpDetails()
    End Function
    Public Function GetEmpDetails(ByVal I As Integer) As DataTable
        'Dim dataSet As New DataSet
        'dataSet = EmpTransD.GetEmp(prefix)
        Return EmpTransD.GetEmpDetails(I)
    End Function
    Public Function InsertRecord(ByVal i As EmpTransE) As Integer
        Return EmpTransD.insert(i)
    End Function

    Public Function GetBranchTypecombo() As Data.DataTable
        Return EmpTransD.GetBranchTypecombo()
    End Function
End Class
