<!--#include file="../connect.asp"-->
<%
    dim id,passwordcorrect,passwordchange,passwordreenter,password
    id = Request.querystring("id")
    password = Request.form("password")
    passwordchange = Request.form("passwordchange")
    passwordreenter = Request.form("passwordreenter")


    if isnull(password) or password = "" or isnull(passwordreenter) or passwordreenter = "" or isnull(passwordchange) or passwordchange ="" then
        Session("Error") = "please enter password, password change and re-enter password"
        Response.Redirect("./profile.asp")
    else 
        if trim(passwordchange) <> trim(passwordreenter) then
            Session("Error") = "password change is different re-enter password"
            Response.Redirect("./profile.asp")
        end if
    end if

    Set cmdPrep = Server.CreateObject("ADODB.Command")
    cmdPrep.ActiveConnection = connDB
    cmdPrep.CommandType = 1
    cmdPrep.Prepared = True
    cmdPrep.commandText = "select * from USERS WHERE ID = '" & id & "'"
    set result = cmdPrep.execute
    if not result.EOF then
        passwordcorrect = result("password")
        if trim(password) <> trim(passwordcorrect) then
            Session("Error") = "password is not correct"
            Response.Redirect("./profile.asp")
        else
            cmdPrep.commandText = "update USERS set PASSWORD ='" &passwordchange& "' where ID = '" &id& "'"
            cmdPrep.execute
            Session("Success") = "change password successfully"
            Response.Redirect("./profile.asp")
        end if
    else
        Session("Error") = "not exists user"
        Response.Redirect("./profile.asp")
    end if
    result.Close()
    connDB.Close()
%>