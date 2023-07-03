<!--#include file="../connect.asp"-->
<!--#include file="../Security/security.asp"-->
<!--#include file="../models/customers.asp"-->
<!--#include virtual="/ShoppingFeature/getOrderList.asp"-->
<%
    id = Request.QueryString("id")
    dim cmdPrep 
    Set cmdPrep = Server.CreateObject("ADODB.Command")
    cmdPrep.ActiveConnection = connDB
    cmdPrep.CommandType = 1
    cmdPrep.Prepared = True
    cmdPrep.commandText = "select count(id) as count from USERS where Id = " & id
    set Result = cmdPrep.execute
    if (Result("count") = 1) then
        cmdPrep.commandText = "select * from USERS where Id = " & id
        set Result = cmdPrep.execute
        set cus = New customers
        cus.Id = Result("ID")
        cus.Address = Result("ADDRESS")
        cus.Name = Result("NAME")
        cus.Email = Result("EMAIL")
        cus.Phone = Result("PHONE")
        cus.Status = Result("STATUS")
        Result.Close
        set Result = nothing
    Else
        Response.Redirect("../Errors/404.asp")
    end if
%>
<%
  Set cmdPrep = Server.CreateObject("ADODB.Command")
  cmdPrep.ActiveConnection = connDB
  cmdPrep.CommandType = 1
  cmdPrep.CommandText = "select * from ORDERS where CREATED_BY ="&id
  Set Result = cmdPrep.execute
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="/bootstrap-5.2.0-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href='/UIcomponents/ShoppingHeader.css'>
    <link rel="stylesheet" href='/UIcomponents/notification.css'>
    <link rel="stylesheet" href="/Resources/web-font-files/lineicons.css">
    <link rel="stylesheet" href="/ShoppingFeature/myCart.css">
    <link rel="stylesheet" href="/management.css">
    <link rel="stylesheet" href="/fonts.css">
    <link rel="stylesheet" href="/css/getOrderList.css">
    <script src="/Jquery/jquery-3.6.1.min.js"></script>
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
    <div class="container pt-3">
      <div class="customer-info shadow-sm p-3 rounded-2 px-lg-3 w-50" style='font-family: quicksand'>
        <p>ID Number: <%=cus.Id%></p>
        <p>Customer Name: <%=cus.Name%></p>
        <p>Email Address: <%=cus.Email%></p>
        <p>Phone Number: <%=cus.Phone%></p>
        <% response.codepage  =  0%>
        <p>Delivery Address: <%=cus.Address%></p>
        <% response.codepage  =  65001%>
      </div>
      <div class="previous w-100">
        <table class="table table-striped">
          <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">Created At</th>
              <th scope="col">Total</th>
              <th scope="col">Status</th>
            </tr>
          </thead>
          <tbody>
            <%
              do while not Result.EOF
              'code here
              %>
                <tr>
                  <td><%=Result("ID")%></td>
                  <td class='time-format'><%=Result("CREATED_AT")%></td>
                  <td class='current_format'><%=Result("AMOUNT")%></td>
                  <td class='<%=getOrderStatus(Result("STATUS"))%>'><%=getOrderStatusText(Result("STATUS"))%></td>
                </tr>
              <%
              Result.MoveNext
              Loop
              Result.Close
              set Result = nothing
            %>
          </tbody>
        </table>
      </div>
    </div>
    <script>
      $(document).ready(function() {
        $(".current_format").each(function() {
              var text = $(this).text();
              var formattedText = formatCurrencyVND(text);
              $(this).text(formattedText);
          });
          function formatCurrencyVND(amount) {
          return new Intl.NumberFormat('de-DE', { style: 'currency', currency: 'VND' }).format(amount)
          }
      })


      $(document).ready(function() {
        $('.time-format').each(function() {
          var originalDate = $(this).text(); // Get the original date from the element's text
          var formattedDate = formatDate(originalDate); // Format the date using the formatDate function
          $(this).text(formattedDate); // Set the formatted date back to the element's text
        });
      });

      function formatDate(dateString) {
        var date = new Date(dateString);
        var day = date.getDate();
        var month = date.getMonth() + 1;
        var year = date.getFullYear();

        // Ensure day and month are displayed with leading zeros if necessary
        if (day < 10) {
          day = '0' + day;
        }
        if (month < 10) {
          month = '0' + month;
        }

        return day + '/' + month + '/' + year;
      }
    </script>
  </body>
</html>