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
            System.out.println("Oracle JDBC 드라이버가 성공적으로 로드");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("Oracle JDBC 드라이버 로드에 실패");
        }
    }

    public static Connection getConnection() throws SQLException {
        System.out.println("데이터베이스에 연결을 시도 중...");
        Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
        System.out.println("데이터베이스에 성공적으로 연결");
        return conn;
    }

    public static void close(ResultSet rs, Statement stmt, Connection conn) {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
            System.out.println("성공");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("실패");
        }
    }

    public static void main(String[] args) {
        // Test the database connection
        try (Connection conn = DBUtil.getConnection()) {
            if (conn != null) {
                System.out.println("데이터베이스 연결 테스트가 성공");
            } else {
                System.out.println("데이터베이스 연결 테스트가 실패");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("데이터베이스 연결 테스트 중 SQLException이 발생");
        }
    }
}
