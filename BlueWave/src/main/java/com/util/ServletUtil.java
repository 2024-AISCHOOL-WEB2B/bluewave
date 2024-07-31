package com.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.UserDTO;

import java.io.IOException;
import java.util.logging.Logger;

public class ServletUtil {
    private static final Logger LOGGER = Logger.getLogger(ServletUtil.class.getName());
    private static final String CHARSET_UTF_8 = "UTF-8";
    private static final String CHARSET_EUC_KR = "EUC-KR";

    // Request 인코딩 설정
    public static void setCharacterEncoding(HttpServletRequest request) {
        try {
            request.setCharacterEncoding(CHARSET_EUC_KR);
        } catch (Exception e) {
            LOGGER.severe("문자 인코딩 실패: " + e.getMessage());
        }
    }

    // Response 인코딩 설정
    public static void setResponseEncoding(HttpServletResponse response, String encoding) {
        try {
            response.setCharacterEncoding(encoding);
        } catch (Exception e) {
            LOGGER.severe("응답 인코딩 설정 실패: " + e.getMessage());
        }
    }

    // ContentType과 인코딩 설정
    public static void setContentTypeAndEncoding(HttpServletResponse response, String contentType, String encoding) {
        try {
            response.setContentType(contentType + "; charset=" + encoding);
        } catch (Exception e) {
            LOGGER.severe("콘텐츠 유형 및 인코딩 설정 실패: " + e.getMessage());
        }
    }

    // 로그인 성공 처리
    public static void handleLoginSuccess(HttpServletRequest request, HttpServletResponse response, UserDTO user) throws IOException {
        request.getSession().setAttribute("user", user);
        response.sendRedirect("loginSuccess.jsp");
    }

    // 로그인 실패 처리
    public static void handleLoginFailure(HttpServletResponse response, String errorMessage, int statusCode) throws IOException {
        LOGGER.warning(errorMessage);
        response.sendError(statusCode, errorMessage);
    }
}
