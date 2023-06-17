<%  
    set userOrder = getUserOrderList
    for each item in userOrder
%>      <div class="order">
            <div class="order__header">
                <span class="order__status <%=getOrderStatus(userOrder(item).Status)%>">&#x2022;</span>
                <h4>&emsp;Order <%=userOrder(item).Id%> created at <span class="order__date "><%=DateValue(userOrder(item).CreateAt)%></span></h4>
                <span class="showbtn"><i class="lni lni-chevron-down"></i></span>
            </div>
            <p class="order__statusText <%=getOrderStatus(userOrder(item).Status)%>"><%=getOrderStatusText(userOrder(item).Status)%></p>
            <div class="order__detail">
                <div class="order__pricing">
                    <h6>Order Subtotal: <span class="current_format" <%
                            if userOrder(item).PromoValue = 1  then
                        %> style="display: none;" 
                        <%end if%> >
                        <%
                            If userOrder(item).PromoValue = 0 Then
                                Response.Write userOrder(item).Amount
                            Else
                                Response.Write userOrder(item).Amount / userOrder(item).PromoValue
                            End if
                        %>
                        </span></h6>                        
                        <h6><p class="badge badge--green">Discount: -<%=CLng(CDbl(userOrder(item).PromoValue)*100)%>%</p></h6>
                        <h5>Order Total: <span class="current_format"><%=userOrder(item).Amount%></span></h5>
                </div>
                <div class="order__customer">
                    <p>Customer: <%if Session("Id")=1 then Response.Write "******" else Response.Write userOrder(item).Name %></p>
                    <p>Address: <%if Session("Id")=1 then Response.Write "******" else Response.Write userOrder(item).Address%></p>
                    <p>Contact Number: <%=userOrder(item).Phone%></p>
                    <i class="payment-icon lni lni-postcard"></i>
                </div>
                <ul  class="list-group list-group-flush">
                <%  
                    set userOrderItem = getOrderItems(userOrder(item).Id)
                    for each product in userOrderItem
                        %>
                            <li class="list-group-item">
                                <span class="badge badge--red rounded-pill">x<%=userOrderItem(product).quantity&""%></span>
                                &emsp;<p><%=userOrderItem(product).name%>&emsp;</p>
                                <div class="order__itemSize">size: <%=userOrderItem(product).size%></div>
                            </li>
                        <%
                    next
                %>
                </ul>
            </div>
        </div>
    <%next%>
    <style>
</style>
    <script>

    </script>