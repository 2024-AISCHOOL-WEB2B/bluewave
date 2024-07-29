package com.model;

import java.security.Timestamp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpSession;

import com.util.DBUtil;

public class PostDAO {

	// 쿼리문 작성
	private static final String INSERT_POST_SQL = "INSERT INTO TBL_POST (POST_IDX, POST_TITLE, POST_CONTENT, POST_FILE, POST_VIEWS, POST_LIKES, CREATED_AT, UPDATED_AT, USER_ID) "
			+ "VALUES (TBL_POST_SEQ.NEXTVAL, ?, ?, ?, 0, 0, SYSDATE, SYSDATE, ?)";
	private static final String SELECT_POST_SQL = "SELECT * FROM TBL_POST WHERE POST_IDX = ? ";

	// 객체 생성
	UserDTO user = new UserDTO();

	// 게시물을 DB에 저장하는 메서드
	public int postDbSave(PostDTO post) {
		int result = 0;
		try (Connection connection = DBUtil.getConnection();
				PreparedStatement psmt = connection.prepareStatement(INSERT_POST_SQL)) {

			psmt.setString(1, post.getPostTitle());
			psmt.setString(2, post.getPostContents());
			psmt.setString(3, post.getPostFile() != null ? post.getPostFile() : null);
			psmt.setString(4, post.getUserId());
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	// 게시물을 DB에서 조회(꺼내오는) 메서드
	public PostDTO postSearch(int search) {
		ResultSet result = null;
		PostDTO dto = null;
		
		try (Connection connection = DBUtil.getConnection();
				PreparedStatement psmt = connection.prepareStatement(SELECT_POST_SQL)) {

			psmt.setInt(1, search);
			result = psmt.executeQuery();

			while (result.next()) {
				String user_id = result.getString("user_id");
				String post_title = result.getString("post_title");
				String post_content = result.getString("post_content");
				int post_views = result.getInt("post_views");
				int post_likes = result.getInt("post_likes");
				String post_file = result.getString("post_file");
				java.sql.Timestamp created_at = result.getTimestamp("created_at");
				java.sql.Timestamp updated_at = result.getTimestamp("updated_at");

				dto = new PostDTO(search, post_title, post_content, post_file, post_views, post_likes,
						created_at, updated_at, user_id);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}
}
