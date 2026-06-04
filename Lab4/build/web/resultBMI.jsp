<%-- 
    Document   : resultBMI
    Created on : 21 Apr 2026, 3:42:42 pm
    Author     : User
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ include file="header.jsp" %>

<h2>BMI Result</h2>

<%
    String bmiParam = request.getParameter("bmiValue");
    String categoryParam = request.getParameter("bmiCategory");

    double calculatedBmi = 0;
    if (bmiParam != null) {
        calculatedBmi = Double.parseDouble(bmiParam);
    }

    DecimalFormat df = new DecimalFormat("0.00");
%>

<div style="background-color: #f9f9f9; padding: 20px; border-radius: 6px; border-left: 5px solid #8e44ad; margin-bottom: 25px;">
    <p style="font-size: 16px; color: #333;">
        <strong>Your Calculated BMI:</strong> <%= df.format(calculatedBmi)%>
    </p>
    <p style="font-size: 16px; color: #333;">
        <strong>Health Category:</strong> <%= categoryParam%>
    </p>
</div>

<a href="bmiCalculator.jsp" style="text-decoration: none; padding: 10px 20px; background-color: #eee; color: #333; border-radius: 4px; font-weight: bold; border: 1px solid #ccc;">Back</a>

<%@ include file="footer.jsp" %>
