package com.controller;

import com.model.UserDAO;
import com.model.UserDTO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/UserDelete")
public class UserDelete extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 요청 파라미터 읽기
        String email = request.getParameter("email");
        String userId = request.getParameter("userId");

        // 세션에서 현재 사용자 정보 가져오기
        HttpSession session = request.getSession();
        UserDTO user = (UserDTO) session.getAttribute("user");

        if (user != null) {
            // UserDAO 객체를 사용하여 데이터베이스에서 사용자 정보 삭제
            UserDAO userDAO = new UserDAO();
            boolean success = userDAO.deleteUser(userId);

            if (success) {
                // 삭제 성공 시, 세션에서 사용자 정보를 제거하고 탈퇴 완료 페이지로 리다이렉트
                session.removeAttribute("user");
                response.sendRedirect("DeleteSUC.jsp");
            } else {
                // 실패한 경우, 오류 메시지를 설정하거나 다른 처리
                request.setAttribute("errorMessage", "회원 탈퇴에 실패했습니다.");
                request.getRequestDispatcher("errorPage.jsp").forward(request, response);
            }
        } else {
            // 사용자 정보가 없는 경우 로그인 페이지로 리다이렉트
            response.sendRedirect("login.jsp");
        }
    }
}
