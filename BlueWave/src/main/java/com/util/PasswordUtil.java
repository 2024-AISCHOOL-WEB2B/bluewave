package com.util;

import org.mindrot.jbcrypt.BCrypt;

public class PasswordUtil {

    // 비밀번호 해싱
    public static String hashPassword(String password) {
        return BCrypt.hashpw(password, BCrypt.gensalt());
    }

    // 비밀번호 검증
    public static boolean checkPassword(String candidate, String hashed) {
        return BCrypt.checkpw(candidate, hashed);
    }
}