<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchForPeople.aspx.cs" Inherits="HW_3.NativePages.SearchForPeople" %>
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
        <br />
        <asp:TextBox ID="InputData" runat="server"></asp:TextBox>
        <asp:Button ID="Find" runat="server" Text="Go" OnClick="Find_Click" />
    
        <asp:Repeater ID="RepeaterPeople" runat="server">
            <HeaderTemplate>
                <h2>Find your friends</h2>
            </HeaderTemplate>
            <SeparatorTemplate>
                <br/>
                <br/>
            </SeparatorTemplate>
            <ItemTemplate>
                <a href="Page.aspx?id=<%# ((Account)Container.DataItem).RegistrationInfo.AccountId %>">
                    <%# ((Account)Container.DataItem).FirstName %>&nbsp;<%# ((Account)Container.DataItem).LastName %>
                </a>
                <br/>
                Add to friends <a href="AddFriend.aspx?friend=<%# ((Account)Container.DataItem).RegistrationInfo.AccountId %>">
                    @<%# ((Account) Container.DataItem).RegistrationInfo.NickName %>
                </a>
            </ItemTemplate>
        </asp:Repeater>
    
    </div>
    </form>
</body>
</html>
