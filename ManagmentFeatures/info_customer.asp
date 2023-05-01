<!--#include file="../security.asp"-->

<!--#include file="../connect.asp"-->
<!--#include file="../models/customers.asp"-->
<%
    id = Request.QueryString("id")
    dim cmdPrep 
    Set cmdPrep = Server.CreateObject("ADODB.Command")
    cmdPrep.ActiveConnection = connDB
    cmdPrep.CommandType = 1
    cmdPrep.Prepared = True
    cmdPrep.commandText = "select count(id) as count from USERS where Id = " & id
    set Result = cmdPrep.execute
    if (Result("count") = 1) then
        cmdPrep.commandText = "select * from USERS where Id = " & id
        set Result = cmdPrep.execute
        set cust = New customers
        cust.Id = Result("ID")
        cust.Address = Result("ADDRESS")
        cust.Name = Result("NAME")
        cust.Email = Result("EMAIL")
        cust.Phone = Result("PHONE")
        cust.Status = Result("STATUS")
        Result.Close
        set Result = nothing
    Else
        Response.Redirect("../Errors/404.asp")
    end if
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="./bootstrap-5.2.0-dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="./stylelogin.css" />
    <link rel="stylesheet" href="./Resources/web-font-files/lineicons.css">
    <script src="./Jquery/jquery-3.6.1.min.js"></script>
  </head>
  <body>
    <p>ID: <%=cust.Id%></p>
    <p>Name: <%=cust.Name%></p>
    <p>Email: <%=cust.Email%></p>
    <p>Phone: <%=cust.Phone%></p>
    <p>Address: <%=cust.Address%></p>
    <p>All orders previous:</p>
  </body>
</html>