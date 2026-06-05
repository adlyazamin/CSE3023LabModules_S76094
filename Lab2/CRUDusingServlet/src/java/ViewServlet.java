
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class ViewServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Set the content type for the response
        response.setContentType("text/html");

        // Get the PrintWriter to generate HTML output
        PrintWriter out = response.getWriter();

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection to the database
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/CSE3023", "root", "admin");

            // Create a Statement and execute the SQL query
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM users");

            // Generate the HTML content for the table
            out.println("<h2>User List</h2>");
            out.println("<table border='1'>");
            out.println("<tr><th>Username</th><th>Password</th><th>Roles</th><th>Actions</th></tr>");

            // Iterate over the ResultSet and display the users' data
            while (rs.next()) {
                String id = rs.getString("id");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String roles = rs.getString("roles");

                // Add each user's data to the table with Edit and Delete links
                out.println("<tr>");
                out.println("<td>" + username + "</td>");
                out.println("<td>" + password + "</td>");
                out.println("<td>" + roles + "</td>");
                out.println("<td>");
                out.println("<a href='UpdateServlet?id=" + id + "'>Edit</a> | ");
                out.println("<a href='DeleteServlet?id=" + id + "'>Delete</a>");
                out.println("</td>");
                out.println("</tr>");
            }

            // Close the table and HTML tags
            out.println("</table>");
            out.println("<br><a href='user.html'>Add New User</a>");

            // Close the resources
            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
            out.println("Error: " + e.getMessage());
        }
    }

    @Override
    public String getServletInfo() {
        return "ViewServlet displays a list of all users in the database";
    }
}