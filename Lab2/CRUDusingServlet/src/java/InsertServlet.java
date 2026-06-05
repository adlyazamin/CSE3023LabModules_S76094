
import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class InsertServlet extends HttpServlet {

    // Handle the HTTP POST method
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Retrieve form data from the request
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String roles = request.getParameter("roles");

        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a database connection
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/CSE3023", "root", "admin"); // Update with your DB credentials

            // SQL query to insert data into the users table
            String sql = "INSERT INTO users (username, password, roles) VALUES (?, ?, ?)";
            
            // Create a PreparedStatement to execute the query
            PreparedStatement pstmt = conn.prepareStatement(sql);

            // Set the retrieved form values into the query parameters
            pstmt.setString(1, username); // Set the username
            pstmt.setString(2, password); // Set the password
            pstmt.setString(3, roles);    // Set the roles

            // Execute the statement using executeUpdate() method
            pstmt.executeUpdate();

            // Close the resources
            pstmt.close();
            conn.close();

            // Redirect to ViewServlet after successful insertion
            response.sendRedirect("ViewServlet"); // Redirect to ViewServlet to show the users

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage()); // Output error if something goes wrong
        }
    }

    @Override
    public String getServletInfo() {
        return "InsertServlet handles user data insertion into the MySQL database.";
    }
}