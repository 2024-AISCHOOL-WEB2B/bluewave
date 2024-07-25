package com.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/CheckUsernameServlet")
public class CheckUsernameServlet extends HttpServlet {
    private String jdbcURL = "jdbc:oracle:thin:@project-db-stu3.smhrd.com:1524:xe";
    private String jdbcUsername = "Insa5_SpringB_hacksim_2";
    private String jdbcPassword = "aishcool2";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        PrintWriter out = response.getWriter();

        try (Connection conn = getConnection()) {
            String sql = "SELECT COUNT(*) FROM TBL_USER WHERE USER_ID = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next() && rs.getInt(1) > 0) {
                out.print("exists");
            } else {
                out.print("available");
            }

            rs.close();
            pstmt.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.print("error");
        } finally {
            out.close();
        }
    }
}