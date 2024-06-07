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
public class GetYoungestEmpServlet extends HttpServlet {

    @EJB
    private EmployeeFacadeLocal efl;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve the youngest employee using the youngestEmployee() method of EmployeeFacadeLocal
        Employee emp = efl.youngestEmployee();

        // Set the youngest employee as a request attribute for further processing in the JSP page
        request.setAttribute("emp", emp);

        // Forward the request to the "displayYoungEmp.jsp" page for rendering the outcome
        RequestDispatcher disp = request.getRequestDispatcher("displayYoungEmp.jsp");
        disp.forward(request, response);

    }

}
