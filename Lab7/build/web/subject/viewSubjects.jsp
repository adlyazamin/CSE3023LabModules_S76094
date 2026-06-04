<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.lab.bean.SubjectBean" %>
<%
    String matricNo = (String) session.getAttribute("matric_no");
    if (matricNo == null) {
        response.sendRedirect(request.getContextPath() + "/login.html");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Subject Inventory Listing</title>
    </head>
    <body style="font-family: Arial, sans-serif; margin: 40px;">
        <h2>READ (View Registered Subject Listing)</h2>
        <h3>Active Session Identity Context: <span style="color: blue;"><%= matricNo%></span></h3>

        <p>
            <a href="${pageContext.request.contextPath}/subject/registerSubject.jsp" style="font-weight: bold; color: green; text-decoration: none;">
                [+] Add/Register New Subject Record
            </a>
            &nbsp;|&nbsp;
            <a href="${pageContext.request.contextPath}/dashboard.jsp" style="text-decoration: none; color: gray;">
                Return to Main Dashboard
            </a>
        </p>

        <table border="1" cellpadding="10" cellspacing="0" width="80%">
            <thead>
                <tr style="background-color: #eaeaea; text-align: left;">
                    <th>ID No.</th>
                    <th>Subject Code</th>
                    <th>Subject Name Description</th>
                    <th>Operation Actions Management</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<SubjectBean> subjectList = (List<SubjectBean>) request.getAttribute("subjectList");
                    if (subjectList != null && !subjectList.isEmpty()) {
                        for (SubjectBean subject : subjectList) {
                %>
                <tr>
                    <td><%= subject.getId()%></td>
                    <td><strong><%= subject.getSubjectCode()%></strong></td>
                    <td><%= subject.getSubjectName()%></td>
                    <td>
                        <a href="${pageContext.request.contextPath}/SubjectServlet?action=editForm&id=<%= subject.getId()%>">Update</a>
                        &nbsp;|&nbsp;
                        <a href="${pageContext.request.contextPath}/SubjectServlet?action=delete&id=<%= subject.getId()%>" 
                           onclick="return confirm('Confirm operational erasure of this record?');" style="color: red;">
                            Delete
                        </a>
                    </td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="4" align="center" style="color: gray; font-style: italic;">
                        No academic records currently mapped to this matriculation account profile.
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </body>
</html>