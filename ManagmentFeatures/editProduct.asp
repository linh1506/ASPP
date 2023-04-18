<!--#include file="../connect.asp"-->
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
            Set cmdPrep = Server.CreateObject("ADODB.Command")
            cmdPrep.ActiveConnection = connDB
            cmdPrep.CommandType = 1
            cmdPrep.CommandText = "SELECT TOP 1 * FROM PRODUCT WHERE ID=?"
            cmdPrep.Parameters(0)=id
            Set Result = cmdPrep.execute
            Dim shoeName, shoeCategory, shoeBrand, checkbox, description, price,JSONstring
            shoeName = Result("NAME")
            shoeCategory = Result("CATEGORY_ID")
            shoeBrand = Result("BRAND_ID")
            checkbox = Result("IS_AVAILABLE")
            description = Result("DESCRIPTION")
            price = Result("PRICE")
            If Err.Number <> 0 Then 
                Session("Error") = "something wrong, try again"
                response.redirect("../Errors/404.asp")
                Result.close
                set Result = nothing
            End If
        else
            Session("Error") = "something wrong, try again"
            response.redirect("../management.asp")
            Result.close
            set Result = nothing
        end if
        Result.close
        set Result = nothing
    End If
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../bootstrap-5.2.0-dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../stylelogin.css" />
    <script src="../Jquery/jquery-3.6.1.min.js"></script>
  </head>
  <body>
    <div class="container">
        <form method="post">
            <div>
                <!-- Name Product -->
                <label for="name" class="form-label">Name</label>
                <input type="text" class="form-control" id="name" name="name" value = "<% =Trim(shoeName) %>">
            </div>
            <div>
                <!-- Brand Product -->
                <label for="brand" class="form-label">Brand</label>
                <select name="brand" id="brand">
                <%
                    cmdPrep.CommandText = "SELECT * FROM BRAND"
                    Dim Result2
                    set Result2 = cmdPrep.execute
                    do while not Result2.EOF
                %>
                    <option value="<%=Result2("ID")%>" <%if Result2("ID") = shoeBrand then %>selected <%end if%>><%=Result2("NAME")%></option>
                <%
                    Result2.MoveNext
                    loop
                    Result2.close
                %>
                </select>
            </div>
            <div>
                <!-- Category Product -->
                <label for="category" class="form-label">Category</label>
                <select name="category" id="category">
                <%
                    cmdPrep.CommandText = "SELECT * FROM CATEGORY"
                    set Result = cmdPrep.execute
                    do while not Result.EOF
                %>
                    <option value="<%=Result("ID")%>" <%if Result("ID") = shoeCategory then %> selected <%end if%>><%=Result("NAME")%></option>
                <%
                    Result.MoveNext
                    loop
                    Result.close
                %>
                </select>
            </div>
            <div>
                <label for="isAvailable" class="form-lable">Open for Sale immediately?</label>
                <input type="checkbox" name="isAvailable" id="isAvailable" <%if checkbox = True then%>checked <% end if%>>
            </div>
             <div>
                <label for="price" class="form-lable">Opening Price:</label>
                <input type="number" name="price" oninput="this.value|=0" id="price" value = "<% =price %>">
            </div>
            <div>
                <label for="description" class="form-label">Description</label>
                <!--<input type="text" name="description" id="description" class="form-control">-->
                <textarea class="form-control" id="description" name="description" rows="5" ><%=Trim(description)%></textarea>
            </div>
            <label for="shoesizes" class="form-label">Shoe Sizes</label>
            <div class="form-group" id="dynamic-fields">
            <!-- Initial input fields -->
            <%
                    cmdPrep.CommandText = "SELECT * FROM PRODUCT_SIZE WHERE PRODUCT_ID ="&id
                    set Result = cmdPrep.execute
                    do while not Result.EOF
            %>
                <div class="row size-quantity-inputs">
                    <div class="col-sm-4">
                        <input type="number" class="form-control" name="shoe-size[]" placeholder="Size" value = "<%=Result("SIZE")%>" />
                    </div>
                    <div class="col-sm-4">
                        <input type="number" class="form-control" name="shoe-quantity[]" placeholder="Quantity" value = "<%=Result("QUANTITY")%>" />
                    </div>
                    <div class="col-sm-4">
                        <button type="button" class="btn btn-danger" onclick="removeRow(this)">Delete</button>
                    </div>
                </div>
            <%
                Result.MoveNext
                loop
                Result.close
            %>
            </div>
            <!-- Add button -->
            <div class="form-group">
                <button type="button" class="btn btn-primary" id="add-button">Add Size</button>
            </div>
            <!-- Add image -->
            <div id="inputContainer">
                <label for="input1">Images:</label>
                <div class="form-group">
                    <input type="text" class="form-control" id="input1" name="input[]" required>
                    <button type="button" class="btn btn-danger removeButton">Remove</button>
                </div>
            </div>
             <button type="button" class="btn btn-primary addButton">Add</button>
            <!-- SUBMIT -->
            <button type="submit" class="btn btn-success" style="display:block;">Submit</button>
        </form>
        <script>
            function removeRow(button) {
                var row = button.closest('.size-quantity-inputs');
                row.remove();
            }
            document.getElementById("add-button").addEventListener("click", function() {
                var row = document.querySelector('.size-quantity-inputs').cloneNode(true);
                row.querySelectorAll('input').forEach(function(input) {
                    input.value = '';
                });
                document.querySelector('#dynamic-fields').appendChild(row);
            });
        </script>
        <script>
            // Add button click handler
            $(".addButton").click(function() {
            var index = $("#inputContainer").children().length + 1;
            if (index<=4) {
                var inputHTML = '<div class="form-group"><input type="text" class="form-control" id="input' + index + '" name="input[]" required><button type="button" class="btn btn-danger removeButton">Remove</button></div>';
                $("#inputContainer").append(inputHTML);
            }
            });
            // Remove button click handler
            $(document).on("click", ".removeButton", function() {
            $(this).closest(".form-group").remove();
            });
        </script>
        <%  
        Function ArrayToJson()
            Dim getstring
            getstring = Request.Form("input[]")
            Dim arr
            arr = Split(getstring, ", ")
            Dim json, i
            json = "{"
            For i = 0 To UBound(arr)
                json = json & """" & CStr(i) & """:""" & arr(i) & """"
                If i < UBound(arr) Then json = json & ","
            Next
            json = json & "}"
            ArrayToJson = json
        End Function

            If Request.ServerVariables("REQUEST_METHOD") = "POST" Then
                connDB.BeginTrans
                
                If Request.Form("isAvailable") = "on" Then
                    checkbox = True
                    Else
                    checkbox = False
                End If
                ' Response.Write TypeName(checkbox) & " "
                JSONstring = ArrayToJson()
                ' Response.Write  JSONstring & " "
                ' Response.Write TypeName(JSONstring) & " "
                price = Request.Form("price")
                price =CLng(price)
                ' Response.Write TypeName(price) & " "
                description = Request.Form("description")
                ' Response.Write TypeName(description) & " "
                shoeName = Request.Form("name")
                ' Response.Write TypeName(shoeName) & " "
                shoeCategory = Request.Form("category")
                shoeCategory = Cint(shoeCategory)
                ' Response.Write TypeName(shoeCategory) & " "
                shoeBrand = Request.Form("brand")
                shoeBrand = Cint(shoeBrand)
                ' Response.Write TypeName(shoeBrand) & " "
                cmdPrep.CommandText = "insert into PRODUCT(DESCRIPTION,IS_AVAILABLE,NAME,PRODUCT_IMAGE,PRICE,BRAND_ID,CATEGORY_ID) values(?,?,?,?,?,?,?)"
                cmdPrep.parameters.Append cmdPrep.createParameter("description",202,1,-1,description)
                cmdPrep.parameters.Append cmdPrep.createParameter("isAvailable",11,1, ,checkbox)
                cmdPrep.parameters.Append cmdPrep.createParameter("ShoeName",202,1,-1,shoeName)
                cmdPrep.parameters.Append cmdPrep.createParameter("productImage",202,1,-1,JSONstring)
                cmdPrep.parameters.Append cmdPrep.createParameter("price",3,1, ,price)
                cmdPrep.parameters.Append cmdPrep.createParameter("brandID",3,1, ,shoeBrand)
                cmdPrep.parameters.Append cmdPrep.createParameter("categoryID",3,1, ,shoeCategory)
                cmdPrep.Execute
                Dim shoeSizes, shoeQuantities
                shoeSizes = Split(Request.Form("shoe-size[]"), ", ")
                shoeQuantities = Split(Request.Form("shoe-quantity[]"), ", ")
                Dim i
                sqlQuery = "Select Top 1 ID from PRODUCT ORDER BY ID DESC"
                cmdPrep.CommandText = sqlQuery
                Set Result = cmdPrep.execute 
                Set IDforSize = Result("ID")
                For i = 0 To UBound(shoeSizes)
                    cmdPrep.commandText="insert into PRODUCT_SIZE values(" & IDforSize & "," & Cint(shoeSizes(i)) & "," & Cint(shoeQuantities(i)) & ")"
                    cmdPrep.execute
                Next
                If Err.Number = 0 Then  
                    connDB.CommitTrans
                Else
                    ConnDB.RollbackTrans
                end if
                Response.redirect("/management.asp")
            End If 
        %>
    </div>
  </body>
</html>