<%-- 
    Document   : countOutcome
    Created on : 05 Jun 2024, 7:40:36 PM
    Author     : Jeanette
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Count employees Page</title>
    </head>
    <body>
        <!-- Main heading indicating the purpose of the page -->
        <h1>Hello!</h1>

        <!-- Scriptlet to retrieve the total number of employees from the request attributes -->
        <%
            Integer cnt = (Integer) request.getAttribute("cnt");
        %>

        <!-- Paragraph displaying the total number of employees -->
        <p>The total number of employees in the database is <%=cnt%></p>

        <!-- Link to navigate back to the menu page -->
        <p>Click <a href="menu.html">here</a> to go back to the menu.</p>

    </body>
</html>
