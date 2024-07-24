package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
    
    private Connection conn;
    private PreparedStatement psmt;
    private ResultSet rs;
    
    private void getConnection() {
        
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        
        String db_id = "Insa5_SpringB_hacksim_2";
        String db_pw = "aishcool2";
        String db_url = "project-db-stu3.smhrd.com";

        try {
            conn = DriverManager.getConnection(db_url, db_id, db_pw);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    private void close() {
        try {
            if (rs != null) rs.close();
            if (psmt != null) psmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public int register(UserDTO user) {
        int result = 0;
        getConnection();

        try {
            String sql = "INSERT INTO TB_USER (USER_ID, USER_PW, USER_NAME, USER_EMAIL, USER_BIRTHDATE, USER_GENDER, USER_JOB, USER_INCOME, USER_FAMILY, USER_REGION, USER_POLICY_INTEREST) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            psmt = conn.prepareStatement(sql);
            psmt.setString(1, user.getUserId());
            psmt.setString(2, user.getUserPw());
            psmt.setString(3, user.getUserName());
            psmt.setString(4, user.getUserEmail());
            psmt.setString(5, user.getUserBirthdate());
            psmt.setString(6, user.getUserGender());
            psmt.setString(7, user.getUserJob());
            psmt.setInt(8, user.getUserIncome());
            psmt.setInt(9, user.getUserFamily());
            psmt.setString(10, user.getUserRegion());
            psmt.setString(11, user.getUserPolicyInterest());

            result = psmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }

        return result;
    }

    public UserDTO login(String userId, String userPw) {
        UserDTO user = null;

        try {
            getConnection();

            String sql = "SELECT * FROM TB_USER WHERE USER_ID = ? AND USER_PW = ?";
            psmt = conn.prepareStatement(sql);
            psmt.setString(1, userId);
            psmt.setString(2, userPw);
            rs = psmt.executeQuery();

            if (rs.next()) {
                user = new UserDTO(
                    rs.getString("USER_ID"),
                    rs.getString("USER_PW"),
                    rs.getString("USER_NAME"),
                    rs.getString("USER_EMAIL"),
                    rs.getString("USER_BIRTHDATE"),
                    rs.getString("USER_GENDER"),
                    rs.getString("USER_JOB"),
                    rs.getInt("USER_INCOME"),
                    rs.getInt("USER_FAMILY"),
                    rs.getString("USER_REGION"),
                    rs.getString("USER_POLICY_INTEREST")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }

        return user;
    }

    public int update(UserDTO user) {
        int result = 0;
        getConnection();

        try {
            String sql = "UPDATE TB_USER SET USER_PW = ?, USER_NAME = ?, USER_EMAIL = ?, USER_BIRTHDATE = ?, USER_GENDER = ?, USER_JOB = ?, USER_INCOME = ?, USER_FAMILY = ?, USER_REGION = ?, USER_POLICY_INTEREST = ? WHERE USER_ID = ?";
            psmt = conn.prepareStatement(sql);
            psmt.setString(1, user.getUserPw());
            psmt.setString(2, user.getUserName());
            psmt.setString(3, user.getUserEmail());
            psmt.setString(4, user.getUserBirthdate());
            psmt.setString(5, user.getUserGender());
            psmt.setString(6, user.getUserJob());
            psmt.setInt(7, user.getUserIncome());
            psmt.setInt(8, user.getUserFamily());
            psmt.setString(9, user.getUserRegion());
            psmt.setString(10, user.getUserPolicyInterest());
            psmt.setString(11, user.getUserId());

            result = psmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }

        return result;
    }
}
