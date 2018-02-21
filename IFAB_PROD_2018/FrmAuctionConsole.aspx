<%@ Page Language="VB" AutoEventWireup="false" CodeFile="FrmAuctionConsole.aspx.vb" Inherits="FrmAuctionConsole" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Auction Console</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
    <script type="text/javascript" src="Scripts/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="Scripts/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="Scripts/bootstrap.js"></script>
    <script type="text/javascript" src="Scripts/bootstrap.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="styles/ifabstyles.css" rel="stylesheet" />
    <style >
        .i_button_yellow{
            font-weight:bolder;
            font-family:Arial, Helvetica, sans-serif;
             color:black;
            background-color:#ffd700;
            height: 30px;
    width: 130px;
        }
          .i_button_red{
                   font-weight:bolder;
              font-family:Arial, Helvetica, sans-serif;
             color:white;
             background-color:red;
            height: 30px;
           width: 130px;
        }
    </style>
</head>
    
<body style="background-color:green;">

    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" ID="script1" />
         <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <center>
    <div class="row">
      
        <table class="tableContent">
            
            <tr >
                <td style="margin-left:20px"> <asp:CheckBox  runat="server" Checked="false" AutoPostBack="true"  Text="Demo" Style="color:white" ></asp:CheckBox>&nbsp;&nbsp;&nbsp;<asp:Label Text="Speed" style="font-size:18px;color:white"  ID="lbl_spd" runat="server" ></asp:Label></td>
               
                <td>
                    <asp:TextBox runat="server" ID="txtspd" Width="65px" />&nbsp;<asp:TextBox runat="server" ID="TextBox1" Width="65px"  />
                
                </td>
            </tr>
            <tr>
                
                <td>
               <asp:Label Text="Increment Value" ID="Label1" runat="server" style="font-size:18px;color:white;margin-left:10px"  ></asp:Label>
                    </td>
                <td>  <asp:TextBox runat="server" ID="TextBox2" Width="130px" /></td>
            </tr>
            <tr>
                <td>
                    <asp:Button runat="server" Text="Open Clock" Class="i_button_yellow" />
                </td>
                <td>
                    <asp:Button runat="server" Text="Start Clock" Class="i_button_yellow" />
                </td>
                </tr>
            <tr>
                <td>
                    <asp:Button runat="server" Text="Close Clock" Class="i_button_red" />
                </td>
                <td>
                    <asp:Button runat="server" Text="Stop Clock " Class="i_button_yellow" />
                </td>
            </tr>
            <tr></tr>
            <tr>
                
                <td>

                    <asp:Button runat="server" Text="Next Lot " Class="i_button_yellow" />
                </td>
            </tr>

            
           
        </table>
            
          </div>
                <br /> 
                <center>
   <div class="row" style="border:1px solid thin;background-color:grey;width:70%;height:250px;">
<table class="a_table">
    <tr class="a_tr">
        <th class="a_th"></th>
        <th class="a_th">CompanyName</th>
        <th class="a_th">Qty</th>
        <th class="a_th">Price</th>
    </tr>
    <tr class="a_tr">
        <td class="a_td">*</td>
        <td class="a_td"></td>
        <td class="a_td"></td>
        <td class="a_td"></td>
    </tr>
</table>
   </div>
                    </center>
                <br /> <br />
                <div class="row" style="height:100px;">
                    <table >
                      <tr>
                <td>
                    <asp:Button runat="server" Text="View" Class="i_button_red" />
                </td>
                <td>
                    <asp:Button runat="server" Text="Cancel " Class="i_button_yellow" />
                </td>
            </tr>
                          </table>
                </div>
         <div class="row">
              <asp:Label Text="Total Lots:" ID="Label2" runat="server" style="font-size:20px;color:white;margin-left:10px"  ></asp:Label><br />
             <asp:Label Text="Cleared:" ID="Label3" runat="server" style="font-size:20px;color:white;margin-left:10px"  ></asp:Label><br />
             <asp:Label Text="Balance:" ID="Label4" runat="server" style="font-size:20px;color:white;margin-left:10px"  ></asp:Label>
         </div>
  
                </center>
                </ContentTemplate>
                </asp:UpdatePanel>
    </form>
</body>
</html>
