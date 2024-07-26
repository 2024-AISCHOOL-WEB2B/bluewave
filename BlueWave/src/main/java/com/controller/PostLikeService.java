package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.CallableStatement;
import java.sql.SQLException;
import java.util.Properties;

@WebServlet("/PostLikeService")
public class PostLikeService {

	private static Connection getConnection() throws SQLException {
		Properties props = new Properties();
		try {
			props.load(PostLikeService.class.getClassLoader().getResourceAsStream("db.properties"));
		} catch (Exception e) {
			e.printStackTrace();
		}

		String url = props.getProperty("jdbc:oracle:thin:@project-db-stu3.smhrd.com:1524:xe");
		String username = props.getProperty("Insa5_SpringB_hacksim_2");
		String password = props.getProperty("aishcool2");

		return DriverManager.getConnection(url, username, password);
	}

	public static void increasePostLike(int postId, String userId) throws SQLException {
		String sql = "{call INCREASE_POST_LIKE(?, ?)}";
		try (Connection conn = getConnection(); CallableStatement stmt = conn.prepareCall(sql)) {
			stmt.setInt(1, postId);
			stmt.setString(2, userId);
			stmt.execute();
			conn.commit(); // 커밋 수행
		} catch (SQLException e) {
			throw new SQLException("Error executing procedure", e);
		}
	}
}
