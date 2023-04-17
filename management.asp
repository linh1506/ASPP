<!--#include file="connect.asp"-->
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="./bootstrap-5.2.0-dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="./stylelogin.css" />
    <script src="./Jquery/jquery-3.6.1.min.js"></script>
  </head>
  <body>
  <!--#include file="header.asp"-->
    <div class="tab">
        <button class="tablinks" onclick="openCity(event, 'products')" id="defaultOpen">Manage Products</button>
        <button class="tablinks" onclick="openCity(event, 'customers')">Manage Customers</button>
        <button class="tablinks" onclick="openCity(event, 'promotions')">Manage Promotions</button>
    </div>
    <div class="container">
        <div id="products" class="tabcontent">
            <h1>Manage Products</h1>
            <a href="./ManagmentFeatures/addproduct.asp" class="btn btn-primary">ADD PRODUCT</a>
            <table class="table table-dark">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">NAME</th>
                        <th scope="col">PRICE</th>
                        <th scope="col">STATUS</th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody>
                
                </tbody>
            </table>
        </div>
        <div id="customers" class="tabcontent">
            <h1>Manage Customers</h1>
            <table class="table table-dark">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">NAME</th>
                        <th scope="col">EMAIL</th>
                        <th scope="col">PASSWORD</th>
                        <th scope="col">ADDRESS</th>
                        <th scope="col">PHONE</th>
                        <th scope="col">ROLE</th>
                        <th scope="col">STATUS</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        dim cmdPrep
                        Set cmdPrep = Server.CreateObject("ADODB.Command")
                        cmdPrep.ActiveConnection = connDB
                        cmdPrep.CommandType = 1
                        cmdPrep.Prepared = True
                        cmdPrep.commandText = "select * from users"
                        
                        set Result = cmdPrep.execute
                        do while not Result.EOF
                    %>
                    <tr>
                            <td><%=Result("Id")%></td>
                            <td><%=Result("Name")%></td>
                            <td><%=Result("Email")%></td>
                            <td><%=Result("Password")%></td>
                            <td><%=Result("Address")%></td>
                            <td><%=Result("Phone")%></td>
                            <td><%=Result("Role")%></td>
                            <td>
                                <a href="./ManagmentFeatures/editstatususer.asp?id=<%=Result("Id")%>" class="btn 
                                <%if(Result("Status") = true) then%>
                                    btn-success">active
                                     <%else%>
                                    btn-danger">block
                                    <%end if%>
                                </a>
                            </td>
                    </tr>
                    <%
                        Result.MoveNext
                        loop
                        Result.Close
                        connDB.Close()
                    %>
                </tbody>
            </table>
        </div>
        <div id="promotions" class="tabcontent">
            <h1>Manage Promotions</h1>
            <a href="./ManagmentFeatures/addpromote.asp" class="btn btn-success">Add Promotion</a>
        </div>
    </div>
    <script>
        function openCity(evt, cityName) {
            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("tabcontent");
            for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("tablinks");
            for (i = 0; i < tablinks.length; i++) {
                tablinks[i].className = tablinks[i].className.replace(" active", "");
            }
            document.getElementById(cityName).style.display = "block";
            evt.currentTarget.className += " active";
        }
        document.getElementById("defaultOpen").click();
    </script>
  </body>
</html>