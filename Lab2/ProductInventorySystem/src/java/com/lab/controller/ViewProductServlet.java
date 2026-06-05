package com.lab.controller;

import com.lab.dao.ProductDAO;
import com.lab.model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ViewProductServlet", urlPatterns = {"/ViewProductServlet"})
public class ViewProductServlet extends HttpServlet {

    private ProductDAO productDAO;

    @Override
    public void init() throws ServletException {
        productDAO = new ProductDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        List<Product> productList = productDAO.selectAllProducts();

        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head><title>Product Inventory</title>");
        out.println("<style>");
        out.println("body { font-family: Arial, sans-serif; margin: 20px; }");
        out.println("table { border-collapse: collapse; width: 80%; }");
        out.println("th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }");
        out.println("th { background-color: #4CAF50; color: white; }");
        out.println("tr:nth-child(even) { background-color: #f2f2f2; }");
        out.println("a { text-decoration: none; padding: 4px 8px; border-radius: 3px; }");
        out.println(".edit { background-color: #2196F3; color: white; }");
        out.println(".delete { background-color: #f44336; color: white; }");
        out.println(".add { background-color: #4CAF50; color: white; padding: 8px 12px; }");
        out.println("</style>");
        out.println("</head>");
        out.println("<body>");

        out.println("<h2>Product Inventory List</h2>");

        out.println("<table>");
        out.println("<tr>");
        out.println("<th>ID</th>");
        out.println("<th>Name</th>");
        out.println("<th>Category</th>");
        out.println("<th>Price (RM)</th>");
        out.println("<th>Quantity</th>");
        out.println("<th>Actions</th>");
        out.println("</tr>");

        for (Product product : productList) {
            out.println("<tr>");
            out.println("<td>" + product.getId() + "</td>");
            out.println("<td>" + product.getName() + "</td>");
            out.println("<td>" + product.getCategory() + "</td>");
            out.println("<td>" + String.format("%.2f", product.getPrice()) + "</td>");
            out.println("<td>" + product.getQuantity() + "</td>");
            out.println("<td>");
            out.println("<a href='UpdateProductServlet?id=" + product.getId() + "' class='edit'>Edit</a>");
            out.println(" ");
            out.println("<a href='DeleteProductServlet?id=" + product.getId() + "' class='delete' onclick='return confirm(\"Are you sure?\")'>Delete</a>");
            out.println("</td>");
            out.println("</tr>");
        }

        out.println("</table>");
        out.println("<br>");
        out.println("<a href='add_product.html' class='add'>+ Add New Product</a>");
        out.println("</body>");
        out.println("</html>");
    }
}
