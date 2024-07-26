package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.CallableStatement;
import java.util.Properties;

import com.controller.PostLikeService;

public class PostLikeDAO {

	private static Connection getConnection() throws SQLException {
		Properties props = new Properties();
		try {
			props.load(PostLikeService.class.getClassLoader().getResourceAsStream("db.properties"));
		} catch (Exception e) {
			e.printStackTrace();
		}

		String url = "jdbc:oracle:thin:@project-db-stu3.smhrd.com:1524:xe";
		String username = "Insa5_SpringB_hacksim_2";
		String password = "aishcool2";

		return DriverManager.getConnection(url, username, password);
	}

	public static void increasePostLike(int postId, String userId) {
		String sql = "{call INCREASE_POST_LIKE(?, ?)}";
		try (Connection conn = getConnection();
			CallableStatement stmt = conn.prepareCall(sql)) {
			stmt.setInt(1, postId);
			stmt.setString(2, userId);
			stmt.execute();
			conn.commit(); // 커밋 수행

		}
	}
}