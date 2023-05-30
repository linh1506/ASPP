<% 
    sub displayCategory(obj)
        Response.Write "<h2 class='category-name'>"& obj.Name &"</h2><div class='category' style='background-image:url("& obj.Image &");'></div>"
    end sub
%>
