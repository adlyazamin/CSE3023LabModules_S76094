<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String usernameInput = request.getParameter("username");
    String passwordInput = request.getParameter("password");

    // Update with your actual database credentials
    String dbURL = "jdbc:mysql://localhost:3306/csa3023";
    String dbUser = "root";
    String dbPass = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        String sql = "SELECT firstname, lastname FROM userprofile WHERE username = ? AND password = ?";

        try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, usernameInput);
            pstmt.setString(2, passwordInput);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    // Successful login
                    session.setAttribute("username", usernameInput);
                    session.setAttribute("firstname", rs.getString("firstname"));
                    session.setAttribute("lastname", rs.getString("lastname"));
                    response.sendRedirect("main.jsp");
                } else {
                    // Failed login
                    response.sendRedirect("login.jsp?msg=Invalid username or password..!");
                }
            }
        }
    } catch (Exception e) {
        out.println("<h3 style='color:red;'>Database Error: " + e.getMessage() + "</h3>");
    }
%>