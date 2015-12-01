<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="HW_3.Authorization.Register"%>

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
    
        <table class="auto-style1">
            <tr>
                <td>Your nickname</td>
                <td>
                    <asp:TextBox ID="InputNickname" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator1" runat="server" ControlToValidate="InputNickname" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Email</td>
                <td>
                    <asp:TextBox ID="InputEmail" runat="server" TextMode="Email"></asp:TextBox>
                    <asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator2" runat="server" ControlToValidate="InputEmail" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Password</td>
                <td>
                    <asp:TextBox ID="InputPassword" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator3" runat="server" ControlToValidate="InputPassword" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Password again</td>
                <td>
                    <asp:TextBox ID="InputPasswordAgain" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:CompareValidator EnableClientScript="False" ID="CompareValidator1" runat="server" ControlToCompare="InputPassword" ControlToValidate="InputPasswordAgain" ErrorMessage="CompareValidator"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td>First name</td>
                <td>
                    <asp:TextBox ID="InputFName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator4" runat="server" ControlToValidate="InputFName" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Last name</td>
                <td>
                    <asp:TextBox ID="InputLName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator5" runat="server" ControlToValidate="InputLName" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Information about you</td>
                <td>
                    <asp:TextBox ID="InputInformation" runat="server" Height="102px" TextMode="MultiLine" Width="270px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Birth date</td>
                <td>
                    <asp:TextBox ID="InputBirthDate" runat="server" TextMode="Date"></asp:TextBox>
                    <asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator6" runat="server" ControlToValidate="InputBirthDate" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Your photo</td>
                <td>
                    <asp:FileUpload ID="PhotoUpload" runat="server" />
                </td>
            </tr>
        </table>
    
    </div>
        <asp:Button ID="ButtonConfirm" runat="server" OnClick="ButtonConfirm_Click" Text="Registrate" />
    </form>
</body>
</html>
