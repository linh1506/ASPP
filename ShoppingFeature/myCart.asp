<!--#include file="../connect.asp"-->
<!--#include file="../models/product_cart.asp"-->
<!--#include file="../ShoppingFeature/filterAvailable.asp"-->
<%
Set listProductInCart = Server.CreateObject("Scripting.Dictionary")
dim view1,view2
dim cmdPrep, result
set cmdPrep = Server.CreateObject("ADODB.Command")
cmdPrep.ActiveConnection = connDB
cmdPrep.CommandType = 1
if (not isempty(Session("Mycart"))) then 
    view1 = "none-div"
    view2 = "display-div"
    dim cart
    Session("Mycart") = filterAvailable(Session("Mycart"))
    cart = Session("Mycart")
    dim seq
    seq = 0
    For i = 0 to UBound(cart)-1
      'Get id of each item
      dim idProduct
      idProduct = cart(i)(0)
      cmdPrep.commandText = "SELECT ID , NAME , IS_AVAILABLE, PRICE , JSON_VALUE(PRODUCT_IMAGE, '$.""0""') AS IMG FROM PRODUCT WHERE ID=" & idProduct
      set result = cmdPrep.execute
      set product = New product_cart
      product.Id = Result("ID")
      product.Name = Result("NAME")
      product.Status = Result("IS_AVAILABLE")
      product.Image = Result("IMG")
      product.Price = Result("PRICE")
      product.Size = cart(i)(1)
      cmdPrep.commandText = "SELECT QUANTITY FROM PRODUCT_SIZE WHERE SIZE="&  cart(i)(1)  &" AND PRODUCT_ID=" & idProduct
      set result = cmdPrep.execute
      product.LimitQuantity = result("QUANTITY")
      product.Quantity = cart(i)(2)

      seq = seq + 1
      listProductInCart.add seq,product
    Next
    Else
      view1 = "display-div"
      view2 = "none-div"
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
    <link rel="stylesheet" href="myCart.css">
    <link rel="stylesheet" href='../UIcomponents/ShoppingHeader.css'>
    <link rel="stylesheet" href='../UIcomponents/notification.css'>
    <link rel="stylesheet" href="../Resources/web-font-files/lineicons.css">
    <title>Giỏ hàng</title>
    <script src="../Jquery/jquery-3.6.1.min.js"></script>
    </head>
  <body>
    <!--#include file="./notifyDeleteItemsNotAvailable.asp"-->
    
    <!--#include file="../UIcomponents/ShoppingHeader.asp"-->
    <!--#include file="../UIcomponents/notification.asp"-->
    
    <nav style="z-index:1" class = 'navbar sticky-top navbar-light navbar-custom flex-row'>
      <div class="d-flex flex-row container-custom">
          <a class ="nav-link active" href="#"  onclick="history.go(-1); return false;"><i style="font-size:20px" class="lni lni-arrow-left"></i></a>
          <div class="page-address">
              <a href="#" class = "nav-link address">Quay lại</a>
          </div>
      </div>
    </nav>

    <div class="container">
     
      <div class="row">
        <!-- Cột danh sách sản phẩm trong giỏ hàng -->
        <% if (not listProductInCart.Count = 0) then %>
          <div class="col-8">
            <% for each item in listProductInCart %>
              <div id="InCartItem<%=item%>" class="CartItem">
                <div class="row mb-4 d-flex justify-content-between align-items-center">
                  <div class="col">
                    <img src="<%=listProductInCart(item).Image%>" class="img-fluid rounded-3" alt="Fumo">
                  </div>
                  <div class="col ft">
                    <h6 class="text-muted"><%=listProductInCart(item).name%></h6>
                    <h6 class="text-black mb-0">Size: <%=listProductInCart(item).size%></h6>
                  </div>
                  <div class="col-3">
                    <p><span id="PriceItem<%=item%>"><%=listProductInCart(item).price%> VNĐ</span></p>
                  </div>
                  <div class="col-2 justify-content-center">
                    <div class="d-flex justify-content-center">
                      <input type="number" value="<%=listProductInCart(item).quantity%>" id="Quantity<%=item%>" onChange="AdjustQuantity(<%=item%>,<%=listProductInCart(item).id%>,<%=listProductInCart(item).size%>)" min="1" max="<%=listProductInCart(item).LimitQuantity%>">
                    </div>
                    <div class="d-flex justify-content-center">
                      <i style="color:var(--red)"><%=listProductInCart(item).LimitQuantity%> product<% if (listProductInCart(item).LimitQuantity > 1) then Response.Write("s") %> left</i>
                    </div>
                  </div>
                  <div class="d-flex justify-content-center col btn-delete">
                    <i class="lni lni-close" onClick="DeleteProductInCart(<%=item%>,<%=listProductInCart(item).id%>,<%=listProductInCart(item).size%>)"></i>
                  </div>
                </div>
                <hr class="my-4">
              </div>
            <% next %>
          </div>
          <div class="col-4 mt-5" id="SubTotalElement">
            <div class="row">
              <div class="col">
                <h2>Promo Code:</h2>
              </div>
              <div class="col">
                <select class="form-select form-select-lg mb-3" id="promoValue" name="promoValue" onChange="payment()">
                  <% 
                    cmdPrep.commandText = "SELECT * FROM PROMOTION WHERE IS_ACTIVE = 1 order by DISCOUNT_VALUE DESC"
                    set result = cmdPrep.execute
                    do while not result.EOF
                  %>
                  <option value="<%=result("DISCOUNT_VALUE")%>"><%=result("COUPON_CODE")%></option>
                  <% 
                    result.movenext
                    loop
                    result.close
                  %>
                </select>
              </div>
            </div>
            <hr class="my-4">
            <!-- Tính giá tiền của tất cả sản phẩm trong giỏ hàng -->
            <div class="d-flex justify-content-between mb-5">
                <h5 class="text-uppercase">Total price:</h5>
                <div id="SubTotalElement" style="justify-content:center">
                    <p id="SubTotal"></p>
                </div>
            </div>
            <div class="d-flex justify-content-between mb-5">
                <h5 class="text-uppercase">Discount price:</h5>
                <div id="DiscountElement" style="justify-content:center">
                    <p id="Discount"></p>
                </div>
            </div>
            <div class="d-flex justify-content-between mb-5">
                <h5 class="text-uppercase">Last total price:</h5>
                <div id="LastTotalElement" style="justify-content:center">
                    <p id="LastTotal"></p>
                </div>
            </div>
            <div class="row">
              <button type="button" onClick="sendPromoCode()" class="btn btn-outline-dark btn-lg" data-mdb-ripple-color="dark">Purchase</button>
            </div>
          </div>
        <% end if %>
      </div>

      <div id="NothingInCart" class='mt-3 text-center text-body-secondary'>
        <p style="text-align:center">Nothing in your cart</p>
      </div>

    </div>
    
    <script>
      var localhostAddress = window.location.origin

      $("#NothingInCart").hide();

      function checkNullInCart() {
        if ($(".CartItem").length === 0) {
          $("#SubTotalElement").hide();
          $("#NothingInCart").show();
          $("#view-1").show();
          $("#view-2").hide();
        }
      }

      checkNullInCart()


      function DeleteProductInCart(ItemId,ProductId,Size) {
        console.log("Deleted")
        var element = document.getElementById("InCartItem"+ItemId);
        element.remove();
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
              notification(''+this.responseText,"var(--bs-orange)")
            }
        };
        var dem = $(".v").length;
        if($(".v").length === 0)
        {
        }
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
        payment()
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
        document.getElementById("SubTotal").innerHTML = subTotal + "đ"
      }

      function payment() {
          var promoValue = document.querySelector('select[name="promoValue"]').value;
          var subtotal = parseFloat(document.getElementById("SubTotal").innerText.replace("đ", ""));
          var discount = promoValue * subtotal;
          var total = subtotal - discount;
          document.getElementById("Discount").innerText = "- " +  discount+"đ";
          document.getElementById("LastTotal").innerText = total+"đ";
      }
      
      GetSubTotal()
      payment()

      function sendPromoCode() {
        var promoSelect = document.getElementById("promoValue");
        var promoText = promoSelect.options[promoSelect.selectedIndex].innerText;

        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
          if (this.readyState == 4 && this.status == 200) {
            window.location.href = "/ShoppingFeature/payment.asp";
          }
        };
        xhr.open("POST", "setPromoCodeToSession.asp?promoCode="+promoText, true);
        xhr.send();
      }
    </script>
    <!--#include file="../UIcomponents/footer.asp"-->
  </body>
</html>