<!--#include virtual="/connect.asp"-->
<!--#include virtual="/ShoppingFeature/getOrderList.asp"-->
<%
    Dim nogo 
    nogo= true
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="/bootstrap-5.2.0-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/Resources/web-font-files/lineicons.css">
    <link rel="stylesheet" href="/css/getOrderList.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"><link rel="stylesheet" href="/ShoppingFeature/TrackOrder.css">
    <title>Order Tracking</title>
</head>
<body>
    <h1 class="store-title"  onclick="location.href = '/'">ODGB</h1>
    <div class="tracker">
        <div class="tracker-search">
            <h3>Order Tracker ! Please fill out all field</h3>
            <form method="post">
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Phone Number</label>
                    <input type="number" class="form-control" name="phone" id="phoneInput" aria-describedby="phone">
                </div>
                <div class="mb-3">
                    <label for="orderNumber" class="form-label">Order Number</label>
                    <input type="number" class="form-control" name="orderNumber" id="orderNumber">
                </div>
                <button type="submit" class="btn btn-dark">Track It Now!!!</button>
                <button type="reset" class="btn btn-dark" onclick="location.href = '/ShoppingFeature/TrackOrder.asp'">Reset</button>
            </form>
        </div>
        <div class="order_wrapper">

                <%  Dim phone, order 'Lay du lieu tu form
                    If (Request.ServerVariables("REQUEST_METHOD") = "POST") THEN
                        phone = Request.Form("phone")
                        order = Request.Form("orderNumber")
                        Dim cmdPrep
                        set cmdPrep = Server.CreateObject("ADODB.Command")
                        cmdPrep.ActiveConnection = connDB
                        cmdPrep.CommandType=1
                        cmdPrep.Prepared=true
                        cmdPrep.CommandText =  "select * from ORDERS where CREATED_BY = 1 and STATUS not in(2,3) and RECEIVER_PHONE = "&phone&" and ID ="& order
                        set result = cmdPrep.execute

                %>  
                        <%if result.EOF then%>
                            <div id='orders' class="orderList">
                                <h1>Sorry, we couldn't find your shit</h1>
                        <%else
                            session("trackerId") = order
                            session("trackerPhone") = phone
                        %>
                            <div id='orders' class="orderList">
                                <h1>My Orders</h1>
                                <!--#include virtual="/UIcomponents/displayTrackOrder.asp"-->
                        <%end if
                    end if
                %>
            </div>
        </div>
    </div>
    <script src="/Jquery/jquery-3.6.1.min.js"></script>
    <script>
        $(".showbtn").click(function () {
            $(this).toggleClass('rotate');
            $(this).closest(".order__header").next().next().slideToggle(300)
        })
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
    </script>
</body>
</html>