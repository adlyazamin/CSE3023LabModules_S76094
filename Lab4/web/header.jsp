<%-- 
    Document   : header
    Created on : 21 Apr 2026, 3:36:22 pm
    Author     : User
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Healthy Lifestyle Awareness Program</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f6f8;
                margin: 0;
                padding: 0;
            }
            .navbar {
                background-color: #8e44ad;
                overflow: hidden;
                padding: 10px 20px;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            }
            .navbar a {
                float: left;
                color: white;
                text-align: center;
                padding: 12px 16px;
                text-decoration: none;
                font-weight: bold;
                font-size: 14px;
            }
            .navbar a:hover {
                background-color: #732d91;
                border-radius: 4px;
            }
            .container {
                max-width: 600px;
                margin: 40px auto;
                background: white;
                padding: 30px;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0,0,0,0.05);
            }
            h2 {
                color: #8e44ad;
                margin-top: 0;
                border-bottom: 2px solid #f4f6f8;
                padding-bottom: 10px;
            }
            .form-group {
                margin-bottom: 15px;
            }
            .form-group label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
                color: #333;
                font-size: 14px;
            }
            .form-control {
                width: 100%;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 4px;
                box-sizing: border-box;
            }
            .btn {
                padding: 10px 20px;
                background-color: #8e44ad;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-weight: bold;
            }
            .btn:hover {
                background-color: #732d91;
            }
        </style>
    </head>
    <body>
        <div class="navbar">
            <a href="bmiCalculator.jsp">BMI Calculator</a>
            <a href="healthInfo.jsp">Health Information</a>
        </div>
        <div class="container">
