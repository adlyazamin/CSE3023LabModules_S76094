<%-- 
    Document   : bmiCalculator
    Created on : 21 Apr 2026, 3:41:57 pm
    Author     : User
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h2>Calculate Your BMI</h2>

<form action="processBMI.jsp" method="POST">
    <div class="form-group">
        <label for="weight">Weight (kg)</label>
        <input type="number" id="weight" name="weight" class="form-control" step="any" min="1" required placeholder="Enter weight in kg">
    </div>

    <div class="form-group">
        <label for="height">Height (m)</label>
        <input type="number" id="height" name="height" class="form-control" step="any" min="0.01" required placeholder="Enter height in meters">
    </div>

    <button type="submit" class="btn">Calculate</button>
    <button type="reset" class="btn" style="background-color: #ccc; color: #333;">Clear</button>
</form>

<%@ include file="footer.jsp" %>
