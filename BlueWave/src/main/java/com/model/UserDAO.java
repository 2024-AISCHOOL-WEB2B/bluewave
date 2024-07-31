package com.model;

import java.sql.*;
import com.util.DBUtil;
import com.util.PasswordUtil;

public class UserDAO {

    private static final String INSERT_USERS_SQL = "INSERT INTO TBL_USER (USER_ID, USER_PW, USER_NAME, USER_EMAIL, USER_BIRTHDATE, USER_GENDER, USER_JOB, USER_INCOME, USER_FAMILY, USER_REGION, USER_POLICY_INTEREST, CREATED_AT, UPDATED_AT) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String LOGIN_SQL = "SELECT * FROM TBL_USER WHERE USER_ID = ?";
    private static final String SELECT_USER_BY_ID_SQL = "SELECT * FROM TBL_USER WHERE USER_ID = ?";
    private static final String UPDATE_USER_SQL = "UPDATE TBL_USER SET USER_NAME = ?, USER_GENDER = ?, USER_BIRTHDATE = ?, USER_REGION = ?, USER_EMAIL = ?, USER_JOB = ?, USER_POLICY_INTEREST = ?, USER_INCOME = ?, USER_FAMILY = ? WHERE USER_ID = ?";
    private static final String DELETE_USER_SQL = "DELETE FROM TBL_USER WHERE USER_ID = ?";

    public int register(UserDTO user) {
        int result = 0;
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {

            preparedStatement.setString(1, user.getUserId());
            preparedStatement.setString(2, user.getUserPw());
            preparedStatement.setString(3, user.getUserName());
            preparedStatement.setString(4, user.getUserEmail());
            preparedStatement.setString(5, user.getUserBirthdate());
            preparedStatement.setString(6, user.getUserGender());
            preparedStatement.setString(7, user.getUserJob());
            preparedStatement.setInt(8, user.getUserIncome());
            preparedStatement.setInt(9, user.getUserFamily());
            preparedStatement.setString(10, user.getUserRegion());
            preparedStatement.setString(11, user.getUserPolicyInterest());
            preparedStatement.setTimestamp(12, user.getCreatedAt());
            preparedStatement.setTimestamp(13, user.getUpdatedAt());

            result = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public UserDTO login(String userId, String password) {
        UserDTO user = null;
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(LOGIN_SQL)) {

            preparedStatement.setString(1, userId);
            try (ResultSet rs = preparedStatement.executeQuery()) {
                if (rs.next()) {
                    String hashedPassword = rs.getString("USER_PW"); // 해시값

                    if (PasswordUtil.checkPassword(password, hashedPassword)) { // 인코딩 전의 비밀번호와 해시값 비교
                        user = new UserDTO(
                            userId,
                            rs.getString("USER_PW"),
                            rs.getString("USER_NAME"),
                            rs.getString("USER_EMAIL"),
                            rs.getString("USER_BIRTHDATE"),
                            rs.getString("USER_GENDER"),
                            rs.getString("USER_JOB"),
                            rs.getInt("USER_INCOME"),
                            rs.getInt("USER_FAMILY"),
                            rs.getString("USER_REGION"),
                            rs.getString("USER_POLICY_INTEREST"),
                            rs.getTimestamp("CREATED_AT"),
                            rs.getTimestamp("UPDATED_AT")
                        );
                    } else {
                        // 비밀번호 불일치
                        System.out.println("Invalid password");
                    }
                } else {
                    // 사용자 없음
                    System.out.println("User not found");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    // 사용자 정보 가져오는 메서드
    public UserDTO getUserById(String userId) {
        UserDTO user = null;
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(SELECT_USER_BY_ID_SQL)) {

            pstmt.setString(1, userId);
            try (ResultSet rs = pstmt.executeQuery()) {
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
                        rs.getString("USER_POLICY_INTEREST"),
                        rs.getTimestamp("CREATED_AT"),
                        rs.getTimestamp("UPDATED_AT")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    // 사용자 정보 업데이트 메서드
    public boolean updateUser(UserDTO user) {
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(UPDATE_USER_SQL)) {

            pstmt.setString(1, user.getUserName());
            pstmt.setString(2, user.getUserGender());
            pstmt.setString(3, user.getUserBirthdate());
            pstmt.setString(4, user.getUserRegion());
            pstmt.setString(5, user.getUserEmail());
            pstmt.setString(6, user.getUserJob());
            pstmt.setString(7, user.getUserPolicyInterest());
            pstmt.setInt(8, user.getUserIncome());
            pstmt.setInt(9, user.getUserFamily());
            pstmt.setString(10, user.getUserId());

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // 사용자 정보 삭제 메서드
    public boolean deleteUser(String userId) {
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(DELETE_USER_SQL)) {

            pstmt.setString(1, userId);
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
