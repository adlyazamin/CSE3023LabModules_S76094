package com.lab.controller;

import com.lab.bean.Employee;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// You can map your servlet using this annotation or in web.xml
@WebServlet("/PayrollServlet")
public class PayrollServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Create an ArrayList to hold Employee objects
        List<Employee> list = new ArrayList<>();

        // Populate the list with 5 different Employee objects
        Employee emp1 = new Employee();
        emp1.setEmpId("E01");
        emp1.setName("Kishor");
        emp1.setDepartment("IT");
        emp1.setBasicSalary(4500.0);
        list.add(emp1);

        Employee emp2 = new Employee();
        emp2.setEmpId("E02");
        emp2.setName("Syamil");
        emp2.setDepartment("HR");
        emp2.setBasicSalary(2800.0);
        list.add(emp2);

        Employee emp3 = new Employee();
        emp3.setEmpId("E03");
        emp3.setName("Charlie Kirk");
        emp3.setDepartment("Finance");
        emp3.setBasicSalary(3500.0);
        list.add(emp3);

        Employee emp4 = new Employee();
        emp4.setEmpId("E04");
        emp4.setName("Iqbal");
        emp4.setDepartment("Marketing");
        emp4.setBasicSalary(2900.0);
        list.add(emp4);

        Employee emp5 = new Employee();
        emp5.setEmpId("E05");
        emp5.setName("Joseph");
        emp5.setDepartment("Security");
        emp5.setBasicSalary(5200.0);
        list.add(emp5);

        // Share this list to the JSP
        request.setAttribute("employeeList", list);

        // Forward the request to the view file
        request.getRequestDispatcher("payroll_view.jsp").forward(request, response);
    }
}