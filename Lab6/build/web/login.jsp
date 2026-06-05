<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>System Login</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 40px;
            }
            fieldset {
                max-width: 300px;
                padding: 20px;
            }
            input {
                width: 100%;
                margin-bottom: 10px;
            }
            .error {
                color: red;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <fieldset>
            <legend><h2>Login</h2></legend>

            <%
                String msg = request.getParameter("msg");
                if (msg != null) {
            %>
            <p class="error"><%= msg%></p>
            <%
                }
            %>

            <form action="doLogin.jsp" method="POST">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>

                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>

                <button type="submit">Login</button>
            </form>
        </fieldset>
    </body>
</html>