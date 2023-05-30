<!-- #include file="../connect.asp" -->
<%
    dim id
    id = Request.QueryString("id")
    If (isnull(id) OR trim(id) = "") then 
        id=0
    End if
    If (cint(id)<>0) Then
        Set cmdPrep = Server.CreateObject("ADODB.Command")
        cmdPrep.ActiveConnection = connDB
        cmdPrep.CommandType = 1
        cmdPrep.CommandText = "SELECT * FROM ORDERS WHERE ID=?"
        cmdPrep.Parameters(0)=id
        Set Result = cmdPrep.execute
        If not Result.EOF then
            status = Result("STATUS")
        End If
        Result.Close()
        cmdPrep.CommandText = "UPDATE ORDERS SET STATUS=? WHERE ID=?"
        if(status = 0) then
            cmdPrep.Parameters(0) = 1
        elseif status = 1 then
            cmdPrep.Parameters(0) = 2
        end if
        cmdPrep.Parameters(1)= id
        dim result
        set result = cmdPrep.execute()
        If status = 0 Then
            Response.Write("1")
        ElseIF status = 1 then
            Response.Write("2")
        End if
    End If
%>