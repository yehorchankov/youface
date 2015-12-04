<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="HW_3.Authorization.Register"%>

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
         form {
             width: 100%;
         }
        td {
            font-size: 18px;
             width: 55%;
            padding: 5px;
        }
        .auto-style2 {
            width: 305px;
        }
        #table {
            border: 4px blue solid;
            border-radius: 15px;
            width: 50%;
            padding: 15px;
            margin:auto;
        }
        input {
            color: #2f4f4f;
            font-size: 15px;
        }
        .Submit {
            font-size: 17px;
            height: 30px;
            width: 150px;
        }
        #buttonwrapper {
            padding: 20px;
            text-align: center;
        }
        #prev {
            position: absolute;
            top: 15px;
            left: 15px;
            text-decoration: none;
        }
    </style>
</head>
<body>
<div id="prev">
    <a href="Default.aspx">Back</a>
</div>
    <form id="form1" runat="server" >
    <div id="table">
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">Your nickname</td>
                <td>
                    <asp:TextBox ID="InputNickname" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator1" runat="server" ControlToValidate="InputNickname" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:Button ID="Check" runat="server" OnClick="Check_Click" Text="Check" />
                            <asp:Label ID="NickExists" runat="server"></asp:Label>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Email</td>
                <td>
                    <asp:TextBox ID="InputEmail" runat="server" TextMode="Email"></asp:TextBox>
                    <asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator2" runat="server" ControlToValidate="InputEmail" ErrorMessage="Invalid email" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Password</td>
                <td>
                    <asp:TextBox ID="InputPassword" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator3" runat="server" ControlToValidate="InputPassword" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Password again</td>
                <td>
                    <asp:TextBox ID="InputPasswordAgain" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:CompareValidator EnableClientScript="False" ID="CompareValidator1" runat="server" ControlToCompare="InputPassword" ControlToValidate="InputPasswordAgain" ErrorMessage="Password doesn't match" ForeColor="Red"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">First name</td>
                <td>
                    <asp:TextBox ID="InputFName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator4" runat="server" ControlToValidate="InputFName" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Last name</td>
                <td>
                    <asp:TextBox ID="InputLName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator5" runat="server" ControlToValidate="InputLName" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Information about you</td>
                <td>
                    <asp:TextBox ID="InputInformation" runat="server" Height="102px" TextMode="MultiLine" Width="270px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Birth date</td>
                <td>
                    <asp:TextBox ID="InputBirthDate" runat="server" TextMode="Date"></asp:TextBox>
                    <asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator6" runat="server" ControlToValidate="InputBirthDate" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Your photo</td>
                <td>
                    <asp:FileUpload ID="PhotoUpload" runat="server" />
                </td>
            </tr>
        </table>
    
    </div>
        <div id="buttonwrapper">
            <asp:Button ID="ButtonConfirm" runat="server" OnClick="ButtonConfirm_Click" Text="Registrate" CssClass="Submit"/></div>
    </form>
</body>
</html>
