<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchForPeople.aspx.cs" Inherits="HW_3.NativePages.SearchForPeople" %>
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
        #home {
            width: 100px;
            height: 25px;
            background-color: #e6e6fa;
            text-align: center;
        }
        #bdy {
            padding-left: 45%;
            padding-right: 15%;
        }
        .name {
            text-decoration-line: none;
            text-decoration: none;
            font-size: 35px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="home"><asp:LinkButton ID="linkToHome" runat="server">To my page</asp:LinkButton></div>
    <div id="bdy">

        <br />
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div id="bar"><asp:TextBox ID="InputData" runat="server" TextMode="Search"></asp:TextBox>
                    <asp:Button ID="Find" runat="server" OnClick="Find_Click" Text="Go"/></div>
                <div id="rep"><asp:Repeater ID="RepeaterPeople" runat="server">
                    <HeaderTemplate>
                        <h2>Find your friends</h2>
                    </HeaderTemplate>
                    <SeparatorTemplate>
                        <br/>
                        <br/>
                    </SeparatorTemplate>
                    <ItemTemplate>
                        <div class="name"><a href="Page.aspx?id=<%# ((Account) Container.DataItem).RegistrationInfo.AccountId %>">
                        <%# ((Account) Container.DataItem).FirstName %>&nbsp;<%# ((Account) Container.DataItem).LastName %></a></div>
                        <br/>
                        <div class="add"> @<%# ((Account) Container.DataItem).RegistrationInfo.NickName %>&nbsp;<a href="AddFriend.ashx?friend=<%# ((Account) Container.DataItem).RegistrationInfo.AccountId %>">Add to friends</a></div>
                    </ItemTemplate>
                </asp:Repeater></div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdateProgress ID="UpdateProgress" runat="server" AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="0">
            <ProgressTemplate>
                <asp:Image ID="LoadingProgress" runat="server" Height="81px" ImageUrl="~/Photos/loading-black.gif" Width="81px" />
            </ProgressTemplate>
        </asp:UpdateProgress>
        <asp:Label ID="LblResultsFound" runat="server"></asp:Label>
        <br />
    
    </div>
    </form>
</body>
</html>
