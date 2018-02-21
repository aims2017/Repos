Imports System.Diagnostics
Imports System.IO


Partial Class FrmAuctionMasterConsole
    Inherits BasePage

    Protected Sub BtnBiddersList_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnBiddersList.Click
        Dim sepWin As String = ""
        sepWin = "frmBiddersList.aspx?" & SeperateWindow.SepWindow()
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "message", "<script>window.open('" & sepWin & "','mywin','toolbar=no,scrollbars=yes,location=no,resizable =yes,width=950,height=650,left=50,top=50')</script>", False)

    End Sub

    Protected Sub BtnAuctionLot_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnAuctionLot.Click
        Dim sepWin_AL As String = ""
        sepWin_AL = "frmAuctionLot.aspx?" & SeperateWindow.SepWindow()
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "message", "<script>window.open('" & sepWin_AL & "','mywindow1','toolbar=no,scrollbars=yes,location=no,resizable =yes,width=950,height=650,left=50,top=50')</script>", False)
    End Sub


    Protected Sub BtnAuctionSheet_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnAuctionSheet.Click
        Dim sepWin2 As String = ""
        sepWin2 = "frmAuctionSheet.aspx?" & SeperateWindow.SepWindow()
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "message", "<script>window.open('" & sepWin2 & "','mywindow2','toolbar=no,scrollbars=yes,location=no,resizable =yes,width=950,height=650,left=50,top=50')</script>", False)
    End Sub

    Protected Sub btnClock_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClock.Click

    End Sub

    Protected Sub Page_Load1(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim dt As DataTable
        Dim Path As String
        dt = DLAuctionLot.GetClockPath()
        Path = dt.Rows(0).Item(0)
        Session("Path") = Path

    End Sub

End Class
