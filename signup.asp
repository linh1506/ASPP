<!--#include file="connect.asp"-->
<%
    If (Request.ServerVariables("REQUEST_METHOD") = "POST") THEN
        name = Request.form("name")
        address = Request.form("address")
        email = Request.form("email")
        phone = Request.form("phone")
        pass1 = Request.form("pass1")
        pass2 = Request.form("pass2")

        ' kiem tra cac truong co rong khong
        if (IsNull(name) or Trim(name) = "" or IsNull(address) or Trim(address) = "" or IsNull(email) or Trim(email) = "" or IsNull(phone) or Trim(phone) = "" or IsNull(pass1) or Trim(pass1) = "" or IsNull(pass2) or Trim(pass2) = "") then
            ' neu rong, thong bao
            Session("Error") = "Please enter all required fields"
        ' kiem tra password co khop khong
        elseif (not (pass1 = pass2)) then
            ' neu khong khop, thong bao
            Session("Error") = "Password is not match"
        else 
            ' kiem tra email da ton tai hay khong
            connDB.open
            Dim sql
            sql = "SELECT COUNT(EMAIL) AS DEM FROM USERS WHERE EMAIL='" & email & "'"
            Dim cmdPrep
            set cmdPrep = Server.CreateObject("ADODB.Command")
            cmdPrep.ActiveConnection = connDB
            cmdPrep.CommandType=1
            cmdPrep.Prepared=true
            cmdPrep.CommandText = sql
            Dim result
            set result = cmdPrep.execute
            ' neu email da ton tai, thong bao
            if (result("DEM")=1) then
                Session("Error") = "Email is exist"
            else
                ' kiem tra so dien thoai da ton tai hay khong
                cmdPrep.CommandText = "SELECT COUNT(PHONE) AS DEM FROM USERS WHERE PHONE='" & phone & "'"
                set result = cmdPrep.execute
                ' neu so dien thoai da ton tai, thong bao
                if (result("DEM")=1) then
                Session("Error") = "Phone is exist"
                else 
                    ' Neu da thoa man dieu kien, insert thong tin khach
                    cmdPrep.CommandText = "INSERT INTO USERS VALUES ('" & address & "','" & email & "','" & name & "','" & pass1 & "','" & phone & "','USER',1)"
                    cmdPrep.execute
                    ' Thong bao tao tai khoan thanh cong
                    Session("Success") = "CREATE ACCOUNT SUCCESSFUL"
                    ' Redirect den trang login.asp
                    Response.Redirect "login.asp"
                    ' Dong ket noi
                    connDB.close
                    result.close
                end if
            end if
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
        <script src="./bootstrap-5.2.0-dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <!--#include file="header.asp"-->
        <div class="container loginform">
            <form method="post">
                <!--Name--> 
                <label for="name" class="form-label">Name</label>
                <input type="text" class="form-control" id="name" name="name">

                <!--Address--> 
                <label for="address" class="form-label">Address</label>
                <input type="text" class="form-control" id="address" name="address">

                <!--Email address--> 
                <label for="email" class="form-label">Email address</label>
                <input type="text" class="form-control" id="email" name="email">

                <!--Phone--> 
                <label for="phone" class="form-label">Phone</label>
                <input type="text" class="form-control" id="phone" name="phone">

                <!--Password1--> 
                <label for="pass1" class="form-label">Password</label>
                <input type="password" class="form-control" id="pass1" name="pass1">

                <!--Password2--> 
                <label for="pass2" class="form-label">Confirm Password</label>
                <input type="password" class="form-control" id="pass2" name="pass2">

                <br>
                <input type="submit" class="btn btn-success">
            </form>
        </div>
    </body>
</html>