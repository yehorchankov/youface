<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Page.aspx.cs" Inherits="HW_3.NativePages.Page" EnableEventValidation="true" %>
<%@ Import Namespace="AccountsRepository" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>My page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:HiddenField runat="server" ID="accountId"/>
        <asp:HyperLink ID="FindPeople" runat="server" NavigateUrl="~/SearchForPeople.aspx">Look for friends</asp:HyperLink>&nbsp;|&nbsp; 
        <a href="EditProfile.aspx">Edit profile</a>&nbsp;|&nbsp;
        <asp:LinkButton ID="Friends" runat="server">Friends</asp:LinkButton>
        <br/>
        <asp:Label ID="LblActualUser" runat="server"></asp:Label>
        <br />
        <asp:Label ID="LblFName" runat="server"></asp:Label>
        &nbsp;<asp:Label ID="LblLName" runat="server"></asp:Label>
        &nbsp;<asp:Label ID="LblIsUser" runat="server"></asp:Label>
        <br />
        <asp:Image ID="Image" runat="server" />
        <br />
        <br />

        <asp:Label ID="LblInfo" runat="server"></asp:Label>

        <br />
        <asp:Label ID="LblBirthDate" runat="server"></asp:Label>
        <br />
        <asp:Label ID="LblFriends" runat="server"></asp:Label>
        <br />
        
        
        <br />
        <asp:TextBox ID="InputPost" runat="server" Height="87px" TextMode="MultiLine" Visible="False" Width="235px"></asp:TextBox>
        <br />
        <asp:Button ID="Publicate" runat="server" OnClick="Publicate_Click" Text="Publicate post" Visible="False" />
        
        
        <asp:Repeater ID="PostRepeater" runat="server">
            <HeaderTemplate>
                <h3>Posts</h3>
            </HeaderTemplate>
            <SeparatorTemplate>
                <hr/>
            </SeparatorTemplate>
            <ItemTemplate>
                <%# ((Post)Container.DataItem).PublicationTime %>
                <p>
                    <%# ((Post)Container.DataItem).PostText %>
                </p>
                <%# ((Post)Container.DataItem).LikesCount %> liked this post
                <a href="LikePost.aspx?post=<%# ((Post)Container.DataItem).PostId %>&id=<%# accountId.Value %>">like</a>
            </ItemTemplate>
        </asp:Repeater>
    </div>
        <asp:Button ID="ExitButton" runat="server" OnClick="ExitButton_Click" Text="Log out" />
    </form>
</body>
</html>
