<% 
Sub displayProduct(obj)
    Response.Write "<div class='product'><div class='product-img'> <img src='"& obj.Image &"' loading='lazy'></div><div class='product-name'>"& obj.Name &"</div><div class='product-price current_format'>"& obj.Price &"</div></div>"
end sub
%>

