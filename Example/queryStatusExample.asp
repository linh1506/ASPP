<%
Dim conn, cmd, sql, recordsAffected
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "your_connection_string"

sql = "INSERT INTO your_table (column1, column2) VALUES ('value1', 'value2')"
Set cmd = Server.CreateObject("ADODB.Command")
cmd.ActiveConnection = conn
cmd.CommandText = sql
cmd.CommandType = adCmdText

cmd.Execute recordsAffected

If recordsAffected > 0 Then
    Response.Write "Insert query succeeded!"
Else
    Response.Write "Insert query failed!"
End If

conn.Close
Set conn = Nothing
' ds
Dim conn, cmd, param
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "your_connection_string"

Set cmd = Server.CreateObject("ADODB.Command")
cmd.ActiveConnection = conn
cmd.CommandText = "INSERT INTO your_table (column1, column2) VALUES (?, ?)"

Set param1 = cmd.CreateParameter("param1", adVarChar, adParamInput, 50, "value1")
Set param2 = cmd.CreateParameter("param2", adInteger, adParamInput, , 123)

cmd.Parameters.Append param1
cmd.Parameters.Append param2

cmd.Execute

conn.Close
Set conn = Nothing
%>
