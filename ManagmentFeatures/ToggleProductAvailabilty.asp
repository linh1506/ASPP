<!-- #include file="../connect.asp" -->
<%
    dim id
    id = Request.QueryString("id")
    If (cint(id)<>0) Then
        Set cmdPrep = Server.CreateObject("ADODB.Command")
        cmdPrep.ActiveConnection = connDB
        cmdPrep.CommandType = 1
        cmdPrep.CommandText = "SELECT * FROM PRODUCT WHERE ID=?"
        cmdPrep.Parameters(0)=id
        Set Result = cmdPrep.execute
        If not Result.EOF then
            status = not Result("IS_AVAILABLE")
        End If

        Result.Close
        set Result = Nothing
        cmdPrep.CommandText = "update PRODUCT set IS_AVAILABLE = ? where ID = ?"
        cmdPrep.Parameters(0) = status
        cmdPrep.Parameters(1)= id
        dim result
        cmdPrep.execute
        connDB.Close
        if (status = true) then
            Response.Write("true")
        else 
            Response.Write("false")
        end if
    End If

%>