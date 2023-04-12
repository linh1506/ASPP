<!--#include file="connect.asp"-->
<%
If (Request.ServerVariables("REQUEST_METHOD") = "POST") THEN
  Dim email, password
  email = Request.Form("email")
  password = Request.Form("password")
  If (NOT isnull(email) AND NOT isnull(password) AND TRIM(email)<>"" AND TRIM(password)<>"" ) Then
      connDB.Open
      Dim sql
      sql = "SELECT * FROM USERS WHERE EMAIL = '" & email & "' AND PASSWORD = '" & password & "'"
      Dim cmdPrep
      set cmdPrep = Server.CreateObject("ADODB.Command")
      cmdPrep.ActiveConnection = connDB
      cmdPrep.CommandType=1
      cmdPrep.Prepared=true
      cmdPrep.CommandText = sql
      Dim result
      set result = cmdPrep.execute
      'kiem tra ket qua result o day
      If not result.EOF Then
          ' dang nhap thanh cong
          if result("STATUS") = true THEN
            Session("Email")=result("EMAIL")
            Session("Role") = result("ROLE")
            Session("Id") = result("ID")
            Session("Name") = result("NAME")
            Session("Success")="Login Successfully"
            result.Close
            connDB.Close
            Response.redirect("home.asp")
          else
            Session("Error") = "Your account is blocked"
            result.Close
            connDB.Close
          end if
      Else
          ' dang nhap ko thanh cong
          Session("Error") = "Wrong email or password"
      End if
  Else
      Session("Error")="Please input email and password."
  End if 
End if
%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      rel="stylesheet"
      href="./bootstrap-5.2.0-dist/css/bootstrap.min.css"
    />
    <link
      rel="stylesheet"
      href="./stylelogin.css"
    />
    <script src="./jquery-3.6.1.min.js"></script>
  </head>
  <body>
    <!--#include file="header.asp"-->
    <div class="container loginform">
        <form method="post">
            <div class="input-group flex-nowrap">
                <span class="input-group-text label-long">Email</span>
                <input type="text" class="form-control" name="email"/>
            </div>
            <div class="input-group flex-nowrap">
                <span class="input-group-text label-long">Password</span>
                <input type="password" class="form-control" name="password" />
            </div>
            <br />
            <input type="submit" class="btn btn-outline-success right" />
        </form>

        <div class="signup">
            <p>Chưa có tài khoản ?</p>
            <a href="signup.asp" class="btn btn-success">Tạo tài khoản</a>
        </div>
    </div>
  </body>
</html>
