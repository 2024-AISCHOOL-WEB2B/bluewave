package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

public class UserDAO {
    private String jdbcURL = "jdbc:oracle:thin:@project-db-stu3.smhrd.com:1524:xe";
    private String jdbcUsername = "Insa5_SpringB_hacksim_2";
    private String jdbcPassword = "aishcool2";

    private static final String INSERT_USERS_SQL = "INSERT INTO TBL_USER (USER_ID, USER_PW, USER_NAME, USER_EMAIL, USER_BIRTHDATE, USER_GENDER, USER_JOB, USER_INCOME, USER_FAMILY, USER_REGION, USER_POLICY_INTEREST, CREATED_AT, UPDATED_AT) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public int register(UserDTO user) {
        int result = 0;
        try (Connection connection = getConnection();
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
}
