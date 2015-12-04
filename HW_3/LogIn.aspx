<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="HW_3.Authorization.LogIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        #container {
            width: 25%;
            text-align: center;
            margin: auto;
        }
         .auto-style1 {
             width: 100%;
         }
        .auto-style2 {
            height: 25px;
        }
        #center {
            margin: auto;
            text-align: center;
        }
        td {
            width: 1%;
        }
        #btn {
            text-align: center;
        }
    </style>
</head>
<body><div id="center">
    <a href="Default.aspx"><img width="550px" height="300px" src="Photos/gj-web-youface-01.png"/></a>
</div>
    <form id="form1" runat="server">
    <div id="container">
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">Nickname</td>
                <td class="auto-style2">
                    <asp:TextBox ID="InputNickname" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Password</td>
                <td>
                    <asp:TextBox ID="InputPassword" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
        </table>
    
    </div>
        <br/>
        <div id="btn">
            <asp:Button ID="ButtonLogin" runat="server" OnClick="ButtonLogin_Click" Text="Log in" style="height: 25px"/>
            <br/>
            <br/>
            <asp:Label ID="ErrorLabel" runat="server" ForeColor="#CC0000"></asp:Label></div>

    </form>
</body>
</html>
