<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="HW_3.NativePages.EditProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        html {
            font-family: sans-serif;
        }
         .auto-style1 {
             width: 100%;
         }
        #tabl {
            padding-left: 20%;
            padding-right: 50%;
        }
        .auto-style2 {
            width: 237px;
        }
        .auto-style3 {
            width: 905px;
        }
        .auto-style4 {
            width: 1347px;
        }
        #hdr {
            text-align: center;
        }
        #center {
            text-align: center;
            background-color: #f5deb3;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="tabl">
        <div id="center"><asp:LinkButton ID="linkToHome" runat="server">To my page</asp:LinkButton></div>
        <br />
        <br />
        <div id="hdr">
            <h2>Edit your profile</h2></div>
    <br />
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">Email</td>
                <td>
                    <asp:TextBox ID="InputEmail" runat="server" TextMode="Email"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Actual password</td>
                <td>
                    <asp:TextBox ID="InputActualPassword" runat="server" TextMode="Password"></asp:TextBox>
                    *<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator1" runat="server" ErrorMessage="This field is required" ControlToValidate="InputActualPassword" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">New password</td>
                <td>
                    <asp:TextBox ID="InputPassword" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">New password again</td>
                <td>
                    <asp:TextBox ID="InputPassword2" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
        </table>
        <br />
        <table class="auto-style1">
            <tr>
                <td class="auto-style3">First name</td>
                <td class="auto-style4">
                    <asp:TextBox ID="InputFName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Last name</td>
                <td class="auto-style4">
                    <asp:TextBox ID="InputLName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Information about you</td>
                <td class="auto-style4">
                    <asp:TextBox ID="InputInformation" runat="server" Height="90px" TextMode="MultiLine" Width="244px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Birth date</td>
                <td class="auto-style4">
                    <asp:TextBox ID="InputBirthDate" runat="server" TextMode="Date"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Image ID="Photo" runat="server" Width="183px" Height="228px"/>
                </td>
                <td class="auto-style4">
                    <asp:FileUpload ID="PhotoUpload" runat="server" />
                </td>
            </tr>
        </table>
        <br />
        *Please, ensure entering your actual password to confirm changes<br />
        <asp:Button ID="Confirm" runat="server" Text="Save changes" OnClick="Confirm_Click" />
    
    </div>
    </form>
</body>
</html>
