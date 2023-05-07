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
' Declare an array with size 10
Dim myArray(2)

' Put 3 values into the array
myArray(0) = "value1"
myArray(1) = "value2"
myArray(2) = "value3"

' Re-dimension the array to size 3

' The array now has a size of 3
Response.Write "Array size: " & UBound(myArray) + 1
Response.Write myArray(2)
%>

</body>
</html>