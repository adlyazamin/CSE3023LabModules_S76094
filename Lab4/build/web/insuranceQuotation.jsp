<%-- 
    Document   : insuranceQuotation
    Created on : 21 Apr 2026, 3:23:59 pm
    Author     : User
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Insurance Quotation</title>
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

            .card fieldset {
                border: 1px solid #ddd;
                border-radius: 4px;
                padding: 20px;
                margin: 0;
            }

            .card legend {
                color: #666;
                font-size: 14px;
                padding: 0 5px;
            }

            .form-group {
                margin-bottom: 15px;
            }

            .form-group label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
                color: #333;
                font-size: 12px;
            }

            .form-control {
                width: 100%;
                padding: 8px;
                border: 1px solid #ddd;
                border-radius: 4px;
                box-sizing: border-box;
                font-size: 13px;
            }

            .form-control::placeholder {
                color: #bbb;
            }

            .button-group {
                margin-top: 20px;
                display: flex;
                gap: 10px;
            }

            .btn {
                padding: 6px 15px;
                border: 1px solid #ccc;
                border-radius: 4px;
                cursor: pointer;
                font-size: 12px;
                color: #333;
                background-color: #eee;
            }

            .btn:hover {
                background-color: #ddd;
            }
        </style>
    </head>
    <body>

        <div class="container">
            <div class="header-title">
                <div class="purple-bar"></div>
                <h3>Insurance Quotation</h3>
            </div>

            <div class="card">
                <form action="processInsuranceQuo.jsp" method="POST">
                    <fieldset>
                        <legend>Insurance Calculation</legend>

                        <div class="form-group">
                            <label for="icno">IC No*</label>
                            <input type="text" id="icno" name="icno" class="form-control" placeholder="E.g. 821210-05-3478" required>
                        </div>

                        <div class="form-group">
                            <label for="name">Name*</label>
                            <input type="text" id="name" name="name" class="form-control" placeholder="Enter name" required>
                        </div>

                        <div class="form-group">
                            <label for="price">Market Price*</label>
                            <input type="number" id="price" name="price" class="form-control" placeholder="Price" step="0.01" min="0" required>
                        </div>

                        <div class="form-group">
                            <label for="coverage">Coverage Type</label>
                            <select id="coverage" name="coverage" class="form-control">
                                <option value="thirdParty">Third Party</option>
                                <option value="comprehensive">Comprehensive</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="ncd">No Claims Discount (NCD)</label>
                            <select id="ncd" name="ncd" class="form-control">
                                <option value="0">0%</option>
                                <option value="0.10">10%</option>
                                <option value="0.25">25%</option>
                                <option value="0.30">30%</option>
                                <option value="0.45">45%</option>
                                <option value="0.55">55%</option>
                            </select>
                        </div>

                        <div class="button-group">
                            <button type="submit" class="btn">Submit</button>
                            <button type="reset" class="btn">Cancel</button>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>

    </body>
</html>
