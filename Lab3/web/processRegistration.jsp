<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>

<%
    String name = request.getParameter("studentName");
    String club = request.getParameter("selectedClub");

    if (name != null && !name.trim().isEmpty() && club != null) {

        ArrayList<String[]> members = (ArrayList<String[]>) application.getAttribute("sharedMemberList");

        if (members == null) {
            members = new ArrayList<String[]>();
        }

        members.add(new String[]{name, club});

        application.setAttribute("sharedMemberList", members);

        response.sendRedirect("memberDirectory.jsp");
        
    } else {
        response.sendRedirect("registerClub.jsp");
    }
%>