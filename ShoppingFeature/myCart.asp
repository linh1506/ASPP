<!--#include file="../connect.asp"-->
<!--#include file="../models/product_cart.asp"-->
<!--#include file="../ShoppingFeature/filterAvailable.asp"-->
<%
if (not isempty(Session("Mycart"))) then 
    dim cart
    Session("Mycart") = filterAvailable(Session("Mycart"))
    cart = Session("Mycart")
    dim seq
    seq = 0
    Set listProductInCart = Server.CreateObject("Scripting.Dictionary")
    For i = 0 to UBound(cart)-1
      'Get id of each item
      dim idProduct
      idProduct = cart(i)(0)

      dim cmdPrep, result
      set cmdPrep = Server.CreateObject("ADODB.Command")
      cmdPrep.ActiveConnection = connDB
      cmdPrep.CommandType = 1
        
      cmdPrep.commandText = "SELECT * FROM PRODUCT WHERE ID=" & idProduct
      set result = cmdPrep.execute
      set product = New product_cart
      product.Id = Result("ID")
      product.Name = Result("NAME")
      product.Status = Result("IS_AVAILABLE")
      product.Image = Result("PRODUCT_IMAGE")
      product.Price = Result("PRICE")
      product.Size = cart(i)(1)
      cmdPrep.commandText = "SELECT QUANTITY FROM PRODUCT_SIZE WHERE SIZE="&  cart(i)(1)  &" AND PRODUCT_ID=" & idProduct
      set result = cmdPrep.execute
      product.LimitQuantity = result("QUANTITY")
      product.Quantity = cart(i)(2)

      seq = seq + 1
      listProductInCart.add seq,product
    Next
end if
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta charset='utf-8' /> <meta HTTP-EQUIV="Pragma" CONTENT="no-cache"> <meta HTTP-EQUIV="Expires" CONTENT="-1"> <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <link
      rel="stylesheet"
      href="../bootstrap-5.2.0-dist/css/bootstrap.min.css"
    />
    <link rel="stylesheet" href='../UIcomponents/notification.css'>
    <script src="../Jquery/jquery-3.6.1.min.js"></script>
    </head>
  <body>
    <!--#include file="../UIcomponents/notification.asp"-->
    <!--#include file="./notifyDeleteItemsNotAvailable.asp"-->

    <div class="container">
      <% if (not IsEmpty(listProductInCart) or listProductInCart.Count = 0) then %>
        <% for each item in listProductInCart %>
          <div id="InCartItem<%=item%>" class="CartItem">
            <h2>Item <%=item%>: <% if listProductInCart(item).Status = false then %><span style="color:Red">NOT Openning for sale</span><% end if %></h2>
            <p>Name of Product: <%=listProductInCart(item).name%></p>
            <p>Size: <%=listProductInCart(item).size%></p>
            <p>Price: <span id="PriceItem<%=item%>"><%=listProductInCart(item).price%></span></p>
            <p>Quantity: 
              <input type="number" value="<%=listProductInCart(item).quantity%>" id="Quantity<%=item%>" onChange="AdjustQuantity(<%=item%>,<%=listProductInCart(item).id%>,<%=listProductInCart(item).size%>)" min="1" max="<%=listProductInCart(item).LimitQuantity%>">
              <i><%=listProductInCart(item).LimitQuantity%> product<% if (listProductInCart(item).LimitQuantity > 1) then Response.Write("s") %> left</i>
            </p>
            <button class="btn btn-danger" onClick="DeleteProductInCart(<%=item%>,<%=listProductInCart(item).id%>,<%=listProductInCart(item).size%>)">Delete</button>
          </div>
        <% next %>
      <%
        end if
      %>
      <div id="SubTotalElement">
        <p id="SubTotal"></p>
      </div>
      <div id="NothingInCart">
        <p>There is nothing in your cart</p>
      </div>
    </div>
    <script>
      var localhostAddress = window.location.origin
      $("#NothingInCart").hide();
      function checkNullInCart() {
        if ($(".CartItem").length === 0) {
          $("#SubTotalElement").hide();
          $("#NothingInCart").show();
        }
      }
      function DeleteProductInCart(ItemId,ProductId,Size) {
        var element = document.getElementById("InCartItem"+ItemId);
        element.remove();
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
              notification(this.responseText,"var(--bs-orange)")
            }
        };
        xmlhttp.open("GET", localhostAddress + "/ShoppingFeature/deleteItemInCart.asp?idProduct="+ProductId+"&size="+Size, true);
        xmlhttp.send();
        GetSubTotal()
        checkNullInCart()
      }

      function AdjustQuantity(ItemId,ProductId,Size) {
        var element = document.getElementById("Quantity"+ItemId);
        var Quantity = element.value
        var xmlhttp = new XMLHttpRequest();
        // console.log(localhostAddress + "/ShoppingFeature/adjustQuantity.asp?idProduct="+ProductId+"&size="+Size+"&quantity="+Quantity)
        xmlhttp.open("GET", localhostAddress + "/ShoppingFeature/adjustQuantity.asp?idProduct="+ProductId+"&size="+Size+"&quantity="+Quantity, true);
        xmlhttp.send();
        GetSubTotal()
        checkNullInCart()
      }
      function GetSubTotal() {
        var count = <%=listProductInCart.Count%>
        var subTotal = 0
        for (var item = 1; item <= count; item++) {
          if (document.getElementById("InCartItem"+item) === null){
            continue
          } else {
            subTotal += (parseInt(document.getElementById("PriceItem"+item).innerHTML) * parseInt(document.getElementById("Quantity"+item).value))
          }
        }
        document.getElementById("SubTotal").innerHTML = "<b>Sub Total: </b>" + subTotal + "đ"
      }
      
      GetSubTotal()
      checkNullInCart()
    </script> 
  </body>
</html>