<%
Function adjustQuantity(idProduct, size, quantityRequire, currentCart)
    ' Loop through all the rows in currentCart
    For i = 0 To UBound(currentCart) - 1
        ' Get the id and size of the product in the current row
        Dim currentProductId, currentSize
        currentProductId = currentCart(i)(0)
        currentSize = currentCart(i)(1)
        ' If the current row matches the id and size of the product we want to update
        If ((currentProductId = idProduct) And (currentSize = size)) Then
            ' Update the quantity in the current row
            currentCart(i)(2) = quantityRequire
            ' Exit the loop
            Exit For
        End If
    Next
    adjustQuantity = currentCart
End Function

%>