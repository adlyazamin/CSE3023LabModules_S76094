package com.lab.controller;

import com.lab.dao.UserDAO;
import com.lab.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateServlet extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
    }

    // Show the update form (GET)
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            User existingUser = userDAO.selectUser(Integer.parseInt(id));

            if (existingUser != null) {
                out.println("<h2>Update User</h2>");
                out.println("<form action='UpdateServlet' method='POST'>");
                out.println("<input type='hidden' name='id' value='" + existingUser.getId() + "'>");
                out.println("Username: <input type='text' name='username' value='" + existingUser.getUsername() + "' required><br><br>");
                out.println("Password: <input type='text' name='password' value='" + existingUser.getPassword() + "' required><br><br>");
                out.println("Role: <select name='roles'>");
                out.println("<option value='Admin'   " + (existingUser.getRoles().equals("Admin")   ? "selected" : "") + ">Admin</option>");
                out.println("<option value='Staff'   " + (existingUser.getRoles().equals("Staff")   ? "selected" : "") + ">Staff</option>");
                out.println("<option value='Student' " + (existingUser.getRoles().equals("Student") ? "selected" : "") + ">Student</option>");
                out.println("</select><br><br>");
                out.println("<input type='submit' value='Update User'>");
                out.println("</form>");
            } else {
                out.println("<h3>User not found</h3>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    }

    // Process the update (POST)
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String roles = request.getParameter("roles");

        User user = new User(Integer.parseInt(id), username, password, roles);

        try {
            boolean isUpdated = userDAO.updateUser(user);
            if (isUpdated) {
                response.sendRedirect("ViewServlet");
            } else {
                response.getWriter().println("<h3>Error: User could not be updated</h3>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    }

    @Override
    public String getServletInfo() {
        return "UpdateServlet handles updating user information using DAO.";
    }
}