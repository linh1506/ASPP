<%
'code here
Dim connDB
set connDB = Server.CreateObject("ADODB.Connection")
Dim strConnection,ambatukam
' Duy
' strConnection = "Provider=SQLOLEDB.1;Data Source=LAPTOP-AMVIO3LT\SQLEXPRESS;Database=DB_ODBG;User Id= duyvu;Password=16012002"
' Son
' strConnection = "Provider=SQLOLEDB.1;Data Source=NOTDOTBON;Database=DB_ODBG;User Id=ma;Password=1"
'strConnection = "Provider=SQLOLEDB.1;Data Source=LAPTOP-AMVIO3LT\SQLEXPRESS;Database=DB_ODBG;User Id= duyvu;Password=16012002"
'Son
'strConnection = "Provider=SQLOLEDB.1;Data Source=NOTDOTBON;Database=DB_ODBG;User Id=ma;Password=1"
' Linh
strConnection = "Provider=SQLOLEDB.1;Data Source=MSI\LINH;Database=DB_ODBG;User Id=sa;Password=123456789"
' Vdacs
' strConnection = "Provider=SQLOLEDB.1;Data Source=VdacHUB\SQLEXPRESS;Database=DB_ODBG;User Id=sa;Password=123"
' strConnection = "Provider=SQLOLEDB.1;Data Source=FIRELINKSHRINE\SQLEXPRESS;Database=DB_ODBG;User Id=sa;Password=123"
connDB.ConnectionString = strConnection
connDB.Open
%>
