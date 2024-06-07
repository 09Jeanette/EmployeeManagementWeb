<%-- 
    Document   : searchOutcome
    Created on : 05 Jun 2024, 6:48:38 PM
    Author     : Jeanette
--%>

<%@page import="java.util.List"%>
<%@page import="za.ac.tut.entities.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>search outcome Page</title>
    </head>
    <body>
        <!-- Main heading indicating the success of the operation -->
        <h1>Success!</h1>

        <!-- Subheading indicating that the employee has been found -->
        <h3>Employee has been found!!</h3>

        <!-- Paragraph providing instructions -->
        <p>Below are the details of the employee.</p>

     

        <%
            // Retrieving employee details from request attributes
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
