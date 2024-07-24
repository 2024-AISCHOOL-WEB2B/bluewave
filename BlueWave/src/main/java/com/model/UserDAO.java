package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UserDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/bluewave";
    private String jdbcUsername = "root";
    private String jdbcPassword = "password";

    private static final String INSERT_USERS_SQL = "INSERT INTO TBL_USER (USER_ID, USER_PW, USER_NAME, USER_EMAIL, USER_BIRTHDATE, USER_GENDER, USER_JOB, USER_INCOME, USER_FAMILY, USER_REGION, USER_POLICY_INTEREST) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public int register(User user) {
        int result = 0;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setString(1, user.getUserId());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3, user.getName());
            preparedStatement.setString(4, user.getEmail());
            preparedStatement.setString(5, user.getBirthdate());
            preparedStatement.setString(6, user.getGender());
            preparedStatement.setString(7, user.getJob());
            preparedStatement.setInt(8, user.getIncome());
            preparedStatement.setInt(9, user.getFamily());
            preparedStatement.setString(10, user.getRegion());
            preparedStatement.setString(11, user.getPolicyInterest());

            result = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}
