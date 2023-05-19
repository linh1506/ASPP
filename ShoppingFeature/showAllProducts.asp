<!--#include file="../connect.asp"-->
<!--#include file="../models/productsInList.asp"-->

<%

    dim cmdPrep
    Set cmdPrep = Server.CreateObject("ADODB.Command")
    cmdPrep.ActiveConnection = connDB
    cmdPrep.CommandType = 1
    cmdPrep.Prepared = True
    cmdPrep.CommandText = "SELECT ID, NAME, PRICE, JSON_VALUE(PRODUCT_IMAGE,'$.""0""') AS IMAGE FROM PRODUCT WHERE IS_AVAILABLE=1"
    Set Result = cmdPrep.execute
    responseJson = "{""list"" : [" 
    Set listProducts = Server.CreateObject("Scripting.Dictionary")
    seq = 0
    do while not Result.EOF
        seq = seq + 1   
        set product = New productsInList
        product.Id = Result("ID")
        product.Name = Result("NAME")
        product.Price = Result("PRICE")
        product.Img = Result("IMAGE")
        listProducts.add seq,product
        Result.MoveNext
    loop

    for each item in listProducts 
        responseJson = responseJson & "{ ""id"" : " & listProducts(item).Id & ", ""name"" : """ & trim(listProducts(item).Name) & """, ""price"" : " & listProducts(item).Price & ", ""img"" : """ & trim(listProducts(item).Img) & """}"
        if (item < listProducts.count) then
            responseJson = responseJson & ","
        end if  
    Next
    responseJson = responseJson & "]}"
    Response.ContentType = "application/json"
    Response.Write responseJson
%>

