<!--#include file="../connect.asp"-->
<%
On Error Resume Next
'GET ID
dim idProduct
idProduct = CInt(Request.QueryString("idproduct"))

'GET SIZE
dim size 
size = CInt(Request.QueryString("size"))

'GET QUANTITY
dim quantityRequire
quantityRequire = CInt(Request.QueryString("quantity"))

if (quantityRequire <= 0) then
    Response.Write("Bad quantity requirement")
else
    if (idProduct > 0  and size > 0) then 
        dim cmdPrep, result
        set cmdPrep = Server.CreateObject("ADODB.Command")
        cmdPrep.ActiveConnection = connDB
        cmdPrep.CommandType = 1

        'validate id product and size of this product is exist in DATABASE
        cmdPrep.commandText = "select count(id) as count from PRODUCT, PRODUCT_SIZE where PRODUCT.IS_AVAILABLE = 1 and id=" & idProduct & " AND PRODUCT.ID = PRODUCT_SIZE.PRODUCT_ID AND PRODUCT_SIZE.SIZE=" & size
        
        set result = cmdPrep.execute

        'if specific item is existed in DATABASE
        if (result("count")=1) then

            'check quantity of specific item is more than requirement in DATABASE
            cmdPrep.commandText = "select quantity from PRODUCT, PRODUCT_SIZE WHERE PRODUCT.IS_AVAILABLE = 1 and PRODUCT.ID = PRODUCT_SIZE.PRODUCT_ID AND PRODUCT_SIZE.SIZE= " & size & " AND PRODUCT.ID = " & idProduct
            
            set result = cmdPrep.execute

            'check quantity is more than requirement in DATABASE
            if  (quantityRequire <= result("quantity")) then
            'true

                'if Session Mycart is existed
                if (not isempty(Session("Mycart"))) then
                'true
                    dim currentCart
                    currentCart = Session("Mycart")

                    For i = 0 To Ubound(currentCart)-1
                    ' Lấy thông tin sản phẩm và size từ phần tử hiện tại
                        dim currentProductId, currentSize
                        currentProductId = currentCart(i)(0)
                        currentSize = currentCart(i)(1)
                        If ((currentProductId = idProduct) And (currentSize = size)) Then
                            currentCart(i)(2) = currentCart(i)(2) + quantityRequire
                            if  (currentCart(i)(2) >= result("quantity")) then
                                Call Err.Raise(1, "addCart", "Quantity of this product is less than your requirement")
                                currentCart(i)(2) = result("quantity")
                            end if
                            Response.Write(currentCart(i)(2))
                            Exit For
                        End If
                    Next

                    dim productExistedId
                    productExistedId = false
                    for i = 0 to UBound(currentCart)-1
                        if (currentCart(i)(0) = idProduct) then
                            productExistedId = true
                            exit for
                        end if
                    next

                    if (productExistedId = false) then
                        currentCart(UBound(currentCart)) = Array(idProduct, size, quantityRequire)
                        ReDim Preserve currentCart(UBound(currentCart) + 1)
                    end if

                    dim productExistedIdAndSize
                    productExistedIdAndSize = false
                    for i = 0 to UBound(currentCart)-1
                        if (currentCart(i)(0) = idProduct) then
                            if (currentCart(i)(1) = size) then
                                productExistedIdAndSize = True
                                exit for
                            end if
                        end if
                    next

                    if (productExistedIdAndSize = false) then 
                        currentCart(UBound(currentCart)) = Array(idProduct, size, quantityRequire)
                        ReDim Preserve currentCart(UBound(currentCart) + 1)
                    end if

                    ' Sort the currentCart array by column 1 (id sản phẩm) in ascending order
                    ' If two elements have the same id sản phẩm, sort them by column 2 (size) in ascending order
                    For i = 0 To UBound(currentCart) - 2
                        For j = i + 1 To UBound(currentCart) - 1
                            If currentCart(i)(0) > currentCart(j)(0) Then
                                temp = currentCart(i)
                                currentCart(i) = currentCart(j)
                                currentCart(j) = temp
                            ElseIf currentCart(i)(0) = currentCart(j)(0) And currentCart(i)(1) > currentCart(j)(1) Then
                                temp = currentCart(i)
                                currentCart(i) = currentCart(j)
                                currentCart(j) = temp
                            End If
                        Next
                    Next

                    Session("Mycart") = currentCart

                else
                'false

                    dim myCart()
                    redim myCart(0)
                    myCart(Ubound(myCart)) = Array(idProduct, size, quantityRequire)
                    ReDim Preserve myCart(Ubound(myCart) + 1)
                    Session("Mycart") = myCart

                end if
                if Err.Number > 0 then
                    Response.Write(Err.Description)
                else
                    response.write("add successfully")
                end if
            else
            'false
                
                'quantity left is less than requirement
                response.write("quantity left is less than requirement")

            end if

        else
        'false

            'The product is not exists
            response.write("The product is not exists, please try again")

        end if
    else
        'false
        response.write("bad idProduct and size")
    end if
end if

result.Close()
connDB.Close()
%>