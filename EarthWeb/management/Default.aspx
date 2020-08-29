<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="management_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Earth - Management</title>
    <script src="/js/jquery-3.5.1.js"></script>
    <link href="/css/bootstrap.css" rel="stylesheet" />
    <link href="/css/signin.css" rel="stylesheet" />
    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
        #btnConfirm{margin-top:20px}
    </style>
</head>
<body class="text-center">
    <form runat="server" id="frm" class="form-signin">
        <img class="mb-4" src="/images/logo.jpg" alt="" width="72" height="72" style="border-radius:50px">
        <h1 class="h3 mb-3 font-weight-normal">Please login</h1>

        <asp:TextBox runat="server" ID="username" CssClass="form-control"  placeholder="Username" required autofocus />
        <br />
        <asp:TextBox runat="server" ID="password" CssClass="form-control" TextMode="Password" placeholder="Password" required />
        <br /><asp:Label runat="server" ID="lblInfo" ForeColor="Red" />

        <asp:Button runat="server" ID="btnConfirm" CssClass="btn btn-lg btn-primary btn-block" Text="Login" OnClick="btnConfirm_Click" />
        <p class="mt-5 mb-3 text-muted">&copy; 2020</p>
    </form>
</body>
</html>
