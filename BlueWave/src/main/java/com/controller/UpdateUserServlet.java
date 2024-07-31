package com.controller;

import com.model.UserDTO;
import com.util.ServletUtil;
import com.model.UserDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	ServletUtil.setCharacterEncoding(request);
    	ServletUtil.setContentTypeAndEncoding(response, "text/html", "UTF-8");
        // 요청 응답 인코딩

        // 요청 파라미터 읽기
        String userName = request.getParameter("userName");
        String userGender = request.getParameter("userGender");
        String userBirthdate = request.getParameter("userBirthdate");
        String userRegion = request.getParameter("userRegion");
        String userEmail = request.getParameter("userEmail");
        String userJob = request.getParameter("userJob");
        String userInterest = request.getParameter("userInterest");
        
        int userIncome;
        int userFamily;

        // userIncome과 userFamily를 Integer로 변환
        // 입력폼에서 number 해도 되는데 그냥 이렇게함
        try {
            userIncome = Integer.parseInt(request.getParameter("userIncome"));
        } catch (NumberFormatException e) {
            userIncome = 0; // 기본값 설정 또는 오류 처리
        }
        
        try {
            userFamily = Integer.parseInt(request.getParameter("userFamily"));
        } catch (NumberFormatException e) {
            userFamily = 0; // 기본값 설정 또는 오류 처리
        }

        // 세션에서 현재 사용자 정보 가져오기
        HttpSession session = request.getSession();
        UserDTO user = (UserDTO) session.getAttribute("user");

        if (user != null) {
            // UserDTO 객체를 생성하고 데이터 설정
            user.setUserName(userName);
            user.setUserGender(userGender);
            user.setUserBirthdate(userBirthdate);
            user.setUserRegion(userRegion);
            user.setUserEmail(userEmail);
            user.setUserJob(userJob);
            user.setUserPolicyInterest(userInterest);
            user.setUserIncome(userIncome);
            user.setUserFamily(userFamily);

            // UserDAO 객체를 사용하여 데이터베이스 업데이트
            UserDAO userDAO = new UserDAO();
            boolean success = userDAO.updateUser(user);

            if (success) {
                // 성공적으로 업데이트된 경우
                session.setAttribute("user", user);
                response.sendRedirect("userInfo.jsp");
            } else {
                // 실패한 경우, 오류 메시지를 설정하거나 다른 처리
                request.setAttribute("errorMessage", "정보 수정에 실패했습니다.");
                request.getRequestDispatcher("editInfo.jsp").forward(request, response);
            }
        } else {
            // 사용자 정보가 없는 경우 로그인 페이지로 리다이렉트
            response.sendRedirect("login.jsp");
        }
    }
}
