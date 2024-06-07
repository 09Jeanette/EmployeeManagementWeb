/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.web;

import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.ac.tut.bl.EmployeeFacadeLocal;
import za.ac.tut.entities.Employee;

/**
 *
 * @author Jeanette
 */
public class DeleteEmpServlet extends HttpServlet {

    @EJB
    private EmployeeFacadeLocal efl;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

       // Retrieve the ID parameter from the request and parse it into a Long
        Long id = Long.parseLong(request.getParameter("id"));

// Find the employee with the specified ID using the EmployeeFacadeLocal instance
        Employee emp = efl.find(id);

// Remove the employee from the database using the remove() method of EmployeeFacadeLocal
        efl.remove(emp);

// Set the ID as a request attribute for further processing in the JSP page
        request.setAttribute("id", id);

// Forward the request to the "deleteOutcome.jsp" page for rendering the outcome
        RequestDispatcher disp = request.getRequestDispatcher("deleteOutcome.jsp");
        disp.forward(request, response);

    }

}
