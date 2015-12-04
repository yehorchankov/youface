<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HW_3.Authorization.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>YouFace - social network</title>
    <style type="text/css">
        a {
            text-decoration: none;
        }
         html {
             font-family:sans-serif;
         }
        body {
            background: #ffffff;
        }
        #center {
            margin: auto;
            padding-top: 60px;
            width: 35%;
            text-align: center;
        }
        #form1 {
            top: 60px;
        }
        #logo {
            border: #ff0000 6px solid;
            border-radius: 15px;
            width: 45%;
            text-align: center;
            margin: auto;
        }
        h1 {
            color: #000;
            font-size: 50px;
        }
        #reg {
            border: #e24d64 3px solid;
            border-radius: 10px;
            background: #fd7070;
            width: 45%;
            float: left;
        }
        #areg {
            font-size: 30px;
        }
        #log {
            border: #4343e0 3px solid;
            border-radius: 10px;
            background: #4169e1;
            width: 45%;
            float: right;
        }
        #alog {
            font-size: 30px;
        }
        footer {
            text-align: center;
            color: gray;
            padding: 20%;
        }
    </style>
</head>
<body><div style="height: 95%">
    <div style="text-align: center; height: 100px; padding-top: 100px">
        <div id="logo">
            <h1>Welcome to YouFace</h1>
        </div>
    </div>
    <form id="form1" runat="server">
        <div id="center">

            <br/>
            <div id="reg">
                <a href="Register.aspx" id="areg">Registrate</a>
            </div>&nbsp;
            <div id="log"><a id="alog" href="LogIn.aspx">Log in</a>
            </div>
            <br/>
        </div>
    </form></div>
    <footer>YouFace social network. All rights reserved (c) 2015</footer>
</body>
</html>
