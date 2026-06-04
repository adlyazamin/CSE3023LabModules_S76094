<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Intercept coming from form post execution in login.html
    String loginInputMatric = request.getParameter("matric_no");
    if (loginInputMatric != null && !loginInputMatric.trim().isEmpty()) {
        session.setAttribute("matric_no", loginInputMatric.trim());
    }

    // Process explicitly triggered logout parameters 
    if (request.getParameter("logout") != null) {
        session.invalidate();
        response.sendRedirect("login.html");
        return;
    }

    // Verify session identity context access
    String matricNo = (String) session.getAttribute("matric_no");
    if (matricNo == null) {
        response.sendRedirect("login.html");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Portal Academic Dashboard</title>
    </head>
    <body style="font-family: Arial, sans-serif; margin: 40px;">
        <h2>Main Academic Control Dashboard</h2>
        <p>Logged-in Identity Context: <span style="color: green; font-weight: bold;"><%= matricNo%></span></p>
        <hr />

        <h3>Academic Modules Available</h3>
        <ul>
            <li style="margin: 12px 0;">
                <a href="${pageContext.request.contextPath}/SubjectServlet?action=view" style="font-size: 16px; color: blue; font-weight: bold;">
                    Open Subject Management System (Full CRUD Module)
                </a>
            </li>
        </ul>

        <br /><br /><br />
        <hr />
        <form action="dashboard.jsp" method="get">
            <input type="hidden" name="logout" value="true" />
            <input type="submit" value="Logout / Destroy Session" style="background-color: #ffe6e6; border: 1px solid red; padding: 5px 12px; cursor: pointer; color: red;" />
        </form>
    </body>
</html>