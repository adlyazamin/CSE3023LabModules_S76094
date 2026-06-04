<%-- 
    Document   : subjectInfo
    Created on : 21 Apr 2026, 3:02:08 pm
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Subject Information</title>
    </head>
    <body>
        <h1>Calling SubjectInfo.Jsp Page</h1>
        
        <p>Code: <%= request.getParameter("code") %></p>
        <p>Subject: <%= request.getParameter("subject") %></p>
        <p>Credit: <%= request.getParameter("credit") %></p>
    </body>
</html>
