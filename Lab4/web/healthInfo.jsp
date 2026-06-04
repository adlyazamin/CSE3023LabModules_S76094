<%-- 
    Document   : healthInfo
    Created on : 21 Apr 2026, 3:42:58 pm
    Author     : User
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ include file="header.jsp" %>

<h2>BMI Categories Information</h2>

<p style="color: #555; line-height: 1.5; margin-bottom: 20px;">
    Body Mass Index (BMI) is a simple index of weight-for-height that is commonly used to classify underweight, overweight, and obesity in adults.
</p>

<%
    ArrayList<String[]> bmiDataList = new ArrayList<String[]>();
    bmiDataList.add(new String[]{"BMI < 18.5", "Underweight"});
    bmiDataList.add(new String[]{"18.5 &le; BMI &le; 25", "Normal"});
    bmiDataList.add(new String[]{"BMI > 25", "Overweight"});
%>

<table style="width: 100%; border-collapse: collapse;">
    <thead>
        <tr style="background-color: #8e44ad; color: white;">
            <th style="padding: 12px; text-align: left; border: 1px solid #ddd;">BMI Range</th>
            <th style="padding: 12px; text-align: left; border: 1px solid #ddd;">Health Classification</th>
        </tr>
    </thead>
    <tbody>
        <% for (String[] rowData : bmiDataList) {%>
        <tr>
            <td style="padding: 12px; border: 1px solid #ddd;"><%= rowData[0]%></td>
            <td style="padding: 12px; border: 1px solid #ddd;"><%= rowData[1]%></td>
        </tr>
        <% }%>
    </tbody>
</table>

<%@ include file="footer.jsp" %>
