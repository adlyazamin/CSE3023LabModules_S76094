<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Prevent unauthorized access
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Main Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 40px;
            }
            table {
                border-collapse: collapse;
                width: 300px;
                margin-top: 20px;
            }
            th, td {
                border: 1px solid #ccc;
                padding: 10px;
                text-align: left;
            }
            th {
                background-color: #f4f4f4;
            }
        </style>
    </head>
    <body>
        <h2>Welcome to the System</h2>

        <table>
            <tr>
                <th>Username</th>
                <td><%= session.getAttribute("username")%></td>
            </tr>
            <tr>
                <th>First Name</th>
                <td><%= session.getAttribute("firstname")%></td>
            </tr>
            <tr>
                <th>Last Name</th>
                <td><%= session.getAttribute("lastname")%></td>
            </tr>
        </table>

        <br>
        <a href="login.jsp">Logout</a>
    </body>
</html>