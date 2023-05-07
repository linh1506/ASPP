<%
Function removeRow(idProduct, size, currentCart)
    For i = 0 To UBound(currentCart)-1
        ' Check if the current row matches the idProduct and size
        If ((currentCart(i)(0) = idProduct) And (currentCart(i)(1) = size)) Then
            ' Shift the rows after the current row up and remove the last row
            For j = i To UBound(currentCart) - 2
                currentCart(j) = currentCart(j+1)
            Next
            ReDim Preserve currentCart(UBound(currentCart)-1)
            Exit For
        End If
    Next
    ' Shrink the array to save memory
    ReDim Preserve currentCart(UBound(currentCart))
    
    ' Return the updated currentCart array
    removeRow = currentCart
End Function
%>