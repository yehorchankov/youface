<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FriendsToConfirm.aspx.cs" Inherits="HW_3.NativePages.FriendsToConfirm" %>
<%@ Import Namespace="AccountsRepository" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:LinkButton ID="linkToHome" runat="server">To my page</asp:LinkButton>
        <asp:Repeater ID="RepeaterFriends" runat="server">
            <HeaderTemplate>
                <h2>People to be your friend</h2>
            </HeaderTemplate>
            <SeparatorTemplate>
                <br/>
            </SeparatorTemplate>
            <ItemTemplate>
                <%# ((Account)Container.DataItem).FirstName %>&nbsp;<%# ((Account)Container.DataItem).LastName %>
                <br/>
                Add to friends <a href="ConfirmFriendship.aspx?friend=
                    <%# ((Account)Container.DataItem).RegistrationInfo.AccountId %>">
                    @<%# ((Account) Container.DataItem).RegistrationInfo.NickName %></a>
            </ItemTemplate>
        </asp:Repeater>
    
    </div>
    </form>
</body>
</html>
