<%-- 
    Document   : countYOutcome
    Created on : 05 Jun 2024, 8:28:00 PM
    Author     : Jeanette
--%>

<%@page import="java.util.List"%>
<%@page import="za.ac.tut.entities.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!-- Paragraph indicating the purpose of the section -->
        <p style="margin-bottom: 20px;">Below are the details of the youngest employee.</p>

        <!-- Scriptlet to retrieve the employee details from the request attributes -->
        <%
            Employee emp = (Employee) request.getAttribute("emp");

            // Encoding the image bytes to base64 format
            byte[] image = emp.getImage();
            String imagebase64 = java.util.Base64.getEncoder().encodeToString(image);
        %>

        <!-- Table to display the employee details -->
        <table style="border-collapse: collapse; width: 100%; border: 1px solid black;">
            <!-- Employee details -->
            <tr>
                <!-- Table cell containing the photo -->
                <td style="padding: 8px;"><img src="data:image/jpeg;base64,<%=imagebase64%>" width="100" height="100"></td> <!-- Setting width and height of the image -->
                <!-- Table cell containing other details -->
                <td style="padding: 8px;">
                    <!-- Inner table to display the details -->
                    <table style="width: 100%; border-collapse: collapse;">
                        <!-- Table rows for each detail -->
                        <tr><td style="padding: 8px;">Name:</td><td style="padding: 8px;"><%= emp.getName()%></td></tr>
                        <tr><td style="padding: 8px;">Surname:</td><td style="padding: 8px;"><%= emp.getSurname()%></td></tr>
                        <tr><td style="padding: 8px;">Age:</td><td style="padding: 8px;"><%= emp.getAge()%></td></tr>
                        <tr><td style="padding: 8px;">Gender:</td><td style="padding: 8px;"><%= emp.getGender()%></td></tr>
                        <tr><td style="padding: 8px;">Employee Number:</td><td style="padding: 8px;"><%= emp.getId()%></td></tr>
                        <tr>
                            <!-- Table cell for temperatures -->
                            <td style="padding: 8px;">List of Temperatures:</td>
                            <td style="padding: 8px;">
                                <!-- List of temperatures -->
                                <ul style="margin: 0;">
                                    <%
                                        List<Double> temp = emp.getTemperatures();
                                        for (Double i : temp) {
                                    %>
                                    <li><%=i%></li>
                                        <%
                                            }
                                        %>
                                </ul>
                            </td>
                        </tr>
                        <tr>
                            <!-- Table cell for temperature statuses -->
                            <td style="padding: 8px;">List of Temperature Statuses:</td>
                            <td style="padding: 8px;">
                                <!-- List of temperature statuses -->
                                <ul style="margin: 0;">
                                    <%
                                        List<String> statuses = emp.getTemperatureStatuses();
                                        for (String i : statuses) {
                                    %>
                                    <li><%= i%></li>
                                        <%
                                            }
                                        %>
                                </ul>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>

        <!-- Link to navigate back to the menu page -->
        <p style="margin-top: 20px;">Click <a href="menu.html">here</a> to go back to the menu.</p>

    </body>
</html>
