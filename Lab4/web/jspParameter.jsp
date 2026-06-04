<%-- 
    Document   : jspParameter
    Created on : 21 Apr 2026, 2:57:29 pm
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Using Standard Action</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f6f8;
                display: flex;
                justify-content: center;
                align-items: flex-start;
                padding-top: 80px;
                height: 100vh;
                margin: 0;
                box-sizing: border-box;
            }

            .container {
                width: 100%;
                max-width: 600px;
            }

            .header-container {
                display: flex;
                align-items: center;
                margin-bottom: 20px;
            }

            .purple-bar {
                width: 4px;
                height: 40px;
                background-color: #8e44ad;
                margin-right: 15px;
            }

            .header-text h3 {
                margin: 0;
                font-size: 16px;
                color: #333;
                line-height: 1.4;
            }

            .card {
                background-color: #ffffff;
                border-radius: 8px;
                padding: 30px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
                width: 85%;
                max-width: 500px;
            }
        </style>
    </head>
    <body>

        <div class="container">
            <div class="header-container">
                <div class="purple-bar"></div>
                <div class="header-text">
                    <h3>Using jsp:include and jsp:param to display<br>information on JSP Page</h3>
                </div>
            </div>

            <div class="card">
                <%
                    String sCode = "CSE3023";
                    String sSubject = "Web-based Application Development";
                    String sCredit = "3(2+1)";
                %>

                <jsp:include page="subjectInfo.jsp" flush="true">
                    <jsp:param name="code" value="<%= sCode%>" />
                    <jsp:param name="subject" value="<%= sSubject%>" />
                    <jsp:param name="credit" value="<%= sCredit%>" />
                </jsp:include>
            </div>
        </div>
    </body>
</html>
