<!--#include virtual="/models/orders.asp"-->
<!--#include virtual="/models/order_item.asp"-->
<%  
    Dim userId
    userId = Session("Id")
    Public Function getOrdersCount()
        dim count
        Set cmdPrep = Server.CreateObject("ADODB.Command")
        cmdPrep.ActiveConnection = connDB
        cmdPrep.CommandType = 1
        cmdPrep.Prepared = True
        cmdPrep.commandText = "select count(ID) as list from ORDERS where CREATED_BY = "&userId&" and STATUS not in(2,3)"
        Set result = cmdPrep.execute
        if not result.EOF then
            count = result("list")
        end if
        set result = nothing
        getOrdersCount = count
    End Function
    
    Public Function getUserOrderList
        dim seq
        set OrderList = Server.CreateObject("Scripting.Dictionary")
        Set cmdPrep = Server.CreateObject("ADODB.Command")
        cmdPrep.ActiveConnection = connDB
        cmdPrep.CommandType = 1
        cmdPrep.Prepared = True
        cmdPrep.commandText = "select * from ORDERS where CREATED_BY = "&userId&" and STATUS not in(2,3)"
        Set result = cmdPrep.execute
        seq = 0 
        do While not result.EOF
            seq=seq+1
            set order = new orders
            order.Id = result("ID")
            order.Amount = result("AMOUNT")
            order.CreateAt = result("CREATED_AT")
            order.Address =result("RECEIVER_ADDRESS")
            order.Phone = result("RECEIVER_PHONE")
            order.Name = result("RECEIVER_NAME")
            order.Status = result("STATUS")
            order.PromoValue = result("PROMOTION_VALUE")
            OrderList.add seq,order
            result.MoveNext
        Loop
        set result = nothing
        set getUserOrderList = OrderList
    End Function

    Public Function getOrderItems(orderId)
        dim seq
        set OrderItems = Server.CreateObject("Scripting.Dictionary")
        Set cmdPrep = Server.CreateObject("ADODB.Command")
        cmdPrep.ActiveConnection = connDB
        cmdPrep.CommandType = 1
        cmdPrep.Prepared = True
        cmdPrep.commandText = "SELECT o.*, p.Name AS ProductName FROM (SELECT ORDER_ITEMS.PRODUCT_ID, ORDER_ITEMS.QUANTITY, ORDER_ITEMS.SIZE,ORDER_ITEMS.UNIT_PRICE FROM ORDER_ITEMS JOIN ORDERS ON ORDER_ITEMS.ORDER_ID = ORDERS.ID WHERE ORDERS.Created_By = "&userId&" and ORDERS.STATUS not in(2,3) and ORDERS.ID = "&orderId&") as o JOIN product p ON o.PRODUCT_ID = p.ID;"
        Set result = cmdPrep.execute
        seq = 0 
        do While not result.EOF
            seq=seq+1
            set item = new orderItem
            item.name = result("ProductName")
            item.size = result("SIZE")
            item.quantity = result("QUANTITY")
            item.price = result("UNIT_PRICE")
            OrderItems.add seq,item
            result.MoveNext
        Loop
        set result = nothing
        set getOrderItems = OrderItems
    End Function
    
    Public Function getOrderStatus(status)
        select case status
            case 0  'Dang nhan don
                getOrderStatus = " order__status--blue"
            case 1 'Dang giao hang
                getOrderStatus = " order__status--orange"
            case 2 'Giao hang thanh cong
                getOrderStatus = " order__status--green"
            case 3 'Don hang bi huy
                getOrderStatus = " order__status--red"
        end select
    End Function

    Public Function getOrderStatusText(status)
        select case status
            case 0  'Dang nhan don
                getOrderStatusText = "Order Received"
            case 1 'Dang giao hang
                getOrderStatusText = "Delivering"
            case 2 'Giao hang thanh cong
                getOrderStatusText = "Order Delivered"
            case 3 'Don hang bi huy
                getOrderStatusText = "Order Cancelled, please contact us for more info"
        end select
    End Function    

    Sub LoggedInUser_DisplayOrder
        ' Do Something...
    End Sub
%>
