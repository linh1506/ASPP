<!--#include file="connect.asp"-->
<%
    If (Request.ServerVariables("REQUEST_METHOD") = "POST") THEN
    Dim email, password, responseJson
    email = Request.Form("email")
    password = Request.Form("password")
    If (NOT isnull(email) AND NOT isnull(password) AND TRIM(email)<>"" AND TRIM(password)<>"" ) Then
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
                responseJson = "{""success"": true, ""message"": ""/home.asp""}"
                Response.ContentType = "application/json"
                Response.Write responseJson
                Response.ContentType = "text/html"
                result.Close
                connDB.Close
            else
                Session("Error") = "Your account is blocked"
                responseJson = "{""success"": false, ""message"": ""Your account is blocked""}"
                Response.ContentType = "application/json"
                Response.Write responseJson
                Response.ContentType = "text/html"
            end if
        Else
            ' dang nhap ko thanh cong
            Session("Error") = "Wrong email or password"
            responseJson = "{""success"": false, ""message"": ""Wrong email or password!""}"
            Response.ContentType = "application/json"
            Response.Write responseJson
            Response.ContentType = "text/html"
        End if
    Else
            Session("Error")="Please input email and password."
            responseJson = "{""success"": false, ""message"": ""Please input email and password""}"
            Response.ContentType = "application/json"
            Response.Write responseJson
            Response.ContentType = "text/html"
    End if 
    End if
%>