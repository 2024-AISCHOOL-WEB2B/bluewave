package com.model;

import java.security.Timestamp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpSession;

import com.util.DBUtil;

public class PostDAO {

	// 쿼리문 작성
	private static final String INSERT_POST_SQL = "INSERT INTO TBL_POST VALUES (post_idx_SEQ.nextval, ?, ?, ?,0, SYSDATE, SYSDATE, ?)";
	private static final String SELECT_POST_SQL = "SELECT * FROM TBL_POST WHERE POST_IDX = ? ";
	private static final String select_post_like_sql = "select count(*) from tbl_post_like where post_idx =? ";

	// 객체 생성
	UserDTO user = new UserDTO();
	private ResultSet rs;

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
	public PostDTO postSearch(int post_idx) {
		ResultSet result = null;
		ResultSet resultt = null;
		PostDTO dto = null;

		try (Connection connection = DBUtil.getConnection();
				PreparedStatement psmt = connection.prepareStatement(SELECT_POST_SQL);
				PreparedStatement pm = connection.prepareStatement(select_post_like_sql)) {

			psmt.setInt(1, post_idx);
			pm.setInt(1, post_idx);
			result = psmt.executeQuery();
			resultt = pm.executeQuery();

			while (result.next()) {

				String user_id = result.getString("user_id");
				String post_title = result.getString("post_title");
				String post_content = result.getString("post_content");
				int post_views = result.getInt("post_views");
				String post_file = result.getString("post_file");
				java.sql.Timestamp created_at = result.getTimestamp("created_at");
				java.sql.Timestamp updated_at = result.getTimestamp("updated_at");

				dto = new PostDTO(post_idx, post_title, post_content, post_file, post_views, created_at, updated_at,
						user_id);
			}
			while (resultt.next()) {
				int likecount = resultt.getInt(1);
				dto.setPostLikes(likecount);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}

	// 커뮤니티 홈으로 글 목록 전체 불러오는 메서드
	public List<PostDTO> getAllPosts() {
		List<PostDTO> postList = new ArrayList<>();
		String select_SQL = "SELECT * FROM tbl_post ORDER BY CREATED_AT DESC";
		try {
			Connection connection = DBUtil.getConnection();
			PreparedStatement psmt = connection.prepareStatement(select_SQL);
			rs = psmt.executeQuery();
			while (rs.next()) {
				PostDTO post = new PostDTO();
				post.setPostIdx(rs.getInt("post_idx"));
				post.setUserId(rs.getString("user_id"));
				post.setPostTitle(rs.getString("post_title"));
				post.setPostContents(rs.getString("post_content"));
				post.setPostFile(rs.getString("post_file"));
				post.setCreatedAt(rs.getTimestamp("created_at"));
				post.setUpdatedAt(rs.getTimestamp("updated_at"));
				post.setPostViews(rs.getInt("post_views"));
				postList.add(post);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return postList;

	}

}
