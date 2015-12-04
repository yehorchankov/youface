<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Page.aspx.cs" Inherits="HW_3.Page" EnableEventValidation="true" %>
<%@ Import Namespace="AccountsRepository" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>My page</title>
    <style type="text/css">
        .image {
            
        }
        #name {
            font-size: 35px;
            font-family: sans-serif;
            font-weight: bold;
            text-align: center;
        }
        #img {
            text-align: center;
        }
        #actuser {
            font-size: 15px;
            font-family: sans-serif;
            text-align: center;
            color: gray;
            padding: 10px;
        }
        #isuser {
            font-size: 20px;
            padding-top: 5px;
            font-family: sans-serif;
            text-align: center;
            color: gray;
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
        #info {
            width: 35%;
            float: left;
            height: 100%;
            padding-left: 10px;
        }
        #wall {
            width: 45%;
            float: left;
            padding-left: 15%;
            padding-top: 30px;
        }
        #about {
            padding: 10px;
            font-size: 20px;
            font-family: sans-serif;
            color: #00001d;
        }
        .auto-style1 {
            width: 100%;
        }
        #textarea {
            text-align: center;
        }
        .post {
            background-color: #d5fbfb;
        }
        #form1 {
            width: 100%;
        }
        .publdate {
            font-size: 15px;
            padding: 5px;
            text-decoration: cornflowerblue;
            font-family: sans-serif;
            text-align: center;
            color: gray;
        }
        .postbody {
            font-size: 20px;
            padding: 3px;
            font-family: sans-serif;
            color: black;
        }
        .likes {
            font-size: 17px;
            padding: 3px;
            font-family: sans-serif;
            color: gray;
        }
        .hdr {
            font-size: 25px;
            text-align: center;
            font-family: sans-serif;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="menu">
        <table class="auto-style1">
            <tr>
                <td>
        <asp:HyperLink ID="FindPeople" runat="server" NavigateUrl="~/SearchForPeople.aspx">Search for friends</asp:HyperLink></td>
                <td> 
        <a href="EditProfile.aspx">Edit profile</a></td>
                <td>
        <asp:LinkButton ID="Friends" runat="server">My friends</asp:LinkButton>
                </td>
                <td>
        <asp:Button ID="ExitButton" runat="server" OnClick="ExitButton_Click" Text="Log out" Height="50" Width="150"/>
                </td>
                <td>
        <asp:HiddenField runat="server" ID="accountId"/>
                </td>
            </tr>
        </table>
    </div>
    <div id="info">
        <div id="actuser"><asp:Label ID="LblActualUser" runat="server"></asp:Label></div>
        <br />
        <div id="name"><asp:Label ID="LblFName" runat="server"></asp:Label>
            <asp:Label ID="LblLName" runat="server"></asp:Label></div>
        <div id="isuser">&nbsp;<asp:Label ID="LblIsUser" runat="server"></asp:Label></div>
        <br />
        <div id="img"><asp:Image ID="Image" runat="server" CssClass="image" Width="300" Height="400"/></div>
        <br />
        <br />

        <p id="about">
            About me: <asp:Label ID="LblInfo" runat="server"></asp:Label>
        </p>

        <br />
        <asp:Label ID="LblBirthDate" runat="server"></asp:Label>
        <br />
        <asp:Label ID="LblFriends" runat="server"></asp:Label>
        <br />
    </div>
        
    <div id="wall">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div id="textarea"><asp:TextBox ID="InputPost" runat="server" Height="87px" TextMode="MultiLine" Visible="False" Width="235px"></asp:TextBox>
                <br />
                <asp:Button ID="Publicate" runat="server" OnClick="Publicate_Click" Text="Publicate post" Visible="False" /></div>
                <asp:Repeater ID="PostRepeater" runat="server">
                    <HeaderTemplate>
                        <h3 class="hdr">Posts</h3>
                    </HeaderTemplate>
                    <SeparatorTemplate>
                        <hr/>
                    </SeparatorTemplate>
                    <ItemTemplate><div class="post">
                            <p class="publdate">Publicated at <%# ((Post) Container.DataItem).PublicationTime %></p>
                            <p class="postbody">
                                <%# ((Post) Container.DataItem).PostText %>
                            </p>
                            <p class="likes">
                                <%# ((Post) Container.DataItem).LikesCount %>&nbsp;liked this post
                                <a href="LikePost.ashx?post=<%# ((Post) Container.DataItem).PostId %>&id=<%# accountId.Value %>">like</a>
                            </p></div>
                    </ItemTemplate>
                </asp:Repeater>
            </ContentTemplate>
        </asp:UpdatePanel>
        <br />
    </div>
    </form>
</body>
</html>
