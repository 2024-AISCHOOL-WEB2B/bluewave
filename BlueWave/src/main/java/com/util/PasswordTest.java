package com.util;

public class PasswordTest {
    public static void main(String[] args) {
        String originalPassword = "mypassword";
        String hashedPassword = PasswordUtil.hashPassword(originalPassword);

        System.out.println("Original Password: " + originalPassword);
        System.out.println("Hashed Password: " + hashedPassword);

        boolean isMatch = PasswordUtil.checkPassword(originalPassword, hashedPassword);
        System.out.println("Password Match: " + isMatch);
    }
}
