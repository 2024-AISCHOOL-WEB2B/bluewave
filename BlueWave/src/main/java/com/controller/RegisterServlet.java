package com.controller;

import com.model.UserDTO;
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("EUC-KR");
        response.setCharacterEncoding("EUC-KR");

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
        int income = Integer.parseInt(request.getParameter("pay"));
        int family = Integer.parseInt(request.getParameter("familly"));
        String region = request.getParameter("addressSelect");
        String policyInterest = request.getParameter("policyInterest");

        // 현재 시간을 Timestamp 형식으로 생성
        Timestamp currentTimestamp = new Timestamp(new Date().getTime());

        UserDTO user = new UserDTO(userId, password, name, email, birthdate, gender, job, income, family, region, policyInterest, currentTimestamp, currentTimestamp);

        UserDAO userDAO = new UserDAO();
        int result = userDAO.register(user);

        if (result == 1) {
            response.sendRedirect("registerSuc.jsp");
        } else {
            response.sendRedirect("register.jsp");
        }
    }
}
