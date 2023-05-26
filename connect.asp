<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%
Dim connDB
set connDB = Server.CreateObject("ADODB.Connection")
Dim strConnection,ambatukam
strConnection = "Provider=SQLOLEDB.1;Data Source=FIRELINKSHRINE\SQLEXPRESS;Database=DB_ODBG;User Id=sa;Password=123"
connDB.ConnectionString = strConnection
connDB.Open
%>
