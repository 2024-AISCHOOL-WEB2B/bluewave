package com.controller;

import com.model.UserDTO;
import com.util.PasswordUtil;
import com.util.ServletUtil;
import com.model.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 인코딩
		ServletUtil.setCharacterEncoding(request);
		ServletUtil.setContentTypeAndEncoding(response, "text/html", "UTF-8");

		try {
			String userId = request.getParameter("username");
			String password = request.getParameter("password");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String birthYear = request.getParameter("birth-year");
			String birthMonth = request.getParameter("birth-month");
			String birthDay = request.getParameter("birth-day");
			String birthdate = birthYear + birthMonth + birthDay; // YYYYMMDD 형식으로 변경
			String gender = request.getParameter("gender");
			String job = request.getParameter("job");

			int income = 0;
			int family = 0;
			try {
				income = Integer.parseInt(request.getParameter("pay"));
				family = Integer.parseInt(request.getParameter("familly"));
			} catch (NumberFormatException e) {
				// 로그에 오류 기록
				System.err.println("Invalid number format: " + e.getMessage());
				response.sendRedirect("register.jsp?error=invalid_number");
				return;
			}

			String region = request.getParameter("addressSelect");
			String policyInterest = request.getParameter("policyInterest");

			// 현재 시간을 Timestamp 형식으로 생성
			Timestamp currentTimestamp = new Timestamp(new Date().getTime());

			// 비밀번호 해싱
			String hashedPassword = PasswordUtil.hashPassword(password);

			UserDTO user = new UserDTO(userId, hashedPassword, name, email, birthdate, gender, job, income, family,
					region, policyInterest, currentTimestamp, currentTimestamp);
			UserDAO userDAO = new UserDAO();

			int result = userDAO.register(user);
			if (result == 1) {
				response.sendRedirect("registerSuc.jsp");
			} else {
				response.sendRedirect("register.jsp?error=registration_failed");
			}
		} catch (Exception e) {
			// 로그에 오류 기록
			System.err.println("Error in RegisterServlet: " + e.getMessage());
			e.printStackTrace();
			response.sendRedirect("register.jsp?error=unknown");
		}
	}
}