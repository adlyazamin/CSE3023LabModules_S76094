<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.lab.bean.SubjectBean" %>
<%
    if (session.getAttribute("matric_no") == null) {
        response.sendRedirect(request.getContextPath() + "/login.html");
        return;
    }
    SubjectBean subject = (SubjectBean) request.getAttribute("subject");
    if (subject == null) {
        response.sendRedirect(request.getContextPath() + "/SubjectServlet?action=view");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Edit Subject Details</title>
    </head>
    <body style="font-family: Arial, sans-serif; margin: 40px;">
        <h2>UPDATE (Kemaskini Maklumat Subjek)</h2>
        <hr />
        <form action="${pageContext.request.contextPath}/SubjectServlet?action=update" method="post">
            <input type="hidden" name="id" value="<%= subject.getId()%>" />

            <table border="1" cellpadding="8" cellspacing="0">
                <tr>
                    <td><strong>Subject Code:</strong></td>
                    <td><input type="text" name="subject_code" value="<%= subject.getSubjectCode()%>" required /></td>
                </tr>
                <tr>
                    <td><strong>Subject Name:</strong></td>
                    <td><input type="text" name="subject_name" value="<%= subject.getSubjectName()%>" size="40" required /></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="Update Record" />
                        <input type="button" value="Cancel" onclick="window.location.href = '${pageContext.request.contextPath}/SubjectServlet?action=view';" />
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>