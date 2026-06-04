<%-- 
    Document   : processCurrency
    Created on : 21 Apr 2026, 2:51:15 pm
    Author     : User
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
    // Define constant exchange rates
    final double USD = 0.25;
    final double EURO = 0.21;
    final double JPY = 40;
    final double SGD = 0.32;

    // Method to calculate conversion
    private double calculateRate(String currency, int amount) {
        double currencyChange = 0.0;

        if (currency != null) {
            if (currency.equals("1")) {
                currencyChange = amount * USD;
            } else if (currency.equals("2")) {
                currencyChange = amount * EURO;
            } else if (currency.equals("3")) {
                currencyChange = amount * JPY;
            } else {
                currencyChange = amount * SGD;
            }
        }
        return currencyChange;
    }
%>

<%
    // Retrieve input values
    // Using "currency" to match the name attribute in the HTML form's <select>
    String currencyType = request.getParameter("currency");
    String amountRaw = request.getParameter("amount");

    int amount = 0;
    double total = 0;

    try {
        if (amountRaw != null) {
            amount = Integer.parseInt(amountRaw);
            total = calculateRate(currencyType, amount);
        }
    } catch (Exception e) {
        amount = 0;
    }

    // Determine currency name for display
    String currencyName = "N/A";
    if ("1".equals(currencyType))
        currencyName = "USD";
    else if ("2".equals(currencyType))
        currencyName = "EURO";
    else if ("3".equals(currencyType))
        currencyName = "JPY";
    else if ("4".equals(currencyType))
        currencyName = "SGD";
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Currency Conversion Result</title>
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

            .header-container {
                display: flex;
                align-items: center;
                margin-bottom: 20px;
            }

            .purple-bar {
                width: 4px;
                height: 40px;
                background-color: #8e44ad;
                margin-right: 15px;
            }

            .header-text h3 {
                margin: 0;
                font-size: 15px;
                color: #333;
                line-height: 1.4;
            }

            .card {
                background-color: #ffffff;
                border-radius: 8px;
                padding: 30px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
                width: 80%;
                max-width: 400px;
            }

            .card h2 {
                color: #8e44ad;
                margin-top: 0;
                margin-bottom: 25px;
                font-size: 18px;
                font-weight: bold;
            }

            .result-group {
                margin-bottom: 20px;
            }

            .result-group label {
                display: block;
                font-weight: bold;
                color: #555;
                font-size: 13px;
                margin-bottom: 5px;
            }

            .result-group p {
                margin: 0;
                font-size: 15px;
                color: #111;
            }

            .btn-back {
                margin-top: 20px;
                padding: 8px 20px;
                border: 1px solid #ccc;
                background-color: #f4f4f4;
                border-radius: 4px;
                cursor: pointer;
                font-size: 12px;
                color: #333;
                font-weight: bold;
            }

            .btn-back:hover {
                background-color: #e0e0e0;
            }
        </style>
    </head>
    <body>

        <div class="container">
            <div class="header-container">
                <div class="purple-bar"></div>
                <div class="header-text">
                    <h3>Use JSP Declaration Tag, JSP Scriptlet and JSP<br>Expression in Application</h3>
                </div>
            </div>

            <div class="card">
                <h2>Conversion Result</h2>

                <div class="result-group">
                    <label>Amount in Ringgit Malaysia (RM):</label>
                    <p>RM <%= amount%></p>
                </div>

                <div class="result-group">
                    <label>Converted to (<%= currencyName%>):</label>
                    <p><%= String.format("%.2f", total)%></p>
                </div>

                <button class="btn-back" onclick="window.location.href='currencyConversion.html'">Back</button>
            </div>
        </div>

    </body>
</html>
