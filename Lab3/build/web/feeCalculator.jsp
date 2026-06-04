<%-- 
    Document   : feeCalculator
    Created on : 14 Apr 2026, 3:56:31 pm
    Author     : User
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Fee Calculator</title>
</head>
<body style="font-family: sans-serif; margin: 0; background-color: #f9f9f9;">

    <%@ include file="header.jsp" %>

    <div style="padding: 30px; max-width: 600px; margin: auto;">
        <h2>Membership Fee Calculator</h2>
        
        <form action="feeCalculator.jsp" method="POST" style="margin-bottom: 20px;">
            <label for="activities">Enter the number of activities joined: </label>
            <input type="number" id="activities" name="numActivities" min="1" required>
            <input type="submit" value="Calculate">
        </form>

        <%
            String activitiesStr = request.getParameter("numActivities");
            
            if (activitiesStr != null && !activitiesStr.isEmpty()) {
                try {
                    int numActivities = Integer.parseInt(activitiesStr);
                    double ratePerActivity = 8.00;
                    double totalFee = numActivities * ratePerActivity;
        %>
                    <fieldset style="width: fit-content; border: 1px solid blue; background-color: white;">
                        <legend style="color: blue; font-weight: bold;">Calculation Result</legend>
                        <p>Number of Activities: <strong><%= numActivities %></strong></p>
                        <p>Rate per Activity: <strong>RM 8.00</strong></p>
                        <hr>
                        <h3 style="margin-bottom: 0;">Total Fee Payable: RM <%= String.format("%.2f", totalFee) %></h3>
                    </fieldset>
        <%
                } catch (NumberFormatException e) {
                    out.println("<p style='color:red;'>Invalid input. Please enter a valid number.</p>");
                }
            }
        %>
    </div>

    <%@ include file="footer.jsp" %>

</body>
</html>