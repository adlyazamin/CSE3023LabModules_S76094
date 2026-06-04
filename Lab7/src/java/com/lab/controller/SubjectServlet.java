package com.lab.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lab.bean.SubjectBean;
import com.lab.dao.SubjectDAO;

public class SubjectServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private SubjectDAO subjectDAO;

    public void init() {
        subjectDAO = new SubjectDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Active Session Verification Guard Clause
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("matric_no") == null) {
            response.sendRedirect(request.getContextPath() + "/login.html");
            return;
        }

        String matricNo = (String) session.getAttribute("matric_no");
        String action = request.getParameter("action");
        if (action == null) {
            action = "view";
        }

        try {
            switch (action) {
                case "add":
                    insertSubject(request, response, matricNo);
                    break;
                case "editForm":
                    showEditForm(request, response, matricNo);
                    break;
                case "update":
                    updateSubject(request, response, matricNo);
                    break;
                case "delete":
                    deleteSubject(request, response, matricNo);
                    break;
                case "view":
                default:
                    listSubjects(request, response, matricNo);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listSubjects(HttpServletRequest request, HttpServletResponse response, String matricNo)
            throws SQLException, ServletException, IOException {
        List<SubjectBean> listSubjects = subjectDAO.getSubjectsByMatric(matricNo);
        request.setAttribute("subjectList", listSubjects);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/subject/viewSubjects.jsp");
        dispatcher.forward(request, response);
    }

    private void insertSubject(HttpServletRequest request, HttpServletResponse response, String matricNo)
            throws SQLException, IOException {
        String subjectCode = request.getParameter("subject_code");
        String subjectName = request.getParameter("subject_name");

        SubjectBean newSubject = new SubjectBean(0, matricNo, subjectCode, subjectName);
        subjectDAO.addSubject(newSubject);
        response.sendRedirect(request.getContextPath() + "/SubjectServlet?action=view");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response, String matricNo)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        SubjectBean existingSubject = subjectDAO.getSubjectById(id);

        // Security Check: Verify user owns row before serving form interface
        if (existingSubject != null && existingSubject.getMatricNo().equals(matricNo)) {
            request.setAttribute("subject", existingSubject);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/subject/updateSubject.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/SubjectServlet?action=view");
        }
    }

    private void updateSubject(HttpServletRequest request, HttpServletResponse response, String matricNo)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String subjectCode = request.getParameter("subject_code");
        String subjectName = request.getParameter("subject_name");

        SubjectBean subject = new SubjectBean(id, matricNo, subjectCode, subjectName);
        subjectDAO.updateSubject(subject);
        response.sendRedirect(request.getContextPath() + "/SubjectServlet?action=view");
    }

    private void deleteSubject(HttpServletRequest request, HttpServletResponse response, String matricNo)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        subjectDAO.deleteSubject(id, matricNo);
        response.sendRedirect(request.getContextPath() + "/SubjectServlet?action=view");
    }
}
