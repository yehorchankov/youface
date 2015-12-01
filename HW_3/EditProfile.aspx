<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="HW_3.NativePages.EditProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:LinkButton ID="linkToHome" runat="server">To my page</asp:LinkButton>
        <br />
        <br />
    <h2>Edit your profile</h2>
    <br />
        <table class="auto-style1">
            <tr>
                <td>Email</td>
                <td>
                    <asp:TextBox ID="InputEmail" runat="server" TextMode="Email"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Actual password</td>
                <td>
                    <asp:TextBox ID="InputActualPassword" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="InputActualPassword"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>New password</td>
                <td>
                    <asp:TextBox ID="InputPassword" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>New password again</td>
                <td>
                    <asp:TextBox ID="InputPassword2" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
        </table>
        <br />
        <table class="auto-style1">
            <tr>
                <td>First name</td>
                <td>
                    <asp:TextBox ID="InputFName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Last name</td>
                <td>
                    <asp:TextBox ID="InputLName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Information about you</td>
                <td>
                    <asp:TextBox ID="InputInformation" runat="server" Height="90px" TextMode="MultiLine" Width="244px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Birth date</td>
                <td>
                    <asp:TextBox ID="InputBirthDate" runat="server" TextMode="Date"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Image ID="Photo" runat="server" />
                </td>
                <td>
                    <asp:FileUpload ID="PhotoUpload" runat="server" />
                </td>
            </tr>
        </table>
        <br />
        Please, ensure entering your actual password to confirm changes<br />
        <asp:Button ID="Confirm" runat="server" Text="Save changes" OnClick="Confirm_Click" />
    
    </div>
    </form>
</body>
</html>
