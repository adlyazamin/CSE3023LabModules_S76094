
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class UpdateServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/CSE3023", "root", "admin");

            String sql = "SELECT * FROM users WHERE id=?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(id));  // Set ID from URL
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                String username = rs.getString("username");
                String password = rs.getString("password");
                String roles = rs.getString("roles");

                out.println("<h2>Update User</h2>");
                out.println("<form action='UpdateServlet' method='POST'>");
                out.println("<input type='hidden' name='id' value='" + id + "'>");
                out.println("Username: <input type='text' name='username' value='" + username + "' required><br>");
                out.println("Password: <input type='text' name='password' value='" + password + "' required><br>");
                out.println("Role: <select name='roles'>");
                out.println("<option value='Admin' " + (roles.equals("Admin") ? "selected" : "") + ">Admin</option>");
                out.println("<option value='Staff' " + (roles.equals("Staff") ? "selected" : "") + ">Staff</option>");
                out.println("<option value='Student' " + (roles.equals("Student") ? "selected" : "") + ">Student</option>");
                out.println("</select><br>");
                out.println("<input type='submit' value='Update User'>");
                out.println("</form>");
            }

            rs.close();
            pstmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String roles = request.getParameter("roles");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/CSE3023", "root", "admin");

            String sql = "UPDATE users SET username=?, password=?, roles=? WHERE id=?";
            PreparedStatement pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, username);
            pstmt.setString(2, password);
            pstmt.setString(3, roles);
            pstmt.setInt(4, Integer.parseInt(id));

            int updatedRows = pstmt.executeUpdate();

            if (updatedRows > 0) {
                response.sendRedirect("ViewServlet");  // Redirect to ViewServlet after successful update
            } else {
                response.getWriter().println("<h3>Error: User could not be updated</h3>");
            }

            pstmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    }
}