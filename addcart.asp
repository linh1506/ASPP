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

if(idProduct > 0 and size > 0) then
    dim cmdPrep , result
    set cmdPrep = Server.CreateObject("ADODB.Command")
    cmdPrep.ActiveConnection = connDB
    cmdPrep.CommandType = 1
    cmdPrep.commandText = "select * from product,product_size where product.id = product_size.product_id and product.id = ? and size.size = ? "
    cmdPrep.Parameters(0) = idProduct
    cmdPrep.Parameters(1) = size
    set result = cmdPrep.execute
    
    if not result.EOF then
        dim currentCarts,mycarts
        'neu gio hang da ton tai
        if (not isempty(Session("mycarts"))) then
            'gan bien de su dung gio hang
            set currentCarts = Session("mycarts")
            'kiem tra xem gio hang da co san pham do hay chua
            'neu co roi
            if(currentCarts.exists(idproduct) = true) then
                dim value
                value = currentCarts.item(idproduct)
                'tang so luong cua san pham do len vs so luong duoc truyen vao
                value.Soluong = value.Soluong + soluong
                currentCarts.item(idproduct) = value
            else
            'neu chua co
            'them san pham do vao voi key = idproduct, value = cartItem
                currentCarts.ADD idproduct,cartItem
            end if
            'gan lai gio hang cho session
            set Session("mycarts") = currentCarts
        else
        'neu gio hang chua ton tai
        'tao mot gio hang
            set mycarts = Server.CreateObject("Scripting.Dictionary")
            'them san pham do vao
            mycarts.add idproduct, cartItem
            'gan gio hang cho session
            set Session("mycarts") = mycarts
            'reset bien gio hang
            set mycarts = nothing
        end if
        Session("Success") = "The product has been added to your cart"
    else
        Session("Error") = "The product is not exists, please try again"
    end if
    result.Close()
    connDB.Close()
    response.redirect("home.asp")
else
    Session("Error") = "so luong va ma sp phai > 0"
    response.redirect("home.asp")
end if


%>