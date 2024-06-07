package za.ac.tut.web;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import za.ac.tut.bl.EmployeeFacadeLocal;
import za.ac.tut.entities.Employee;

@MultipartConfig
public class AddEmployeeServlet extends HttpServlet {
     //injecting the EmployeeFacadeLocal to interact with the business logic

    @EJB
    private EmployeeFacadeLocal efl;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //retrieving the image from the request
        Part fileImg = request.getPart("image");

        //converting the input stream into byte array
        byte[] imagebytes = inputeStreamToByteArray(fileImg.getInputStream());

        //retrieving the form parameters
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String gender = request.getParameter("gender");
        Long id = Long.parseLong(request.getParameter("id"));
        Integer age = Integer.parseInt(request.getParameter("age"));
        String[] temp = request.getParameterValues("temperature");

        //creating list to stores temperatures and statuses
        List<Double> temperatures = new ArrayList<>();
        List<String> temperatureStatuses = new ArrayList<>();

        //parsing temeperatures and deterimining their statuses
        for (String temperature : temp) {
            temperatures.add(Double.parseDouble(temperature));
        }

        for (String temperature : temp) {
            double tempValue = Double.parseDouble(temperature);
           
            if (tempValue > 38) {
                temperatureStatuses.add("High");
            } else {
                temperatureStatuses.add("Acceptable");
            }
        }

        //creating an employee an object with the retrieved data
        Employee emp = createEmployee(imagebytes, name, surname, id, gender, temperatures, age, temperatureStatuses);
        efl.create(emp);

        //forwading the request to addOutcome.jsp
        RequestDispatcher disp = request.getRequestDispatcher("addOutcome.jsp");
        disp.forward(request, response);
    }

    //converting the input array into a byte array
    private byte[] inputeStreamToByteArray(InputStream inputStream) throws IOException {
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();

        int bytesRead;
        byte[] data = new byte[1024];

        while ((bytesRead = inputStream.read(data, 0, data.length)) != -1) {
            buffer.write(data, 0, bytesRead);
        }

        buffer.flush();
        return buffer.toByteArray();
    }

    //creating an object
    private Employee createEmployee(byte[] imagebytes, String name, String surname, Long id, String gender, List<Double> temperatures, Integer age, List<String> temperatureStatuses) {
        Employee e = new Employee();

        e.setAge(age);
        e.setGender(gender);
        e.setId(id);
        e.setImage(imagebytes);
        e.setName(name);
        e.setTemperatures(temperatures);
        e.setSurname(surname);
        e.setTemperatureStatuses(temperatureStatuses);

        return e;
    }

}
