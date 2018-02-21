Imports Microsoft.VisualBasic

Public Class ELSalaryScaleGrade
    Private _Grade, _ScaleRange As String
    Public Property Grade() As String
        Get
            Return _Grade
        End Get
        Set(ByVal value As String)
            _Grade = value
        End Set
    End Property
    Public Property ScaleRange() As String
        Get
            Return _ScaleRange
        End Get
        Set(ByVal value As String)
            _ScaleRange = value
        End Set
    End Property
    Private _id As Integer
    Public Property id() As Integer
        Get
            Return _id
        End Get
        Set(ByVal value As Integer)
            _id = value
        End Set
    End Property
End Class
