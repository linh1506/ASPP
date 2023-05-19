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
                Response.Redirect("../management.asp?type=3")
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
    <link rel="stylesheet" href="../Resources/web-font-files/lineicons.css">
    <link rel="stylesheet" href='../UIcomponents/header.css'>
    <link rel="stylesheet" href='../UIcomponents/notification.css'>
    <link rel="stylesheet" href="./addpromote.css">
    <script src="../Jquery/jquery-3.6.1.min.js"></script>
    <title>Add Promotion</title>
</head>
<body>
    <!--#include file="../UIcomponents/notification.asp"-->
    <div class="container">
        <div>
            <h2>Add Promotion</h2>
        </div>
            <form method="post" name ="hehe" onsubmit="return ValidationEvent()">
            <div class="form-group">
                <label for="name">Name</label>
                ' <input type="text" required class="form-control" id="name" name="name">
            </div>
            <div class="form-group">
                <label for="code">Code</label>
                <input type="text" required class="form-control" id="code"  name="code">
            </div>
            <div class="form-group">
                <label for="discount">Discount</label>
                <input type="number" required step="0.1" class="form-control" id="discount"  name="discount" min="0" max="1">
            </div>
            <div class="form-group">
                <label for="expired">Expired at</label>
                <input type="date" required class="form-control" id="expired" name="expired">
            </div>
            <br>
            <button type="submit" class="btn btn-success">Submit</button>
            </form>
</div>
    <script>
        function ValidationEvent(){
            var time = document.getElementById("expired").value;
            var timec = new Date(time);
            const currentdate = new Date()
            if (timec < currentdate )
            {
                notification("Thời gian hết hạn không hợp lệ","var(--bs-orange)")
                return false;
            }
            else { 
            return true;
            }
        }

    </script>
</body>
</html>