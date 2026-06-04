<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.DecimalFormat" %>

<%
    // Retrieve form data
    String icno = request.getParameter("icno");
    String name = request.getParameter("name");
    String coverage = request.getParameter("coverage");
    String ncdStr = request.getParameter("ncd");

    double price = 0;
    double ncd = 0;

    try {
        price = Double.parseDouble(request.getParameter("price"));
        if (ncdStr != null) {
            ncd = Double.parseDouble(ncdStr);
        }
    } catch (Exception e) {
        price = 0;
        ncd = 0;
    }

    // Business Logic
    double rate = 0;
    String coverageDisplay = "";

    if ("comprehensive".equals(coverage)) {
        rate = 0.05; // 5%
        coverageDisplay = "Comprehensive";
    } else {
        rate = 0.03; // 3%
        coverageDisplay = "Third Party";
    }

    // Base insurance calculation
    double insurance = price * rate;

    // Apply NCD discount
    double discount = insurance * ncd;
    double afterNCD = insurance - discount;

    // Add 8% SST
    double sst = afterNCD * 0.08;
    double finalAmount = afterNCD + sst;

    // Formatter for displaying currency appropriately
    DecimalFormat df = new DecimalFormat("0.00");
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Insurance Quotation Result</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f6f8;
                display: flex;
                justify-content: center;
                align-items: flex-start; /* Align closer to the top */
                padding-top: 50px;
                height: 100vh;
                margin: 0;
                box-sizing: border-box;
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
                height: 24px;
                background-color: #8e44ad;
                margin-right: 10px;
            }

            .header-title h3 {
                margin: 0;
                font-size: 18px;
                color: #333;
            }

            .card {
                background-color: #ffffff;
                border-radius: 8px;
                padding: 30px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
                width: 85%;
                max-width: 500px;
            }

            .info-block {
                margin-bottom: 15px;
            }

            .info-label {
                font-weight: bold;
                font-size: 13px;
                color: #333;
                margin-bottom: 8px;
            }

            .info-value {
                font-size: 13px;
                color: #111;
            }

            .final-amount {
                font-weight: bold;
                font-size: 14px;
            }

            hr {
                border: 0;
                border-top: 1px solid #777;
                margin: 20px 0;
            }

            .btn-back {
                margin-top: 15px;
                padding: 8px 20px;
                border: 1px solid #ccc;
                background-color: #e8e8e8;
                border-radius: 4px;
                cursor: pointer;
                font-size: 12px;
                color: #000;
                font-weight: bold;
            }

            .btn-back:hover {
                background-color: #dcdcdc;
            }
        </style>
    </head>
    <body>

        <div class="container">
            <div class="header-title">
                <div class="purple-bar"></div>
                <h3>Insurance Quotation Result</h3>
            </div>

            <div class="card">

                <div class="info-block">
                    <div class="info-label">IC No:</div>
                    <div class="info-value"><%= icno%></div>
                </div>

                <div class="info-block">
                    <div class="info-label">Name:</div>
                    <div class="info-value"><%= name%></div>
                </div>

                <div class="info-block">
                    <div class="info-label">Market Price (RM):</div>
                    <div class="info-value"><%= df.format(price)%></div>
                </div>

                <div class="info-block">
                    <div class="info-label">Coverage Type:</div>
                    <div class="info-value"><%= coverageDisplay%></div>
                </div>

                <div class="info-block">
                    <div class="info-label">NCD:</div>
                    <div class="info-value"><%= (int) (ncd * 100)%>%</div>
                </div>

                <hr>

                <div class="info-block">
                    <div class="info-label">Base Insurance:</div>
                    <div class="info-value">RM <%= df.format(insurance)%></div>
                </div>

                <div class="info-block">
                    <div class="info-label">NCD Discount:</div>
                    <div class="info-value">RM <%= df.format(discount)%></div>
                </div>

                <div class="info-block">
                    <div class="info-label">After NCD:</div>
                    <div class="info-value">RM <%= df.format(afterNCD)%></div>
                </div>

                <div class="info-block">
                    <div class="info-label">SST (8%):</div>
                    <div class="info-value">RM <%= df.format(sst)%></div>
                </div>

                <div class="info-block">
                    <div class="info-label">Final Insurance Amount:</div>
                    <div class="info-value final-amount">RM <%= df.format(finalAmount)%></div>
                </div>

                <button class="btn-back" onclick="window.history.back();">Back</button>

            </div>
        </div>

    </body>
</html>