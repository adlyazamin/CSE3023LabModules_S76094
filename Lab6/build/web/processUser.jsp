<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String firstname = request.getParameter("firstname");
    String lastname = request.getParameter("lastname");

    // Update with your actual database credentials
    String dbURL = "jdbc:mysql://localhost:3306/csa3023";
    String dbUser = "root";
    String dbPass = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        String sql = "INSERT INTO userprofile (username, password, firstname, lastname) VALUES (?, ?, ?, ?)";

        // try-with-resources automatically closes the Connection and PreparedStatement
        try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, username);
            pstmt.setString(2, password);
            pstmt.setString(3, firstname);
            pstmt.setString(4, lastname);

            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                out.println("<h3>Registration successful!</h3>");
                out.println("<a href='login.jsp'>Click here to login</a>");
            } else {
                out.println("<h3>Registration failed.</h3>");
                out.println("<a href='insertUser.html'>Try again</a>");
            }
        }
    } catch (Exception e) {
        out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
    }
%>