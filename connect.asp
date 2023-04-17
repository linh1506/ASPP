<%
'code here
Dim connDB
set connDB = Server.CreateObject("ADODB.Connection")
Dim strConnection
strConnection = "Provider=SQLOLEDB.1;Data Source=NOTDOTBON;Database=DB_ODBG;User Id=ma;Password=1"
connDB.ConnectionString = strConnection
%>