<%-- 
    Document   : processCustomer
    Created on : 21 Apr 2026, 2:26:09 pm
    Author     : User
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.DecimalFormat" %>

<%
    // Fixed price
    final double price = 10.0;

    // Retrieve form data
    String cust_no = request.getParameter("customerCode");
    String cust_type = request.getParameter("customerType");
    int quantity = 0;

    try {
        quantity = Integer.parseInt(request.getParameter("quantity"));
    } catch (Exception e) {
        quantity = 0;
    }

    // Handle potential nulls to prevent errors if page is loaded without form submission
    if (cust_no == null) {
        cust_no = "";
    }
    if (cust_type == null) {
        cust_type = "1";
    }

    // Business logic
    double total = 0;
    String message = "";

    if (cust_type.equals("1") && quantity > 100) {
        message = "You're entitled to 10% discount";
        total = quantity * price * 0.9;
    } else if (cust_type.equals("2") && quantity > 100) {
        message = "You're entitled to 25% discount";
        total = quantity * price * 0.75;
    } else {
        message = "You're not entitled to any discount";
        total = quantity * price;
    }

    // Display customer type
    String custTypeDisplay = cust_type.equals("1") ? "Normal Customer" : "Privilege Customer";

    // Formatter for currency
    DecimalFormat df = new DecimalFormat("0.00");
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Customer Discount Result</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f6f8;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
            }

            .container {
                width: 100%;
                max-width: 600px;
            }

            .header-title {
                display: flex;
                align-items: center;
                margin-bottom: 20px;
            }

            .purple-bar {
                width: 4px;
                height: 20px;
                background-color: #8e44ad;
                margin-right: 10px;
            }

            .header-title h3 {
                margin: 0;
                font-size: 16px;
                color: #333;
            }

            .card {
                background-color: #ffffff;
                border-radius: 8px;
                padding: 30px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
            }

            .card h2 {
                color: #8e44ad;
                margin-top: 0;
                margin-bottom: 25px;
                font-size: 20px;
                font-weight: bold;
            }

            .result-item {
                margin-bottom: 20px;
            }

            .result-item h4 {
                margin: 0 0 8px 0;
                font-size: 13px;
                color: #111;
                font-weight: bold;
            }

            .result-item p {
                margin: 0;
                font-size: 13px;
                color: #333;
            }

            .btn-back {
                margin-top: 10px;
                padding: 6px 15px;
                border: 1px solid #ccc;
                background-color: #f4f4f4;
                border-radius: 4px;
                cursor: pointer;
                font-size: 12px;
                color: #333;
            }

            .btn-back:hover {
                background-color: #e0e0e0;
            }
        </style>
    </head>
    <body>

        <div class="container">
            <div class="header-title">
                <div class="purple-bar"></div>
                <h3>Customer Discount Result</h3>
            </div>

            <div class="card">
                <h2>Transaction Summary</h2>

                <div class="result-item">
                    <h4>Customer Code:</h4>
                    <p><%= cust_no%></p>
                </div>

                <div class="result-item">
                    <h4>Quantity:</h4>
                    <p><%= quantity%></p>
                </div>

                <div class="result-item">
                    <h4>Customer Type:</h4>
                    <p><%= custTypeDisplay%></p>
                </div>

                <div class="result-item">
                    <h4>Status:</h4>
                    <p><%= message%></p>
                </div>

                <div class="result-item">
                    <h4>Total Amount:</h4>
                    <p>RM <%= df.format(total)%></p>
                </div>

                <button class="btn-back" onclick="window.location.href='customer.html'">Back</button>
            </div>
        </div>

    </body>
</html>