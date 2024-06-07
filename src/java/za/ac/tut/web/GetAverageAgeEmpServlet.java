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

/**
 *
 * @author Jeanette
 */
public class GetAverageAgeEmpServlet extends HttpServlet {

    @EJB
    private EmployeeFacadeLocal efl;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

      // Retrieve the average age of male employees using the maleAvg() method of EmployeeFacadeLocal
        Double cnt = efl.maleAvg();

// Set the average age of male employees as a request attribute for further processing in the JSP page
        request.setAttribute("cnt", cnt);

// Forward the request to the "countMOutcome.jsp" page for rendering the outcome
        RequestDispatcher disp = request.getRequestDispatcher("countMOutcome.jsp");
        disp.forward(request, response);

    }

}
