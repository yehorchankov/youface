<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Friends.aspx.cs" Inherits="HW_3.NativePages.Friends" %>
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
         <asp:LinkButton ID="MyFriends" runat="server">My friends</asp:LinkButton>
&nbsp;| 
        <a href="FriendsToConfirm.aspx">My friendship proposals</a>&nbsp;|&nbsp;
        <asp:LinkButton ID="linkToHome" runat="server">To my page</asp:LinkButton>
        <asp:Repeater ID="RepeaterFriends" runat="server">
            <HeaderTemplate>
                <h2>Your friends</h2>
            </HeaderTemplate>
            <SeparatorTemplate>
                <br/>
                <br/>
            </SeparatorTemplate>
            <ItemTemplate>
                <a href="Page.aspx?id=<%# ((Account) Container.DataItem).RegistrationInfo.AccountId %>">
                    <%# ((Account) Container.DataItem).FirstName %>&nbsp;<%# ((Account) Container.DataItem).LastName %>
                </a>
                <br/>
                @<%# ((Account) Container.DataItem).RegistrationInfo.NickName %>
            </ItemTemplate>
        </asp:Repeater>
    
    </div>
    </form>
</body>
</html>
