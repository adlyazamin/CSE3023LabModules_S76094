<%-- 
    Document   : forwardInfo
    Created on : 21 Apr 2026, 3:17:05 pm
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Retrieve the forwarded parameters
    String name = request.getParameter("uname");
    String email = request.getParameter("email");
    String nationality = request.getParameter("nationality");
    String background = request.getParameter("background");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Forwarded Info</title>
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
                height: 24px;
                background-color: #8e44ad;
                margin-right: 15px;
            }

            .header-text h3 {
                margin: 0;
                font-size: 18px;
                color: #333;
            }

            .card {
                background-color: #ffffff;
                border-radius: 8px;
                padding: 30px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
                width: 85%;
                max-width: 500px;
            }

            .card h2 {
                color: #8e44ad;
                margin-top: 0;
                margin-bottom: 20px;
                font-size: 18px;
                font-weight: normal;
            }

            .info-group {
                margin-bottom: 12px;
            }

            .info-group p {
                margin: 0;
                font-size: 13px;
                color: #222;
            }
        </style>
    </head>
    <body>

        <div class="container">
            <div class="header-container">
                <div class="purple-bar"></div>
                <div class="header-text">
                    <h3>Using jsp:forward to display user info</h3>
                </div>
            </div>

            <div class="card">
                <h2>Forwarded Info</h2>

                <div class="info-group">
                    <p>Name: <%= name%></p>
                </div>

                <div class="info-group">
                    <p>Email: <%= email%></p>
                </div>

                <div class="info-group">
                    <p>Nationality: <%= nationality%></p>
                </div>

                <div class="info-group">
                    <p>Background: <%= background%></p>
                </div>
            </div>
        </div>

    </body>
</html>
