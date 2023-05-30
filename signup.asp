<!--#include file="connect.asp"-->              
<%  
    Response.Charset = "UTF-8"
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
            responseJson = "{""success"": false, ""message"": ""Please enter all required fields""}"
            Response.ContentType = "application/json"
            Response.Write responseJson
            Response.ContentType = "text/html"
        ' kiem tra password co khop khong
        elseif (not (pass1 = pass2)) then
            ' neu khong khop, thong bao
            Session("Error") = "Password does not match"
            responseJson = "{""success"": false, ""message"": ""Password does not match""}"
            Response.ContentType = "application/json"
            Response.Write responseJson
            Response.ContentType = "text/html"
        else 
            ' kiem tra email da ton tai hay khong
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
                Session("Error") = "Email existed"
                responseJson = "{""success"": false, ""message"": ""Email existed""}"
                Response.ContentType = "application/json"
                Response.Write responseJson
                Response.ContentType = "text/html"
            else
                ' kiem tra so dien thoai da ton tai hay khong
                cmdPrep.CommandText = "SELECT COUNT(PHONE) AS DEM FROM USERS WHERE PHONE='" & phone & "'"
                set result = cmdPrep.execute
                ' neu so dien thoai da ton tai, thong bao
                if (result("DEM")=1) then
                Session("Error") = "Phone existed"
                responseJson = "{""success"": false, ""message"": ""Phone existed""}"
                Response.ContentType = "application/json"
                Response.Write responseJson
                Response.ContentType = "text/html"
                else 
                    ' Neu da thoa man dieu kien, insert thong tin khach
                    cmdPrep.CommandText = "INSERT INTO USERS VALUES (N'" & address & "','" & email & "',N'" & name & "','" & pass1 & "','" & phone & "','USER',1)"
                    cmdPrep.execute
                    ' Thong bao tao tai khoan thanh cong
                    Session("Success") = "CREATE ACCOUNT SUCCESSFUL"
                    ' Redirect den trang login.asp

                    responseJson = "{""success"": true, ""message"": ""Cảm ơn bạn đã đăng ký!""}"
                    Response.ContentType = "application/json"
                    Response.Write responseJson
                    Response.ContentType = "text/html"
                    ' Dong ket noi
                end if
            end if
        End if 
    End if
%>