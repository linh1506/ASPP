<!--#include file="connect.asp"-->
<!--#include file="models/product_cart.asp"-->
<%
On Error Resume Next

dim idProduct
idProduct = CInt(Request.QueryString("idproduct"))
dim size 
size = CInt(Request.QueryString("size"))
dim soluong
soluong = CInt(Request.QueryString("soluong"))

dim cartItem
set cartItem = new product_cart
    cartItem.Id = idproduct
    cartItem.Size = size
    cartItem.Soluong = soluong

if(Err.Number <> 0) then
    Session("Error") = "du lieu khong hop le"
    response.redirect("home.asp")
end if

if (idProduct > 0 and size > 0) then
    dim cmdPrep , result
    set cmdPrep = Server.CreateObject("ADODB.Command")
    cmdPrep.ActiveConnection = connDB
    cmdPrep.CommandType = 1
    cmdPrep.commandText = "select count(id) as count from PRODUCT, PRODUCT_SIZE where id = " & idProduct & " AND PRODUCT.ID = PRODUCT_SIZE.PRODUCT_ID AND PRODUCT_SIZE.SIZE= " & size
    set result = cmdPrep.execute
    if (result("count")=1) then
        cmdPrep.commandText = "select quantity from PRODUCT, PRODUCT_SIZE WHERE PRODUCT.ID = PRODUCT_SIZE.PRODUCT_ID AND PRODUCT_SIZE.SIZE= " & size & " AND PRODUCT.ID = " & idProduct
        set result = cmdPrep.execute
        if  (soluong <= result("quantity")) then
            dim currentCart,mycart
            'neu gio hang da ton tai

            if (not isempty(Session("Mycart"))) then
                'gan bien de su dung gio hang
                set currentCart = Session("Mycart")
                'kiem tra xem gio hang da co san pham do hay chua
                'neu co roi
                if(currentCart.exists(idproduct) = true) then
                    dim value
                    value = currentCart.item(idproduct)
                    if ((value.exists(size)) = true) then
                        'trong gio da ton tai size cua san pham do chua
                        dim quantity
                        quantity = value.item(size)
                        quantity = quantity + soluong
                        value.item(size) = quantity
                    else 
                        value.add size, soluong
                    end if
                    currentCart.item(idProduct) = value    
                else
                'neu chua co
                'them san pham do vao voi key = idproduct, value = cartItem
                    dim newitem
                    newitem = Server.CreateObject("Scripting.Dictionary")
                    newitem.ADD size,soluong
                    currentCart.ADD idproduct,newitem
                end if
                'gan lai gio hang cho session
                set Session("Mycart") = currentCart
            else
                'NEU CHUA CO, TAO MOI MYCARTS VA LUU VAO SESSION
                set mycart = Server.CreateObject("Scripting.Dictionary")
                dim item
                set item = Server.CreateObject("Scripting.Dictionary")
                item.add size,soluong
                mycart.add idproduct,item
                'gan gio hang cho session
                set Session("Mycart") = mycart
                set mycart = nothing
            end if
            Session("Success") = "The product has been added to your cart"
        else
            Session("Error") = "The quantity of this product is less than your request"
        end if
    else
        Session("Error") = "The product is not exists, please try again"
    end if
else
    Session("Error") = "so luong va ma sp phai > 0"
    response.redirect("home.asp")
end if
result.Close()
connDB.Close()
response.redirect("home.asp")
%>