<%-- 
    Document   : registerClub
    Created on : 14 Apr 2026, 3:55:04 pm
    Author     : User
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Club Registration</title>
</head>
<body style="font-family: sans-serif; margin: 0; background-color: #f9f9f9;">

    <%@ include file="header.jsp" %>

    <div style="padding: 30px; max-width: 600px; margin: auto;">
        <h2>Register for a Club</h2>
        <fieldset style="padding: 20px; border: 1px solid #ccc; background-color: white;">
            <legend>Student Information</legend>
            <form action="processRegistration.jsp" method="POST">
                <table cellpadding="8">
                    <tr>
                        <td><label for="studentName">Student Name:</label></td>
                        <td><input type="text" id="studentName" name="studentName" required style="width: 250px;"></td>
                    </tr>
                    <tr>
                        <td><label for="matricNumber">Matric Number:</label></td>
                        <td><input type="text" id="matricNumber" name="matricNumber" required style="width: 250px;"></td>
                    </tr>
                    <tr>
                        <td><label for="selectedClub">Selected Club:</label></td>
                        <td>
                            <select id="selectedClub" name="selectedClub" required style="width: 258px;">
                                <option value="" disabled selected>Select a Club</option>
                                <option value="Programming Society">Programming Society</option>
                                <option value="Data Science Club">Data Science Club</option>
                                <option value="Cyber Security Team">Cyber Security Team</option>
                                <option value="Multimedia & Design Club">Multimedia & Design Club</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center;">
                            <br>
                            <input type="submit" value="Submit Registration" style="padding: 5px 15px;">
                        </td>
                    </tr>
                </table>
            </form>
        </fieldset>
    </div>

    <%@ include file="footer.jsp" %>

</body>
</html>
