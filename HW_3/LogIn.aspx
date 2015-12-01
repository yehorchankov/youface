<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="HW_3.Authorization.LogIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 25px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
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
        <asp:Button ID="ButtonLogin" runat="server" OnClick="ButtonLogin_Click" Text="Log in" />
        <asp:Label ID="ErrorLabel" runat="server" ForeColor="#CC0000"></asp:Label>
    </form>
</body>
</html>
