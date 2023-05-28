<!--#include file="../connect.asp"-->
<!--#include file="../models/productsInList.asp"-->

<%    
    dim cmdPrep
    Set cmdPrep = Server.CreateObject("ADODB.Command")
    cmdPrep.ActiveConnection = connDB
    cmdPrep.CommandType = 1
    cmdPrep.Prepared = True

    dim brandId
    brandId = CInt(Request.QueryString("brandid"))
    if (brandId <> 0) then
        
        cmdPrep.CommandText = "SELECT COUNT(*) AS count FROM BRAND WHERE ID = " & brandId   
        Set Result = cmdPrep.execute
        if (Result("count") = 0) then
            brandId = 0
        end if

    end if

    dim categoryId
    categoryId = CInt(Request.QueryString("categoryid"))
    if (categoryId <> 0) then

        cmdPrep.CommandText = "SELECT COUNT(*) AS count FROM CATEGORY WHERE ID = " & categoryId
        Set Result = cmdPrep.execute
        if (Result("count") = 0) then
            categoryId = 0
        end if

    end if

    if (brandId = 0) and (categoryId = 0) then

        cmdPrep.CommandText = "SELECT ID, NAME, PRICE, JSON_VALUE(PRODUCT_IMAGE,'$.""0""') AS IMAGE FROM PRODUCT WHERE IS_AVAILABLE=1"
    
    Elseif (brandId <> 0) and (categoryId = 0) then

        cmdPrep.CommandText = "SELECT ID, NAME, PRICE, JSON_VALUE(PRODUCT_IMAGE,'$.""0""') AS IMAGE FROM PRODUCT WHERE IS_AVAILABLE=1 AND BRAND_ID = " & brandId
        
    elseif (brandId = 0) and (categoryId <> 0) then

        cmdPrep.CommandText = "SELECT ID, NAME, PRICE, JSON_VALUE(PRODUCT_IMAGE,'$.""0""') AS IMAGE FROM PRODUCT WHERE IS_AVAILABLE=1 AND CATEGORY_ID = " & categoryId

    else 

        cmdPrep.CommandText = "SELECT ID, NAME, PRICE, JSON_VALUE(PRODUCT_IMAGE,'$.""0""') AS IMAGE FROM PRODUCT WHERE IS_AVAILABLE=1 AND CATEGORY_ID = " & categoryId & " AND BRAND_ID = " & brandId

    end if
    
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

