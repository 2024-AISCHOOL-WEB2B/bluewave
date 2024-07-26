package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.CallableStatement;
import java.util.Properties;

import com.controller.PostLikeService;
import com.util.DBUtil;

public class PostLikeDAO {

	private static final String SELECT_POSTLIKE_SQL = "SELECT LIKE_ID FROM TBL_POST_LIKE WHERE USER_ID = ? AND POST_IDX = ?";
	private static final String UPDATE_POSTLIKE_SQL = "UPDATE SET POST_LIKES=? WHERE POST_IDX = ?";
	private static final String INSERT_POSTLIKE_SQL = "INSERT INTO TBL_POST_LIKE VALUES(?,?,?,?)";

	static UserDTO user = new UserDTO();
	static PostDTO post = new PostDTO();
	int postlike = 0;

	public static int like(String userId, int postIdx) {

		int result = 0;
		try (Connection connection = DBUtil.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_POSTLIKE_SQL)) {

			preparedStatement.setString(1, user.getUserId());
			preparedStatement.setInt(2, post.getPostIdx());

			try (ResultSet rs = preparedStatement.executeQuery()) {
				if (rs.next() == false) { // 좋아요누른 기록이 없으면
					PreparedStatement psmt = connection.prepareStatement(UPDATE_POSTLIKE_SQL);
					psmt.setInt(1, post.getPostLikes() + 1);
					psmt.setInt(2, post.getPostIdx());

					PreparedStatement ps = connection.prepareStatement(INSERT_POSTLIKE_SQL);
					ps.setInt(2, post.getPostIdx());
					ps.setString(3, user.getUserId());
					System.out.println("좋아요 업데이트 완료!");
				} else {
					System.out.println("이미 좋아요를 누른 게시물입니다.");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

}
