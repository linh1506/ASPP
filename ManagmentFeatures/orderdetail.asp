<!--#include file="../connect.asp"-->
<!--#include file="../models/order_items.asp" -->
<%
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
        cmdPrep.commandText = "select * from ORDER_ITEMS where ORDER_ID = ?"
        cmdPrep.Parameters(0)=id
        set Result = cmdPrep.execute
        seq = 0
        do while not Result.EOF
        seq = seq + 1
        set orderitem = New order_items
        orderitem.Id = Result("ID")
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
    <title>Chi tiết hoá đơn</title>
</head>
<body>
    <nav style="z-index:1" class = 'navbar sticky-top navbar-light navbar-custom flex-row'>
      <div class="d-flex flex-row container-custom">
          <a class ="nav-link active" href="#"  onclick="history.go(-1); return false;"><i style="font-size:20px" class="lni lni-arrow-left"></i></a>
          <div class="page-address">
              <a href="#" class = "nav-link address">Quay lại</a>
          </div>
      </div>
    </nav>
    <div style="padding: 0 10% 0 10%" class="container">
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
                    <div style="border-bottom:0.5px gray solid">
                        <div><h3># <%=Result("ID")%></h3></div>
                        <div><h6>Create at <%=FormatDateTime(Result("CREATED_AT"),2)%></h6></div>
                        <div class="row justify-content-start">
                            <div class="col-6">
                            <h5>Customer name : <%=Result("RECEIVER_NAME")%></h5>
                            </div>
                            <div class="col-6">
                            <h5>Contact number : <%=Result("RECEIVER_PHONE")%></h5>
                            </div>
                        </div>
                        <div><h4>Delivered to : <%=Result("RECEIVER_ADDRESS")%></h4></div>
                    </div>
                    <br>
                    <% for each item in listOrderItems %>
                        <div class="row mb-4 d-flex justify-content-between align-items-center">
                            <div class="col-3">
                                <h6 class="text-black mb-0"><%=listOrderItems(item).ProductID%></h6>
                            </div>
                            <div class="col">
                                <h6 class="text-black mb-0">Size: <%=listOrderItems(item).Size%></h6>
                            </div>
                            <div class="col">
                                <h6 class="mb-0"><%=listOrderItems(item).Quantity%></h6>
                            </div>
                            <div class="col">
                                <h6 class="text-black mb-0">X</h6>
                            </div>
                            <div class="col-2">
                                <h6 class="text-black mb-0"><%=listOrderItems(item).UnitPrice%> VNĐ</h6>
                            </div>
                            <div class="col-2">
                                <h6 class="text-black mb-0">= <%=listOrderItems(item).TotalPrice%> VNĐ</h6>
                            </div>
                        </div>

                    <% next %>
                </div>
                <div class="col-4">
                    <div class="d-flex justify-content-between mb-5">
                        <h5 class="text-uppercase">Discount:</h5>
                        <div style="justify-content:center color:red">
                            <p> - <%=Result("PROMOTION_VALUE")%></p>
                        </div>
                    </div>
                    <div class="d-flex justify-content-between mb-5">
                        <h5 class="text-uppercase">Total price:</h5>
                        <div style="justify-content:center">
                            <p><%=Result("AMOUNT")%></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>