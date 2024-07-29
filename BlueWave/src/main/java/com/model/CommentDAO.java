package com.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

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
	
	// 댓글 목록 불러오는 메서드
		public List<CommentDTO> getCommentsByPostId(int post_idx) {
			List<CommentDTO> commentList = new ArrayList<>();
			String SELECT_COMMENTS_SQL = "SELECT * FROM TBL_COMMENT WHERE POST_IDX = ? ORDER BY CREATED_AT DESC";

			try (Connection connection = DBUtil.getConnection();
					PreparedStatement psmt = connection.prepareStatement(SELECT_COMMENTS_SQL)) {

				psmt.setInt(1, post_idx);
				
				try (ResultSet rs = psmt.executeQuery()) {
					while (rs.next()) {
						CommentDTO comment = new CommentDTO();
						
						comment.setCommentIdx(post_idx);
						comment.setPostIdx(rs.getInt("POST_IDX"));
						comment.setUserId(rs.getString("USER_ID"));
						comment.setCommentContent(rs.getString("CMT_CONTENT"));
						comment.setCommentLikes(rs.getInt("Cmt_likes"));
						comment.setCreatedAt(rs.getTimestamp("CREATED_AT"));
						comment.setUpdatedAt(rs.getTimestamp("UPDATED_AT"));
						commentList.add(comment);
					}
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
			return commentList;
		}
}
