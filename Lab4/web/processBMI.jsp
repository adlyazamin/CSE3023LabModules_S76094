<%-- 
    Document   : processBMI
    Created on : 21 Apr 2026, 3:42:17 pm
    Author     : User
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String weightStr = request.getParameter("weight");
    String heightStr = request.getParameter("height");

    double weight = 0;
    double height = 0;
    double bmi = 0;
    String category = "";
    boolean isValid = true;
    String errorMsg = "";

    try {
        weight = Double.parseDouble(weightStr);
        height = Double.parseDouble(heightStr);

        if (height <= 0) {
            isValid = false;
            errorMsg = "Height must be greater than zero.";
        } else {
            bmi = weight / (height * height);

            if (bmi < 18.5) {
                category = "Underweight";
            } else if (bmi >= 18.5 && bmi <= 25) {
                category = "Normal";
            } else {
                category = "Overweight";
            }
        }
    } catch (Exception e) {
        isValid = false;
        errorMsg = "Invalid numeric input. Please check your values.";
    }
%>

<% if (isValid) {%>
<jsp:forward page="resultBMI.jsp">
    <jsp:param name="bmiValue" value="<%= String.valueOf(bmi)%>" />
    <jsp:param name="bmiCategory" value="<%= category%>" />
</jsp:forward>
<% } else {%>
<%@ include file="header.jsp" %>
<h2 style="color: #e74c3c;">Input Error</h2>
<p style="color: #333;"><%= errorMsg%></p>
<button class="btn" onclick="window.history.back();">Go Back</button>
<%@ include file="footer.jsp" %>
<% }%>
