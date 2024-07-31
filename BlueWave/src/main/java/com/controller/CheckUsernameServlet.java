package com.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import com.util.DBUtil;
import com.util.ServletUtil;

@WebServlet("/CheckUsernameServlet")
public class CheckUsernameServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletUtil.setCharacterEncoding(request);
        ServletUtil.setContentTypeAndEncoding(response, "text/html", "UTF-8");

        String username = request.getParameter("username");
        PrintWriter out = response.getWriter();

        try (Connection conn = DBUtil.getConnection()) {
            String sql = "SELECT COUNT(*) FROM TBL_USER WHERE USER_ID = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next() && rs.getInt(1) > 0) {
                out.print("exists");
            } else {
                out.print("available");
            }

            DBUtil.close(rs, pstmt, conn);
        } catch (Exception e) {
            e.printStackTrace();
            out.print("error");
        } finally {
            out.close();
        }
    }
}
