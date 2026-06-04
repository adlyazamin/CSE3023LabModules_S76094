<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("matric_no") == null) {
        response.sendRedirect(request.getContextPath() + "/login.html");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Register Subject Form</title>
    </head>
    <body style="font-family: Arial, sans-serif; margin: 40px;">
        <h2>CREATE (Daftar Subjek Baru)</h2>
        <hr />
        <form action="${pageContext.request.contextPath}/SubjectServlet?action=add" method="post">
            <table border="1" cellpadding="8" cellspacing="0">
                <tr>
                    <td><strong>Subject Code:</strong></td>
                    <td><input type="text" name="subject_code" placeholder="e.g. BIT2093" required /></td>
                </tr>
                <tr>
                    <td><strong>Subject Name:</strong></td>
                    <td><input type="text" name="subject_name" placeholder="e.g. Web Development" size="40" required /></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="Register Subject" />
                        <input type="button" value="Cancel" onclick="window.location.href = '${pageContext.request.contextPath}/SubjectServlet?action=view';" />
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>