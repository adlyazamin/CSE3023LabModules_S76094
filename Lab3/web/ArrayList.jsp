<%-- 
    Document   : ArrayList
    Created on : 14 Apr 2026, 3:41:26 pm
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Use Java ArrayList</title>
    </head>
    <body>
        <h1>Use JSP Page Directive</h1>
        <%
            ArrayList<String> studentList = new ArrayList<>();
            
            studentList.add(0, "Mohamad Azam");
            studentList.add(1, "Peter Chong");
            studentList.add(2, "Rahimah Mansor");
            studentList.add(3, "Sri Devi");
            studentList.add(4, "Ng Hue Ween");
            studentList.add(5, "S. Nagarajan");

            out.println("<p>The number of records in Arraylist is " +
            studentList.size() + "</p>");

            for (int i=0; i<studentList.size(); i++)
            out.println("<p>Record " + (i+1) + " is " +
            studentList.get(i) + "</p>");
        %>
        <br>
        <footer>&copy;2026-Adly Azamin</footer>
    </body>
</html>

