<!--#include file="../connect.asp"-->
<%
  Dim errorcode
  errorcode = Request.QueryString("code")
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Oops</title>
    <link
      rel="stylesheet"
      href="../bootstrap-5.2.0-dist/css/bootstrap.min.css"
    />
    <link
      rel="stylesheet"
      href="/UIcomponents/ShoppingHeader.css"
    />
    <script src="../Jquery/jquery-3.6.1.min.js"></script>
    <link
      rel="stylesheet"
      href="/Errors/404.css"
    />
    <link rel="stylesheet" href="/Resources/web-font-files/lineicons.css">
</head>
<body>
    <!--#include file="../UIcomponents/ShoppingHeader.asp"-->
    <div class="page"> 
        <h1 id="pageheader" >ERROR 404: Something definitely went Wrong <span>🤮</span></h1>
        <h3 id="pagesub" >Don't try that again<h3>
    </div>
   
</body>
</html>
