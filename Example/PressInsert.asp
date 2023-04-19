<!--#include file="../connect.asp"-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <button onclick="Press()">Vailon</button>
    <%
                    Dim cmdPrep
                    Set cmdPrep = Server.CreateObject("ADODB.Command")
                    cmdPrep.ActiveConnection = connDB
                    cmdPrep.CommandType = 1
                    cmdPrep.Prepared = True
                    
                    
                        Response.Write "hello?<br>"
                        Dim RowAffected
                        Dim sql
                        sql =  "insert into PRODUCT_SIZE values(" & 45 & "," & 2 & "," & 3 & ")"
                        ' Set Result  = cmdPrep.execute(sqlQuery)
                        connDB.execute sql,RowAffected
                        if RowAffected>0 then
                            Response.Write "hurray!!"
                        Else 
                         Response.Write "<br>Something went wrong"
                        end if
                
    
    %>
</body>
</html>