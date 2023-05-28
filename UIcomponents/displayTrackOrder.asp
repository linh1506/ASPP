<%  
    set userOrder = getUserOrderList
    for each item in userOrder
        %><div class="order">
            <div class="order__header">
                <span class="order__status <%=getOrderStatus(userOrder(item).Status)%>">&#x2022;</span>
                <h4>&emsp;Order <%=userOrder(item).Id%> created at <span class="order__date "><%=DateValue(userOrder(item).CreateAt)%></span></h4>
            </div>
            <p class="order__statusText <%=getOrderStatus(userOrder(item).Status)%>"><%=getOrderStatusText(userOrder(item).Status)%></p>
        <%
        %><ul><%
        set userOrderItem = getOrderItems(userOrder(item).Id)
            for each product in userOrderItem
                %>
                    <li>x<%=userOrderItem(product).quantity&""%>&emsp;<%=userOrderItem(product).name%>&emsp;<div class="order__itemSize"></div> size: <%=userOrderItem(product).size%></li>
                <%
            next
        %></ul>
        </div>
    <%next%>