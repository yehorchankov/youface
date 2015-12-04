<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Friends.aspx.cs" Inherits="HW_3.NativePages.Friends" %>
<%@ Import Namespace="AccountsRepository" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        html {
            font-family: sans-serif;
        }
        #menu {
            text-decoration: none;
            text-underline: none;
            font-size: 20px;
            font-family: sans-serif;
            background-color: #f0caa4;
            width: 96.5%;
            text-align: center;
            padding: 20px;
        }
        .name {
            font-size: 30px;
        }
        .nick {
            font-size: 20px;
            color: gray;
        }
        #head {
            text-align: center;
            font-size: 35px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div id="menu"><table class="auto-style1">
            <tr>
                <td>
                    <asp:LinkButton ID="MyFriends" runat="server">My friends</asp:LinkButton>
                </td>
                <td>
                    <a href="FriendsToConfirm.aspx">My friendship proposals</a></td>
                <td>
                    <asp:LinkButton ID="linkToHome" runat="server">To my page</asp:LinkButton>
                </td>
            </tr>
        </table></div>
        <asp:Repeater ID="RepeaterFriends" runat="server">
            <HeaderTemplate>
                <div id="head">
                    <h2>Your friends</h2></div>
            </HeaderTemplate>
            <SeparatorTemplate>
                <br/>
                <br/>
            </SeparatorTemplate>
            <ItemTemplate>
                <div class="name"><a href="Page.aspx?id=<%# ((Account) Container.DataItem).RegistrationInfo.AccountId %>">
                    <%# ((Account) Container.DataItem).FirstName %>&nbsp;<%# ((Account) Container.DataItem).LastName %></a></div>
                <br/>
                <div class="nick">@<%# ((Account) Container.DataItem).RegistrationInfo.NickName %></div>
            </ItemTemplate>
        </asp:Repeater>
    
    </div>
    </form>
</body>
</html>
