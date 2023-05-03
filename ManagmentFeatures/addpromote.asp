<!--#include file="../Security/security.asp"-->

<!--#include file="../connect.asp"-->
<%
    name = Request.form("name")
    code = Request.form("code")
    discount = Request.form("discount")
    expired = Request.form("expired")
    
    if(Not isnull(name) and not isnull(code) and not isnull(discount) and not isnull(expired) and trim(name)<>"" and trim(code)<>"") then
        Set cmdPrep = Server.CreateObject("ADODB.Command")
        cmdPrep.ActiveConnection = connDB
        cmdPrep.CommandType = 1
        cmdPrep.Prepared = True
        cmdPrep.CommandText = "Select * from PROMOTION where COUPON_CODE = ?"
        cmdPrep.Parameters(0) = code
        Set Result = cmdPrep.execute
        if not Result.EOF then
            Session("Success") = "Mã code đã tồn tại"
            else
                Set cmdPrep = Server.CreateObject("ADODB.Command")
                ' connDB.Open()                
                cmdPrep.ActiveConnection = connDB
                cmdPrep.CommandType = 1
                cmdPrep.Prepared = True
                cmdPrep.CommandText = "Insert into PROMOTION(COUPON_CODE,EXPIRED_AT,DISCOUNT_VALUE,NAME,IS_ACTIVE) values(?,?,?,?,1)"
                cmdPrep.Parameters(0) = code
                cmdPrep.Parameters(1) = expired
                cmdPrep.Parameters(2) = discount
                cmdPrep.Parameters(3) = name
                cmdPrep.execute
                
                Session("Success") = "Thêm khyến mãi thành công"
                Response.Redirect("../management.asp")
        end if
        Result.Close()
        connDB.Close()
    end if
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../bootstrap-5.2.0-dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../stylelogin.css" />
    <script src="../Jquery/jquery-3.6.1.min.js"></script>
    <title>Add Promotion</title>
</head>
<body>
    <!--#include file="../header.asp"-->
    <div class="container">
        <div>
            <h2>Add Promotion</h2>

        </div>
            <form method="post">
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" required class="form-control" id="name" placeholder="Enter name promotion" name="name">
            </div>
            <div class="form-group">
                <label for="code">Code</label>
                <input type="text" required class="form-control" id="code" placeholder="Enter code promotion" name="code">
            </div>
            <div class="form-group">
                <label for="discount">Discount</label>
                <input type="number" step="0.1" class="form-control" id="discount" placeholder="Discount value" name="discount" min="0" max="1">
            </div>
            <div class="form-group">
                <label for="expired">Expired at</label>
                <input type="date" required class="form-control" id="expired" name="expired">
            </div>
            <br>
            <button type="submit" class="btn btn-outline-success">Submit</button>
            </form>
            <a style="text-decoration:none" href="../management.asp" class="btn btn-link">Quay trở về trang quản lý</a>
</div>
</body>
</html>