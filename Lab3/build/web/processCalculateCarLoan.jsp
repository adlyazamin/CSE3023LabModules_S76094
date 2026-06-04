<%-- 
    Document   : processCalculateCarLoan
    Created on : 14 Apr 2026, 3:25:55 pm
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Car Loan Calculation Result</title>
    </head>
    <body>

        <h2>Perform Car Loan Calculation</h2>

        <div style="border: 1px solid #a9a9a9; padding: 15px; width: fit-content; min-width: 500px;">
            <h3 style="color: blue;">Details of car loan:</h3>

            <%
                String amountStr = request.getParameter("amount");
                String periodStr = request.getParameter("period");

                if (amountStr != null && periodStr != null && !amountStr.isEmpty()) {
                    double principal = Double.parseDouble(amountStr);
                    int years = Integer.parseInt(periodStr);

                    double interestRate = 0.045;

                    double totalInterest = principal * interestRate * years;
                    double totalPayable = principal + totalInterest;
            %>
            <p>Loan Request: <%= principal%></p>
            <p>Period of payment: <%= years%></p>
            <p>Total Loan (+ interest): <%= totalPayable%></p>
            <%
                }
            %>
        </div>

        <br>
        <p>&copy;2026-Adly Azamin</p>

    </body>
</html>