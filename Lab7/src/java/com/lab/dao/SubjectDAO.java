package com.lab.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.lab.bean.SubjectBean;

public class SubjectDAO {

    // Update credentials to match your database management system setup
    private final String jdbcURL = "jdbc:mysql://localhost:3306/lab7?useSSL=false&serverTimezone=UTC";
    private final String jdbcUsername = "root";
    private final String jdbcPassword = "";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    // CREATE (Daftar)
    public void addSubject(SubjectBean subject) throws SQLException {
        String sql = "INSERT INTO registered_subjects (matric_no, subject_code, subject_name) VALUES (?, ?, ?)";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, subject.getMatricNo());
            ps.setString(2, subject.getSubjectCode());
            ps.setString(3, subject.getSubjectName());
            ps.executeUpdate();
        }
    }

    // READ (View - Filtered by current user session context)
    public List<SubjectBean> getSubjectsByMatric(String matricNo) throws SQLException {
        List<SubjectBean> subjects = new ArrayList<>();
        String sql = "SELECT * FROM registered_subjects WHERE matric_no = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, matricNo);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String code = rs.getString("subject_code");
                    String name = rs.getString("subject_name");
                    subjects.add(new SubjectBean(id, matricNo, code, name));
                }
            }
        }
        return subjects;
    }

    // Single record fetch utility for editing validation
    public SubjectBean getSubjectById(int id) throws SQLException {
        SubjectBean subject = null;
        String sql = "SELECT * FROM registered_subjects WHERE id = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String matricNo = rs.getString("matric_no");
                    String code = rs.getString("subject_code");
                    String name = rs.getString("subject_name");
                    subject = new SubjectBean(id, matricNo, code, name);
                }
            }
        }
        return subject;
    }

    // UPDATE (Kemaskini)
    public void updateSubject(SubjectBean subject) throws SQLException {
        String sql = "UPDATE registered_subjects SET subject_code = ?, subject_name = ? WHERE id = ? AND matric_no = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, subject.getSubjectCode());
            ps.setString(2, subject.getSubjectName());
            ps.setInt(3, subject.getId());
            ps.setString(4, subject.getMatricNo());
            ps.executeUpdate();
        }
    }

    // DELETE (Padam)
    public void deleteSubject(int id, String matricNo) throws SQLException {
        String sql = "DELETE FROM registered_subjects WHERE id = ? AND matric_no = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.setString(2, matricNo);
            ps.executeUpdate();
        }
    }
}
