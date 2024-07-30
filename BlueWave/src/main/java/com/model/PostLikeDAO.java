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
	private static final String UPDATE_POSTLIKE_SQL = "UPDATE TBL_POST SET POST_LIKES=? WHERE POST_IDX = ?";
	private static final String INSERT_POSTLIKE_SQL = "INSERT INTO TBL_POST_LIKE VALUES(post_idx_seq.NEXTVAL,?,?,SYSDATE)";

	static UserDTO user = new UserDTO();
	static PostDTO post = new PostDTO();
	static ResultSet rs = null;

	// 좋아요 누르는 메서드
	public static int like(String likeuser_id, int postIdx) {
		Connection connection;
		int result = 0;
		try {
			connection = DBUtil.getConnection();
			// 1. 조회
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_POSTLIKE_SQL);

			preparedStatement.setString(1, likeuser_id);
			preparedStatement.setInt(2, postIdx);

			rs = preparedStatement.executeQuery();
			// 2. 좋아요 기록없으면
			if (!rs.next()) {
				// 좋아요 올리고
				System.out.println("좋아요 누른 기록 없음");

				// postlike 테이블에 추가
				preparedStatement = connection.prepareStatement(INSERT_POSTLIKE_SQL);
				preparedStatement.setInt(1, postIdx);
				preparedStatement.setString(2, likeuser_id);

				int insertcnt = preparedStatement.executeUpdate();

				if (insertcnt > 0) {
					System.out.println("좋아요테이블에 기록 추가 성공");
				} else {
					System.out.println("좋아요테이블에 기록 추가 실패");
				}

				System.out.println("좋아요 업데이트 완료!");
				result = 1;
				// 3. 좋아요 기록 있으면
			} else {
				System.out.println("이미 좋아요를 누른 게시물입니다.");
				result = 0; // 이미 좋아요 있음

			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("db연결실패");
		}return result;
	}
}