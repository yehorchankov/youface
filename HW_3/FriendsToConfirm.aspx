<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FriendsToConfirm.aspx.cs" Inherits="HW_3.NativePages.FriendsToConfirm" %>
<%@ Import Namespace="AccountsRepository" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
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
        <div id="menu"><asp:LinkButton ID="linkToHome" runat="server">To my page</asp:LinkButton></div>
        <asp:Repeater ID="RepeaterFriends" runat="server">
            <HeaderTemplate>
                <div id="head">
                    <h2>People to be your friend</h2></div>
            </HeaderTemplate>
            <SeparatorTemplate>
                <br/>
            </SeparatorTemplate>
            <ItemTemplate>
                <div class="name"><%# ((Account)Container.DataItem).FirstName %>&nbsp;<%# ((Account)Container.DataItem).LastName %></div>
                <br/>
                <div class="nick">
                    @<%# ((Account) Container.DataItem).RegistrationInfo.NickName %>
                </div><div class="acc">
                    <a href="ConfirmFriendship.ashx?friend=
                    <%# ((Account) Container.DataItem).RegistrationInfo.AccountId %>&acc=true">
                        Accept friendship</a>&nbsp;|&nbsp;
                    <a href="ConfirmFriendship.ashx?friend=
                    <%# ((Account) Container.DataItem).RegistrationInfo.AccountId %>&acc=false">
                        Don't accept</a></div>
                <br/>
                 
            </ItemTemplate>
        </asp:Repeater>
    
    </div>
    </form>
</body>
</html>
