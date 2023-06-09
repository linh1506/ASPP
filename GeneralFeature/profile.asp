<!--#include file="../connect.asp"-->
<!--#include file="../models/customers.asp"-->
<!--#include virtual="/ShoppingFeature/getOrderList.asp"-->

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/bootstrap-5.2.0-dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/UIcomponents/ShoppingHeader.css">
    <link rel="stylesheet" href="/Resources/web-font-files/lineicons.css">
    <link rel="stylesheet" href="/GeneralFeature/profile.css">
    <link rel="stylesheet" href="/css/getOrderList.css">
    <title>Document</title>
</head>
<body>
    <!--#include file="../UIcomponents/pageLoader.asp"-->
    <!--#include file="../UIcomponents/ShoppingHeader.asp"-->
    <div class="sidebar-toggler"><i class="lni lni-text-align-justify"></i></div>
    <div class="d-flex flex-column flex-shrink-0 py-3 sidebar">
        <a href="#" class="d-flex mb-3 mb-md-0 w-100 me-md-auto link-dark text-decoration-none">
            <span class="fs-4">Account</span><i class="lni lni-arrow-left backicon"></i>
        </a>
        <hr>
        <ul class="nav nav-pills flex-column mb-auto">
            <li>
                <a href="#" class="sidebar-item nav-link link-dark" aria-current="page" onclick="displayTab(0)" >
                <i class="lni lni-restaurant"></i><p>My account</p></a>
            </li>
            <li>
                <a href="/ShoppingFeature/myCart.asp" class="sidebar-item nav-link link-dark">
                <i class="lni lni-cart-full"></i><p>My Cart</p></a>
            </li>
            <li>
                <a href="#" class="sidebar-item nav-link link-dark active" onclick="displayTab(1)">
                <i class="lni lni-ticket"></i><p>Orders</p></a>
            </li>
            <li>
                <a href="#" class="sidebar-item nav-link link-dark" onclick="displayTab(2)">
                <i class="lni lni-library"></i><p>Purchase history</p></a>
            </li>
        </ul>
  </div>
<%
    
    if (isnull(Session("Id")) or Session("Id") = "") then
        Response.Redirect("./Errors/404.asp")
    else
        dim cmdPrep
        Set cmdPrep = Server.CreateObject("ADODB.Command")
        cmdPrep.ActiveConnection = connDB
        cmdPrep.CommandType = 1
        cmdPrep.Prepared = True
        id = Session("Id")
        name = Trim(Request.Form("name"))
        phone = Trim(Request.Form("phone"))
        address = Trim(Request.Form("address"))
        if (Request.ServerVariables("REQUEST_METHOD") = "POST") then 
            if(name <> "" and Not IsNull(name)  and phone <> "" and Not IsNull(phone) and address <> "" and Not IsNull(name)) then
                cmdPrep.commandText = "UPDATE USERS SET NAME=N'" & name & "', PHONE='" & phone & "',ADDRESS=N'" & address & "' WHERE ID = '" & id & "'"
                cmdPrep.execute
                Session("Name") = name 
                Session("Success") = "Change Successfully"
            else 
                Session("Error") = "Input is null, pls enter all infomation"
            end if
        end if
        cmdPrep.commandText = "select * from USERS WHERE ID = '" & id & "'"
        set Result = cmdPrep.execute
        set cust = New customers
        cust.Id = Result("ID")
        cust.Address = trim(Result("ADDRESS"))
        cust.Name = trim(Result("NAME"))
        cust.Email = trim(Result("EMAIL"))
        cust.Phone = trim(Result("PHONE"))
        cust.Status = Result("STATUS")
        Result.Close
        set Result = nothing
%>  
    <div class="container-custom">
        <div id='account' class="accinfo account__settings">
            <h1>Account Information:</h1>
            <form action="" method="POST" >
                Email: <%=cust.Email%><br>
                Name: <input class="form-control" id="nameInput" type="text" value="<%=cust.Name%>" name="name" onchange="CheckInputInfo()">
                <span class="error-message"></span><br>
                Phone number: <input  class="form-control" id="phoneInput" type="text" value="<%=cust.Phone%>" name="phone" onchange="CheckInputInfo()"> 
                <span class="error-message"></span><br>
                Address: <input class="form-control"  id="addrInput" type="text" value="<%=cust.Address%>" name="address" onchange="CheckInputInfo()">
                <button class="btn btn-danger" id="submitInfo" disabled type="submit">Submit</button>
            </form> 

            <button class="btn" id="show" >Change Password <span><i class="lni lni-chevron-down"></i></span></button>
            <div id="change__password">
                <form action="changepassword.asp?id=<%=Session("Id")%>" method="POST">
                    old password: <input id="oldpass" class="form-control"  type="text" name="password" onchange="CheckInputPassword()">
                    new password: <input id="newpass" class="form-control" type="text" name="passwordchange" onchange="CheckInputPassword()">
                    confirm password: <input id="repass" class="form-control" type="text" name="passwordreenter" onchange="CheckInputPassword()"> 
                    <button id="submitPass" disabled class="btn btn-danger" type="submit">change password</button>
                </form>
            </div>
        </div>

        <div id='orders' class="order_wrapper account__settings">
            <div class="orderList">
                <h1>My Orders</h1>
                <!--#include virtual="/UIcomponents/displayTrackOrder.asp"-->
            </div>
        </div>

        <div id='history' class="order_wrapper account__settings">
            <div class="orderList">
                <h1>My Purchase History</h1>
                <!--#include virtual="/UIcomponents/displayOrderHistory.asp"-->
            </div>
        </div>
    </div>
<%end if%>
<script src="/Jquery/jquery-3.6.1.min.js"></script>
<script>
    $('#show').click(() => {

      $('#change__password').slideToggle(300)
    })
    $('.sidebar-toggler').click(() => {
      $('.sidebar').animate({left:0},"fast")
    })
    $('.backicon').click(() => {
      $('.sidebar').animate({left:'-280px'},"fast")
    })
    $('.sidebar-item').click(function () {
      $('.sidebar-item').removeClass("active")
      $(this).addClass("active");
    })
    //Script for order items
    $(".showbtn").click(function () {
        $(this).toggleClass('rotate');
        $(this).closest(".order__header").next().next().slideToggle(300)
    })
    $(document).ready(function() {
        $('.account__settings').hide()
        $('.account__settings:eq(1)').show()
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
<script>
    const displayTab = (tab) => {
        $('.account__settings').hide()
        $('.account__settings:eq('+tab+')').show()
    }
</script>
<script>
    //script de validate change pass
    $(document).ready(function() {
        $("#nameInput, #phoneInput").on("input", function() {
            var input = $(this);
            var inputValue = input.val();

            // Regular expression to match special characters
            var specialCharRegex = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/;
            if (inputValue.trim() === "") {
            input.addClass("error");
            input.next(".error-message").text("Please fill out all fields");
            } else {
                if (specialCharRegex.test(inputValue)) {
                    input.addClass("error");
                    input.next(".error-message").text("Invalid input. Special characters are not allowed.");
                } else {
                    input.removeClass("error");
                    input.next(".error-message").text("");
                }
                }
        });
    })
    function CheckInputInfo(){
        let name = document.getElementById("nameInput").value;
        let phone = document.getElementById("phoneInput").value;
        let address = document.getElementById("addrInput").value;
        let submitInfo = document.getElementById("submitInfo");
        if(name.trim() != "" && phone.trim()!= "" && address.trim() != "" )
        {
            submitInfo.disabled=false;
        }
    }
    function CheckInputPassword(){
        let oldpassword = document.getElementById("oldpass").value;
        let newpassword = document.getElementById("newpass").value;
        let repassword = document.getElementById("repass").value;
        let submitPassword = document.getElementById("submitPass");
        if(oldpassword.trim() != "" && newpassword.trim()!= "" && repassword.trim() != "" )
        {
            submitPassword.disabled=false;
        }
    }
</script>
<script src="../bootstrap-5.2.0-dist/js/bootstrap.min.js"></script>
</body>
</html>

