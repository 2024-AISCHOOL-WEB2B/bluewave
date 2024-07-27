package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtil {

    private static final String URL = "jdbc:oracle:thin:@project-db-stu3.smhrd.com:1524:xe";
    private static final String USER = "Insa5_SpringB_hacksim_2";
    private static final String PASSWORD = "aishcool2";

    static {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            System.out.println("Oracle JDBC Driver Loaded Successfully.");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("Failed to load Oracle JDBC Driver.");
        }
    }

    public static Connection getConnection() throws SQLException {
        System.out.println("Attempting to connect to the database...");
        Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
        System.out.println("Connection established successfully.");
        return conn;
    }

    public static void close(ResultSet rs, Statement stmt, Connection conn) {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
            System.out.println("Resources closed successfully.");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Failed to close resources.");
        }
    }

    public static void main(String[] args) {
        // Test the database connection
        try (Connection conn = DBUtil.getConnection()) {
            if (conn != null) {
                System.out.println("Database connection test successful.");
            } else {
                System.out.println("Database connection test failed.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("SQLException occurred during database connection test.");
        }
    }
}
