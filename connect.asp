<%
Dim connDB
set connDB = Server.CreateObject("ADODB.Connection")
Dim strConnection
strConnection = "Provider=SQLOLEDB.1;Data Source=MSI\LINH;Database=DB_ODBG;User Id=sa;Password=123456789"
connDB.ConnectionString = strConnection
%>