<!--#include file="../connect.asp"-->
<!--#include file="../models/customers.asp"-->
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
                <a href="#" class="sidebar-item nav-link link-dark active" aria-current="page"><i class="lni lni-restaurant"></i> <p>My account</p> </a>
            </li>
            <li>
                <a href="/ShoppingFeature/myCart.asp" class="sidebar-item nav-link link-dark"><i class="lni lni-cart-full"></i> <p>My Cart</p></a>
            </li>
            <li>
                <a href="#" class="sidebar-item nav-link link-dark"><i class="lni lni-ticket"></i> <p>Orders</p></a>
            </li>
            <li>
                <a href="#" class="sidebar-item nav-link link-dark"><i class="lni lni-library"></i> <p>Purchase history</p></a>
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
        name = Request.Form("name")
        phone = Request.Form("phone")
        address = Request.Form("address")
        if (Request.ServerVariables("REQUEST_METHOD") = "POST") then 
            cmdPrep.commandText = "UPDATE USERS SET NAME=N'" & name & "', PHONE='" & phone & "',ADDRESS=N'" & address & "' WHERE ID = '" & id & "'"
            cmdPrep.execute
            Session("Name") = name 
            Session("Success") = "Change Successfully"
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
        <div id='account' class="account__settings">
            <h1>Account Information:</h1>
            <form action="" method="POST">
                Email: <%=cust.Email%><br>
                Name: <input class="form-control"  type="text" value="<%=cust.Name%>" name="name">
                Phone number: <input  class="form-control" type="text" value="<%=cust.Phone%>" name="phone"> 
                Address: <input class="form-control"  type="text" value="<%=cust.Address%>" name="address">
            <button class="btn btn-danger" type="submit">Submit</button>
            </form> 

            <button class="btn" id="show" >Change Password <span><i class="lni lni-chevron-down"></i></span></button>
            <div id="change__password">
                <form action="changepassword.asp?id=<%=Session("Id")%>" method="POST">
                    old password: <input class="form-control"  type="text" name="password">
                    new password: <input class="form-control" type="text" name="passwordchange">
                    confirm password: <input class="form-control" type="text" name="passwordreenter"> 
                <button class="btn btn-danger" type="submit">change password</button>
            </form>
            </div>
        </div>

        <div id='orders' class="orders account__settings">
            <h1>My Orders</h1>
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
</script>
<script src="../bootstrap-5.2.0-dist/js/bootstrap.min.js"></script>
</body>
</html>

