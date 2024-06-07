<%-- 
    Document   : countAllOutcome
    Created on : 05 Jun 2024, 7:50:41 PM
    Author     : Jeanette
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>get percentage Page</title>
    </head>
    <body>
        <!-- Main heading indicating the purpose of the page -->
        <h1>Percentage of Males and Females!</h1>

        <!-- Scriptlet to retrieve the percentage of males and females from the request attributes -->
        <%
            Double percentageM = (Double) request.getAttribute("percentageM");
            Double percentageF = (Double) request.getAttribute("percentageF");
        %>

        <!-- Paragraph displaying the percentages of male and female employees -->
        <p>
            The percentage of male employees is <b><%=percentageM%>%</b> and of female employees is <b><%=percentageF%>%</b>
        </p>

        <!-- Link to navigate back to the menu page -->
        <p>Click <a href="menu.html">here</a> to go back to the menu.</p>

    </body>

</html>
