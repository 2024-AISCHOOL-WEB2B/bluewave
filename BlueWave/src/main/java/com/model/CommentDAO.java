package com.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;

import com.util.DBUtil;

public class CommentDAO {

	// 객체 생성
	CommentDTO dto = new CommentDTO();

	// 댓글작성 메서드
	public int writeComment(int post_idx, String userid, String comment_content) {
		int result = 0;
		String INSERT_COMMENT_SQL = "INSERT INTO TBL_COMMENT VALUES(TBL_COMMENT_SEQ.nextval, ?, ?, ?, 1, SYSDATE, SYSDATE)";

		try (Connection connection = DBUtil.getConnection();
				PreparedStatement psmt = connection.prepareStatement(INSERT_COMMENT_SQL)) {

			psmt.setInt(1, post_idx);
			psmt.setString(2, userid);
			psmt.setString(3, comment_content);
			result =  psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
