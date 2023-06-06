<!--#include file="../connect.asp"-->
<!--#include file="../models/productsInList.asp"-->

<%  
    dim cmdPrep
    Set cmdPrep = Server.CreateObject("ADODB.Command")
    cmdPrep.ActiveConnection = connDB
    cmdPrep.CommandType = 1
    cmdPrep.Prepared = True

    dim brandId
    brandId = CInt(Request.QueryString("brandId"))
    if (brandId <> 0) then
        
        cmdPrep.CommandText = "SELECT COUNT(*) AS count FROM BRAND WHERE ID = " & brandId   
        Set Result = cmdPrep.execute
        if (Result("count") = 0) then
            brandId = 0
        end if

    end if

    page = Request.QueryString("currentPage")

    if (trim(page) = "") or (isnull(page)) then
        page = 1
    end if

    function Ceil(Number)
        Ceil = Int(Number)
        if Ceil<>Number Then
            Ceil = Ceil + 1
        end if
    end function

    limit=12

    strSQL = "SELECT COUNT(ID) AS count FROM PRODUCT"
    cmdPrep.CommandText = strSQL
    Set CountResult = cmdPrep.execute
    totalRowsProducts = CLng(CountResult("count"))
    Set CountResult = Nothing
    pagesProducts = Ceil(totalRowsProducts/limit)

    offset = (Clng(page) * Clng(limit)) - Clng(limit)


    dim categoryId
    categoryId = CInt(Request.QueryString("categoryId"))
    if (categoryId <> 0) then

        cmdPrep.CommandText = "SELECT COUNT(*) AS count FROM CATEGORY WHERE ID = " & categoryId
        Set Result = cmdPrep.execute
        if (Result("count") = 0) then
            categoryId = 0
        end if

    end if

    if (brandId = 0) and (categoryId = 0) then
        cmdPrep.CommandText = "SELECT count(JSON_VALUE(PRODUCT_IMAGE,'$.""0""')) as list FROM PRODUCT WHERE IS_AVAILABLE=1 "
        set Result = cmdPrep.execute
        listcount = Result("list")
        Result.Close
        set Result = nothing
        totalPage = Ceil(listcount/limit)
        cmdPrep.CommandText = "SELECT ID, NAME, PRICE, JSON_VALUE(PRODUCT_IMAGE,'$.""0""') AS IMAGE FROM PRODUCT WHERE IS_AVAILABLE=1 order by ID OFFSET "& CLng(offset) &" ROW FETCH NEXT "& CLng(limit) &" ROWS ONLY"
    
    Elseif (brandId <> 0) and (categoryId = 0) then
        cmdPrep.CommandText = "SELECT count(JSON_VALUE(PRODUCT_IMAGE,'$.""0""')) as list FROM PRODUCT WHERE IS_AVAILABLE=1 AND BRAND_ID = " & brandId &" "
        set Result = cmdPrep.execute
        listcount = Result("list")
        Result.Close
        set Result = nothing
        totalPage = Ceil(listcount/limit)
        cmdPrep.CommandText = "SELECT ID, NAME, PRICE, JSON_VALUE(PRODUCT_IMAGE,'$.""0""') AS IMAGE FROM PRODUCT WHERE IS_AVAILABLE=1 AND BRAND_ID = " & brandId & " order by ID OFFSET "& CLng(offset) &" ROW FETCH NEXT "& CLng(limit) &" ROWS ONLY "
        
    elseif (brandId = 0) and (categoryId <> 0) then
        cmdPrep.CommandText = "SELECT count(JSON_VALUE(PRODUCT_IMAGE,'$.""0""')) as list FROM PRODUCT WHERE IS_AVAILABLE=1 AND CATEGORY_ID = " & categoryId & " "
        set Result = cmdPrep.execute
        listcount = Result("list")
        Result.Close
        set Result = nothing
        totalPage = Ceil(listcount/limit)
        cmdPrep.CommandText = "SELECT ID, NAME, PRICE, JSON_VALUE(PRODUCT_IMAGE,'$.""0""') AS IMAGE FROM PRODUCT WHERE IS_AVAILABLE=1 AND CATEGORY_ID = " & categoryId & " order by ID OFFSET "& CLng(offset) &" ROW FETCH NEXT "& CLng(limit) &" ROWS ONLY "

    else 
        cmdPrep.CommandText = "SELECT count(JSON_VALUE(PRODUCT_IMAGE,'$.""0""')) as list FROM PRODUCT WHERE IS_AVAILABLE=1 AND CATEGORY_ID = " & categoryId & " AND BRAND_ID = " & brandId & ""
        set Result = cmdPrep.execute
        listcount = Result("list")
        Result.Close
        set Result = nothing
        totalPage = Ceil(listcount/limit)
        cmdPrep.CommandText = "SELECT ID, NAME, PRICE, JSON_VALUE(PRODUCT_IMAGE,'$.""0""') AS IMAGE FROM PRODUCT WHERE IS_AVAILABLE=1 AND CATEGORY_ID = " & categoryId & " AND BRAND_ID = " & brandId & " order by ID OFFSET "& CLng(offset) &" ROW FETCH NEXT "& CLng(limit) &" ROWS ONLY "

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

    responseJson = responseJson & "],""totalPage"":"&totalPage&"}"

    Response.ContentType = "application/json"
    Response.Write responseJson
%>

