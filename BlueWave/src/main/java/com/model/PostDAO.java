package com.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpSession;

import com.util.DBUtil;

public class PostDAO {
	
    
	private static final String INSERT_POST_SQL = "INSERT INTO TBL_POST (POST_IDX, POST_TITLE, POST_CONTENT, POST_FILE, POST_VIEWS, POST_LIKES, CREATED_AT, UPDATED_AT, USER_ID) "
			+ "VALUES (TBL_POST_SEQ.NEXTVAL, ?, ?, ?, 0, 0, SYSDATE, SYSDATE, ?)";
	UserDTO user = new UserDTO();

	// 포스트 DB에 저장하는 메서드
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
}
