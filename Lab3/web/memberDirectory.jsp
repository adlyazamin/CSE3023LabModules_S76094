<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Club Member Directory</title>
    <style>
        .directory-table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            margin-top: 20px;
        }
        .directory-table th, .directory-table td {
            border: 1px solid #cccccc;
            padding: 12px;
            text-align: left;
        }
        .directory-table th {
            background-color: #0056b3;
            color: white;
            text-align: center;
        }
        .empty-message {
            text-align: center;
            font-style: italic;
            color: #777;
            padding: 20px !important;
        }
    </style>
</head>
<body style="font-family: sans-serif; margin: 0; background-color: #f9f9f9;">

    <%@ include file="header.jsp" %>

    <div style="padding: 30px; max-width: 700px; margin: auto;">
        <h2 style="text-align: center;">Club Member Directory</h2>
        
        <%
            ArrayList<String[]> members = (ArrayList<String[]>) application.getAttribute("sharedMemberList");
            
            if (members == null) {
                members = new ArrayList<String[]>();
                application.setAttribute("sharedMemberList", members);
            }
        %>

        <table class="directory-table">
            <tr>
                <th style="width: 10%;">No.</th>
                <th style="width: 45%;">Member Name</th>
                <th style="width: 45%;">Club Affiliation</th>
            </tr>
            <%
                if (members.isEmpty()) {
            %>
                <tr>
                    <td colspan="3" class="empty-message">No members have registered yet. Fill out the registration form to add someone!</td>
                </tr>
            <%
                } else {
                    for (int i = 0; i < members.size(); i++) {
                        String[] currentMember = members.get(i);
            %>
                <tr>
                    <td style="text-align: center;"><%= (i + 1) %></td>
                    <td><%= currentMember[0] %></td>
                    <td><%= currentMember[1] %></td>
                </tr>
            <%
                    }
                }
            %>
        </table>
    </div>

    <%@ include file="footer.jsp" %>

</body>
</html>