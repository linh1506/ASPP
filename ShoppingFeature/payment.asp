<!--#include file="../connect.asp"-->
<!--#include file="../models/product_cart.asp"-->
<!--#include file="../ShoppingFeature/filterAvailable.asp"-->
<%
Set listProductInCart = Server.CreateObject("Scripting.Dictionary")
dim cmdPrep, result,view1,view2
set cmdPrep = Server.CreateObject("ADODB.Command")
cmdPrep.ActiveConnection = connDB
cmdPrep.CommandType = 1

if (not isempty(Session("Mycart"))) then 
    dim cart
    view1 = "d-none"
    view2 = "d-block"
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
      Response.redirect("../ShoppingFeature/mycart.asp")
      view1 = "d-block"
      view2 = "d-none"
end if
'lay gia tri giam gia
dim discountValue,discountCode
discountCode = Session("PromotionCode")
cmdPrep.commandText = "SELECT * FROM PROMOTION WHERE COUPON_CODE ='" &discountCode&"' and IS_ACTIVE = 1" 
set result = cmdPrep.execute
if not result.EOF then
  discountValue = result("DISCOUNT_VALUE")
else
  discountValue = 0
end if

'lay thong tin delivery
dim fullname
dim phone
dim address
if(not isnull(Session("Id")) and Session("Id") <> "") then
    dim id
    id = Session("Id")
    cmdPrep.commandText = "select * from USERS WHERE id = ?"
    cmdPrep.Parameters(0)=id
    set result = cmdPrep.execute
    if not result.EOF then
        fullname = result("NAME")
        phone = result("PHONE")
        address = result("ADDRESS")
    end if
    result.close()
end if
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link
      rel="stylesheet"
      href="../bootstrap-5.2.0-dist/css/bootstrap.min.css"
    />
    <link rel="stylesheet" href="myCart.css">
    <link rel="stylesheet" href='../UIcomponents/ShoppingHeader.css'>
    <link rel="stylesheet" href='../UIcomponents/notification.css'>
    <link rel="stylesheet" href="../Resources/web-font-files/lineicons.css">
    <script src="../Jquery/jquery-3.6.1.min.js"></script>
    <style>
        .col-8 {
          width: 100%;
          max-width: 800px;
          margin: 0 auto;
          padding: 20px;
          background-color: #fff;
          box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
          border-radius: 10px;
        }

        h1 {
          font-size: 24px;
        font-weight: bold;
        margin-bottom: 20px;
        text-align: center;
        }

      table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        }

      td {
        padding: 10px 15px;
        border: 1px solid #ccc;
        }

      label {
        font-weight: bold;
        }

      input[type="text"] {
        width: 100%;
        padding: 10px;
        border-radius: 5px;
        border: 1px solid #ccc;
        font-size: 16px;
        }

    </style>
    </head>
  <body>
    <!--#include file="./notifyDeleteItemsNotAvailable.asp"-->
    <!--#include file="../UIcomponents/ShoppingHeader.asp"-->
    <!--#include file="../UIcomponents/notification.asp"-->
    <nav style="z-index:1" class = 'navbar sticky-top navbar-light navbar-custom flex-row'>
    <div class="d-flex flex-row container-custom">
        <a class ="nav-link active" id="gohome" href="#"  onclick="history.go(-1); return false;"><i style="font-size:20px" class="lni lni-arrow-left"></i></a>
        <div class="page-address">
            <a href="#" class = "nav-link address" onclick="history.go(-1); return false;">Quay lại</a>
        </div>
    </div>
    </nav>
    <div class="container">
      <div class="row">

        <!-- Cột thông tin nhận hàng -->
        <div class="col-8">
            <h1>Delivery Information</h1>
            <table>
                <tr>
                    <td><label for="name">FullName:</label></td>
                    <td><input type="text" id="name" requied value="<%=trim(fullname)%>"></td>
                </tr>
                <tr>
                    <td><label for="address">Address:</label></td>
                    <td><input type="text" id="address" requied value="<%=trim(address)%>"></td>
                </tr>
                <tr>
                    <td><label for="phone">Phone:</label></td>
                    <td><input type="text" id="phone" requied value="<%=trim(phone)%>"></td>
                </tr>
            </table>
        </div>

        <!-- Cột đặt mua-->
        <div class="col-4">
            <div class="mb-5">
                <div class="form-outline">
                    <label class="form-label" for="form3Examplea2">Your Code :</label>
                    <input type="text" disabled id="form3Examplea2" value="<%=discountCode%>" class="form-control form-control-lg" />
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
                <button type="button" onclick="payment()" class="btn btn-purchase btn-lg"
                    data-mdb-ripple-color="dark">Purchase</button>
            </div>
        </div>

      </div>

      <div class="row mt-3">
        <div class="col-12">
          <h5 class="mt-3 text-center text-body-secondary <%= view1 %>">Bạn không có sản phẩm nào trong giỏ hàng.</h5> 
        </div>
        <!-- Cột danh sách sản phẩm trong giỏ hàng -->
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
                    <input type="number" disabled value="<%=listProductInCart(item).quantity%>" id="Quantity<%=item%>" onChange="AdjustQuantity(<%=item%>,<%=listProductInCart(item).id%>,<%=listProductInCart(item).size%>)" min="1" max="<%=listProductInCart(item).LimitQuantity%>">
                  </div>
                  <div class="d-flex justify-content-center">
                    <i style="color:var(--red)"><%=listProductInCart(item).LimitQuantity%> product<% if (listProductInCart(item).LimitQuantity > 1) then Response.Write("s") %> left</i>
                  </div>
                </div>
              </div>
              <hr class="my-4">
            </div>
          <% next %>
        </div>
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
        GetDiscountPrice()
        GetLastPrice()
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

      function GetDiscountPrice() {
        var count = <%=listProductInCart.Count%>
        var subTotal = 0
        for (var item = 1; item <= count; item++) {
          if (document.getElementById("InCartItem"+item) === null){
            continue
          } else {
            subTotal += (parseInt(document.getElementById("PriceItem"+item).innerHTML) * parseInt(document.getElementById("Quantity"+item).value))
          }
        }
        var discouptPrice = Math.ceil(subTotal * <%=discountValue%>)
        document.getElementById("Discount").innerHTML = "- " + discouptPrice + "đ"
      }

      function GetLastPrice() {
        var count = <%=listProductInCart.Count%>
        var subTotal = 0
        for (var item = 1; item <= count; item++) {
          if (document.getElementById("InCartItem"+item) === null){
            continue
          } else {
            subTotal += (parseInt(document.getElementById("PriceItem"+item).innerHTML) * parseInt(document.getElementById("Quantity"+item).value))
          }
        }
        var lastPrice = Math.floor(subTotal * (1 - <%=discountValue%>))
        document.getElementById("LastTotal").innerHTML = lastPrice + "đ"
      }
      
      GetSubTotal()
      GetDiscountPrice()
      GetLastPrice()

    </script>
    
    <!--#include file="../UIcomponents/footer.asp"-->

    <script>
      var localhostAddress = window.location.origin
      function payment() {
        var name = $("#name").val().trim();
        var phone = $("#phone").val().trim();    
        var address = $("#address").val().trim();

        var dataPurchase = {
          name: name,
          phone: phone,
          address: address,
          discountCode: "<%=discountCode%>",
          id: <% if (IsNull(Session("ID")) or Session("Id") = "") then %> <%=0%> <%else%> <%=Session("ID")%> <%end if%>
        }

        console.log(dataPurchase)

        $.ajax({
          type: "POST",
          url: localhostAddress + "/ShoppingFeature/postPurchase.asp",
          data: dataPurchase,
          timeout: 600000,
          success: function (data) {
            console.log(data),
            alert("Purchase was successfully")
            window.location.href = localhostAddress;
          },
          error: function (e) {
            
          }
        });
      }
    </script>
  </body>
</html>