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
public class CountAllEmpServlet extends HttpServlet {

    @EJB
    private EmployeeFacadeLocal efl;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve the total count of employees
        int cnt = efl.count();

        // Retrieve the count of female and male employees
        long cntF = efl.countFemaleEmp();
        long cntM = efl.countMaleEmp();

        // Convert long counts to int
        int cntf = (int) cntF;
        int cntm = (int) cntM;

        // Calculate the percentage of female and male employees
        double percentageF = ((double) cntf / cnt) * 100;
        double percentageM = ((double) cntm / cnt) * 100;

        // Set the calculated percentages as request attributes
        request.setAttribute("percentageF", percentageF);
        request.setAttribute("percentageM", percentageM);

        // Forward the request to the JSP page for further processing
        RequestDispatcher disp = request.getRequestDispatcher("countAllOutcome.jsp");
        disp.forward(request, response);
    }
}
