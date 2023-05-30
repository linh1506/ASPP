<% 
Sub displayProduct(obj)
    Response.Write "<div class='product'><div class='product-img'> <img src='"& obj.Image &"' loading='lazy'></div><div class='product-name'>"& obj.Name &"</div><div class='product-price'>"& obj.Price &"đ</div></div>"
end sub
%>

