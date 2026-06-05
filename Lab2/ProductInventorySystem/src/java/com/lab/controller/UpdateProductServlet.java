package com.lab.controller;

import com.lab.dao.ProductDAO;
import com.lab.model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "UpdateProductServlet", urlPatterns = {"/UpdateProductServlet"})
public class UpdateProductServlet extends HttpServlet {

    private ProductDAO productDAO;

    @Override
    public void init() throws ServletException {
        productDAO = new ProductDAO();
    }

    // GET: Display form with existing product data
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Get existing product from DAO (NO JDBC here!)
        Product existingProduct = productDAO.selectProduct(id);

        if (existingProduct != null) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head><title>Update Product</title>");
            out.println("<style>");
            out.println("body { font-family: Arial, sans-serif; margin: 50px; }");
            out.println("form { width: 300px; padding: 20px; border: 1px solid #ccc; border-radius: 5px; }");
            out.println("label { display: inline-block; width: 80px; }");
            out.println("input, select { margin-bottom: 10px; padding: 5px; width: 180px; }");
            out.println("input[type='submit'] { width: 100px; background-color: #2196F3; color: white; border: none; cursor: pointer; }");
            out.println("</style>");
            out.println("</head>");
            out.println("<body>");

            out.println("<h2>Update Product</h2>");
            out.println("<form action='UpdateProductServlet' method='POST'>");
            out.println("<input type='hidden' name='id' value='" + existingProduct.getId() + "'>");
            out.println("<label for='name'>Name:</label>");
            out.println("<input type='text' id='name' name='name' value='" + existingProduct.getName() + "' required><br>");
            out.println("<label for='category'>Category:</label>");
            out.println("<select id='category' name='category'>");

            String currentCategory = existingProduct.getCategory();
            out.println("<option value='Electronics' " + (currentCategory.equals("Electronics") ? "selected" : "") + ">Electronics</option>");
            out.println("<option value='Stationery' " + (currentCategory.equals("Stationery") ? "selected" : "") + ">Stationery</option>");
            out.println("<option value='Furniture' " + (currentCategory.equals("Furniture") ? "selected" : "") + ">Furniture</option>");
            out.println("<option value='Clothing' " + (currentCategory.equals("Clothing") ? "selected" : "") + ">Clothing</option>");

            out.println("</select><br>");
            out.println("<label for='price'>Price (RM):</label>");
            out.println("<input type='number' id='price' name='price' step='0.01' value='" + existingProduct.getPrice() + "' required><br>");
            out.println("<label for='quantity'>Quantity:</label>");
            out.println("<input type='number' id='quantity' name='quantity' value='" + existingProduct.getQuantity() + "' required><br><br>");
            out.println("<input type='submit' value='Update Product'>");
            out.println("</form>");
            out.println("<br><a href='ViewProductServlet'>Cancel</a>");
            out.println("</body>");
            out.println("</html>");
        } else {
            out.println("<h3>Product not found!</h3>");
            out.println("<a href='ViewProductServlet'>Back to List</a>");
        }
    }

    // POST: Process the update
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        // Create Product object (NO JDBC here!)
        Product product = new Product(id, name, category, price, quantity);

        // Call DAO method
        boolean isUpdated = productDAO.updateProduct(product);

        if (isUpdated) {
            response.sendRedirect("ViewProductServlet");
        } else {
            response.getWriter().println("<h3>Error: Failed to update product</h3>");
        }
    }
}