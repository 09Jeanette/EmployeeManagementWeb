<%-- 
    Document   : countFOutcome
    Created on : 05 Jun 2024, 8:24:17 PM
    Author     : Jeanette
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>average age Page</title>
    </head>
    <body>
        <!-- Main heading indicating the purpose of the page -->
        <h1>Average Age of Females!</h1>

        <!-- Scriptlet to retrieve the average age of female employees from the request attributes -->
        <%
            Double cnt = (Double) request.getAttribute("cnt");
        %>

        <!-- Paragraph displaying the average age of female employees -->
        <p>The average age of female employees is <%=cnt%></p>

        <!-- Link to navigate back to the menu page -->
        <p>Click <a href="menu.html">here</a> to go back to the menu.</p>

    </body>
</html>
