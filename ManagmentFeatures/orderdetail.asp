<!--#include file="../connect.asp"-->
<!--#include file="../models/order_items.asp" -->
<%  
    If (isnull(Session("email")) OR TRIM(Session("email")) = "") Then
        response.redirect("../login.asp")
    else
    dim id
    id = Request.QueryString("id")
    If (isnull(id) OR trim(id) = "") then 
        id=0
    End if
    If (cint(id)<>0) Then
        Set listOrderItems = Server.CreateObject("Scripting.Dictionary")
        Set cmdPrep = Server.CreateObject("ADODB.Command")
        cmdPrep.ActiveConnection = connDB
        cmdPrep.CommandType = 1
        cmdPrep.Prepared = True
        cmdPrep.commandText = "select * from ORDER_ITEMS inner join PRODUCT on ORDER_ITEMS.PRODUCT_ID = PRODUCT.ID where ORDER_ID = ?"
        cmdPrep.Parameters(0)=id
        set Result = cmdPrep.execute
        seq = 0
        do while not Result.EOF
        seq = seq + 1
        set orderitem = New order_items
        orderitem.Id = Result("ID")
        orderitem.ProductName = Result("NAME")
        orderitem.ProductID = Result("PRODUCT_ID")
        orderitem.OrderID = Result("ORDER_ID")
        orderitem.CreateAt = Result("CREATED_AT")
        orderitem.TotalPrice = Result("TOTAL_PRICE")
        orderitem.Quantity = Result("QUANTITY")
        orderitem.Size = Result("SIZE")
        orderitem.UnitPrice = Result("UNIT_PRICE")
        listOrderItems.add seq,orderitem
        Result.MoveNext
        Loop
        Result.Close
        set Result = nothing
    End If
    end if
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../bootstrap-5.2.0-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="myCart.css">
    <link rel="stylesheet" href='../UIcomponents/ShoppingHeader.css'>
    <link rel="stylesheet" href='../UIcomponents/notification.css'>
    <link rel="stylesheet" href="../Resources/web-font-files/lineicons.css">
    <link rel="stylesheet" href="../ShoppingFeature/myCart.css">
    <link rel="stylesheet" href="../management.css">
    <link rel="stylesheet" href="../fonts.css">
    <link rel="stylesheet" href="../Resources/web-font-files/lineicons.css">
    <script src="../Jquery/jquery-3.6.1.min.js"></script>
    <title>Chi tiết hoá đơn</title>
    <style>
        *{
          font-family:quicksand;
        }
    </style>
</head>
<body>

    <nav style="z-index:1" class = 'navbar sticky-top navbar-light navbar-custom flex-row'>
      <div class="d-flex flex-row container-custom">
          <a class ="nav-link active" href="#"  onclick="history.go(-1); return false;"><i style="font-size:20px" class="lni lni-arrow-left"></i></a>
          <div class="page-address">
              <a href="#" class = "nav-link address">Go back</a>
          </div>
      </div>
    </nav>
    <div style="padding: 0% 10%" class="container">
        <div class="container-sm" >
            <div class="row">
                <div class="col-8">
                    <%
                        Set cmdPrep = Server.CreateObject("ADODB.Command")
                        cmdPrep.ActiveConnection = connDB
                        cmdPrep.CommandType = 1
                        cmdPrep.Prepared = True
                        cmdPrep.commandText = "select * from ORDERS where id=?"
                        cmdPrep.Parameters(0)=id
                        set Result = cmdPrep.execute
                    %>
                    <div>
                        <div class="row">
                            <div class="col-12 d-flex justify-content-center"><h2># <%=Result("ID")%></h2></div>    
                        </div>
                        <div><h6 class="text-primary">Created at <%=FormatDateTime(Result("CREATED_AT"),2)%></h6></div>
                            <div>
                            <h5>Customer name : <%=Result("RECEIVER_NAME")%></h5>
                            </div>
                            <div>
                            <h5>Contact number : <%=Result("RECEIVER_PHONE")%></h5>
                            </div>
                        <div><h5>Delivered to : <%=Result("RECEIVER_ADDRESS")%></h5></div>
                    </div>
                    <br>
                    <div>
                        <button class="btnAction" 
                            <% 
                                if (Result("STATUS") = 2 or Result("STATUS") = 3) then
                                %>disabled
                                <%
                                end if
                            %> 
                            id="ActionToggle<%=Result("ID")%>" onClick="ToggleOrderStatus(<%=Result("ID")%>)">
                            <i class="lni lni-spinner-arrow" style="margin:0;padding:0;font-size:2em"></i>
                        </button>
                        <button class="btnAction"
                                <% 
                                    if (Result("STATUS") = 2 or Result("STATUS") = 3) then
                                    %>disabled
                                    <%
                                    end if
                                    %> 
                                    id="ActionCancel<%=Result("ID")%>" onClick="CancelOrder(<%=Result("ID")%>)">
                                <i class="lni lni-cross-circle" style="margin:0;padding:0;font-size:2em"></i>
                        </button>
                    </div>
                    <br>
                </div>
                <div class="col-4">
                    <div class="col-6">
                                <% 
                                    if Result("STATUS") = 0 then
                                        %> <h4 id="OrderStatus<%=Result("ID")%>" class="confirm">Processing</h4> <%
                                    elseif Result("STATUS") = 1 then
                                        %> <h4 id="OrderStatus<%=Result("ID")%>" class="transit">Delivering</h4> <%
                                    elseif Result("STATUS") = 2 then
                                        %> <h4 id="OrderStatus<%=Result("ID")%>" class="delivered">Delivered</h4> <%
                                    elseif Result("STATUS") = 3 then
                                        %> <h4 id="OrderStatus<%=Result("ID")%>" class="cancel">Order cancelled</h4> <%
                                    end if
                                %>
                    </div>
                    <div class="d-flex justify-content-between mb-2">
                        <h5>Price:</h5>
                        <div id="SubTotalElement" style="justify-content:center">
                            <p class="current_format" id="SubTotal"><% Response.Write(Result("PROMOTION_VALUE") + Result("AMOUNT") )%></p>
                        </div>
                    </div>
                    <div class="d-flex justify-content-between mb-2">
                        <h5>Discount:</h5>
                        <div style="justify-content:center color:red">
                            <p class="current_format" id="Discount"><%=Result("PROMOTION_VALUE")%></p>
                        </div>
                    </div>
                    <hr class="my-4">
                    <div style="margin:0" class="d-flex justify-content-between mb-2">
                        <h5>Total price:</h5>
                        <div style="margin:0 ; justify-content:center">
                            <p class="current_format" id="Amount"><%=Result("AMOUNT")%></p>
                        </div>
                    </div>
                    <%  
                        Result.close
                        set Result = nothing
                    %>
                    
                </div>
            </div>
            <hr class="my-4">
            <% for each item in listOrderItems %>
                        <div class="row mb-4 d-flex justify-content-between align-items-center">
                            <div class="col">
                                <h6 class="mb-0">X<%=listOrderItems(item).Quantity%></h6>
                            </div>
                            <div class="col-2">
                                <a style="color:black ; text-decoration:none" href="../ShoppingFeature/productDetail.asp?id=<%=listOrderItems(item).ProductID%>">
                                    <h6 class="text-black mb-0"><%=listOrderItems(item).ProductName%></h6>
                                </a>
                            </div>
                            <div class="col">
                                <h6 class="text-black mb-0">Size: <%=listOrderItems(item).Size%></h6>
                            </div>
                            <div class="col-2">
                                <h6 class="text-black mb-0 current_format"><%=listOrderItems(item).UnitPrice%></h6>
                            </div>
                            <div class="col-2">
                                <h6 id="total" class="text-black mb-0 current_format"><%=listOrderItems(item).TotalPrice%></h6>
                            </div>
                        </div>
            <% next %>
        </div>
    </div>
    <script>
    var localhostAddress = window.location.origin
    $(document).ready(function() {
        $(".current_format").each(function() {
            var text = $(this).text();
            var formattedText = formatCurrencyVND(text);
            $(this).text(formattedText);
        });
        function formatCurrencyVND(amount) {
        return new Intl.NumberFormat('de-DE', { style: 'currency', currency: 'VND' }).format(amount)


        }
    });
    function ToggleOrderStatus(id) {
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    if (this.responseText == "1") {
                        document.getElementById("OrderStatus" + id).className = "transit";
                        console.log(document.getElementById("OrderStatus" + id));
                        document.getElementById("OrderStatus" + id).innerHTML = "Delivering";
                    } else if (this.responseText == "2" ){
                        document.getElementById("OrderStatus" + id).className = "delivered";
                        document.getElementById("OrderStatus" + id).innerHTML = "Delivered";
                        document.getElementById("ActionToggle" + id).disabled = true;
                        document.getElementById("ActionCancel" + id).disabled = true;
                    } else if (this.responseText == "3" ){
                        document.getElementById("OrderStatus" + id).className = "cancel";
                        document.getElementById("OrderStatus" + id).innerHTML = "Order Cancelled";
                        document.getElementById("ActionToggle" + id).disabled = true;
                        document.getElementById("ActionCancel" + id).disabled = true;
                    }
                }
            };
            xmlhttp.open("GET", localhostAddress + "/ManagmentFeatures/toggleOrderstatus.asp?id=" + id, true);
            xmlhttp.send();
        }
        function CancelOrder(id) {
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    if (this.responseText == "3" ){
                        document.getElementById("OrderStatus" + id).className = "cancel";
                        document.getElementById("OrderStatus" + id).innerHTML = "Order cancelled";
                        document.getElementById("ActionToggle" + id).disabled = true;
                        document.getElementById("ActionCancel" + id).disabled = true;
                    }
                }
            };
            xmlhttp.open("GET", localhostAddress + "/ManagmentFeatures/cancelOrder.asp?id=" + id, true);
            xmlhttp.send();
        }
    </script>
</body>
</html>