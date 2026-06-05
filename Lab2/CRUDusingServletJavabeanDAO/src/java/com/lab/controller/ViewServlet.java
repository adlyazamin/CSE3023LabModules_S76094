package com.lab.controller;

import com.lab.dao.UserDAO;
import com.lab.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.List;

public class ViewServlet extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        // Initialize the UserDAO
        userDAO = new UserDAO();
    }

    // Handle the HTTP GET method
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            // Retrieve all users using the UserDAO
            List<User> listUser = userDAO.selectAllUsers();

            out.println("<h2>User List (Using DAO)</h2>");
            out.println("<table border='1'><tr><th>Username</th><th>Password</th><th>Roles</th><th>Actions</th></tr>");

            // Iterate through the list of users and display them in the table
            for (User user : listUser) {
                out.println("<tr>");
                out.println("<td>" + user.getUsername() + "</td>");
                out.println("<td>" + user.getPassword() + "</td>");
                out.println("<td>" + user.getRoles() + "</td>");
                out.println("<td>");
                out.println("<a href='UpdateServlet?id=" + user.getId() + "'>Edit</a>");
                out.println(" | ");
                out.println("<a href='DeleteServlet?id=" + user.getId() + "'>Delete</a>");
                out.println("</td>");
                out.println("</tr>");
            }

            out.println("</table>");
            out.println("<br><a href='index.html'>Add New User</a>");

        } catch (Exception e) {
            e.printStackTrace();
            out.println("Error: " + e.getMessage()); // Output error if something goes wrong
        }
    }

    @Override
    public String getServletInfo() {
        return "ViewServlet displays the list of users from the database using DAO.";
    }
}