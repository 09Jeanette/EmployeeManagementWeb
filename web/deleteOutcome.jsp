<%-- 
    Document   : deleteOutcome
    Created on : 05 Jun 2024, 7:33:20 PM
    Author     : Jeanette
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete employee Page</title>
    </head>
    <body>
        <h1>DELETED!</h1>
        
        <%
          Long id = (Long)request.getAttribute("id");
        %>
        
        <p>Employee with id <%=id%> has been deleted successfully.</p>
        
         <p>Click <a href="menu.html">here</a> to go back to the menu.</p>
    </body>
</html>
