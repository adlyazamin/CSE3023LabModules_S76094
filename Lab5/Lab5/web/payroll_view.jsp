<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- Import the JSTL core taglib directive --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Employee Payroll Display System</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        table { border-collapse: collapse; width: 80%; }
        th, td { border: 1px solid #dddddd; padding: 12px; text-align: left; }
        th { background-color: #f2f2f2; }
    </style>
</head>
<body>

    <h2>Employee Payroll Information</h2>

    <table>
        <thead>
            <tr>
                <th>Employee ID</th>
                <th>Name</th>
                <th>Department</th>
                <th>Basic Salary (RM)</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <%-- Iterate through the employeeList --%>
            <c:forEach var="emp" items="${employeeList}">
                <tr>
                    <td>${emp.empId}</td>
                    <td>${emp.name}</td>
                    <td>${emp.department}</td>
                    <td>${emp.basicSalary}</td>
                    <td>
                        <%-- Logic Challenge: Determine Junior or Senior status --%>
                        <c:choose>
                            <c:when test="${emp.basicSalary >= 3000}">
                                Senior
                            </c:when>
                            <c:otherwise>
                                Junior
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

</body>
</html>