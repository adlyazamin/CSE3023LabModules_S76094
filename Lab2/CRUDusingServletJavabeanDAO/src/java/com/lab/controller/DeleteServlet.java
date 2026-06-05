package com.lab.controller;

import com.lab.dao.UserDAO;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class DeleteServlet extends HttpServlet {

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

        // Retrieve the user ID from the request
        String id = request.getParameter("id");

        try {
            // Use the UserDAO to delete the user
            boolean isDeleted = userDAO.deleteUser(Integer.parseInt(id)); // Pass the ID to deleteUser method

            // Check if deletion was successful and redirect accordingly
            if (isDeleted) {
                // Redirect to ViewServlet to show the updated list
                response.sendRedirect("ViewServlet");
            } else {
                // If not successful, show an error message
                response.getWriter().println("Error: Unable to delete user.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage()); // Output error if something goes wrong
        }
    }

    @Override
    public String getServletInfo() {
        return "DeleteServlet deletes a user from the database using DAO.";
    }
}