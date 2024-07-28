package com.model;

import java.sql.*;
import com.util.DBUtil;
import com.util.PasswordUtil;

public class UserDAO {

	private static final String INSERT_USERS_SQL = "INSERT INTO TBL_USER (USER_ID, USER_PW, USER_NAME, USER_EMAIL, USER_BIRTHDATE, USER_GENDER, USER_JOB, USER_INCOME, USER_FAMILY, USER_REGION, USER_POLICY_INTEREST, CREATED_AT, UPDATED_AT) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String LOGIN_SQL = "SELECT * FROM TBL_USER WHERE USER_ID = ?";

	public int register(UserDTO user) {
		int result = 0;
		try (Connection connection = DBUtil.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {

			preparedStatement.setString(1, user.getUserId());
			preparedStatement.setString(2, user.getUserPw());
			preparedStatement.setString(3, user.getUserName());
			preparedStatement.setString(4, user.getUserEmail());
			preparedStatement.setString(5, user.getUserBirthdate());
			preparedStatement.setString(6, user.getUserGender());
			preparedStatement.setString(7, user.getUserJob());
			preparedStatement.setInt(8, user.getUserIncome());
			preparedStatement.setInt(9, user.getUserFamily());
			preparedStatement.setString(10, user.getUserRegion());
			preparedStatement.setString(11, user.getUserPolicyInterest());
			preparedStatement.setTimestamp(12, user.getCreatedAt());
			preparedStatement.setTimestamp(13, user.getUpdatedAt());

			result = preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public UserDTO login(String userId, String password) {
		UserDTO user = null;
		try (Connection connection = DBUtil.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(LOGIN_SQL)) {
			preparedStatement.setString(1, userId);
			ResultSet rs = preparedStatement.executeQuery();

			if (rs.next()) {
				String hashedPassword = rs.getString("USER_PW"); // 해시값
				System.out.println("rs.next()까지는 성공");

				if (PasswordUtil.checkPassword(password, hashedPassword)) { // 인코딩전의비번,해시값과의 비교 메서드가 true면 실행
					String userPw = rs.getString("USER_PW"); // 해시값을 userPW에 저장 >> DTO에도 해시값으로 저장해야한다.
					String userName = rs.getString("USER_NAME");
					String userEmail = rs.getString("USER_EMAIL");
					String userBirthdate = rs.getString("USER_BIRTHDATE");
					String userGender = rs.getString("USER_GENDER");
					String userJob = rs.getString("USER_JOB");
					int userIncome = rs.getInt("USER_INCOME");
					int userFamily = rs.getInt("USER_FAMILY");
					String userRegion = rs.getString("USER_REGION");
					String userPolicyInterest = rs.getString("USER_POLICY_INTEREST");
					java.sql.Timestamp createdAt = rs.getTimestamp("CREATED_AT");
					java.sql.Timestamp updatedAt = rs.getTimestamp("UPDATED_AT");

					user = new UserDTO(userId, userPw, userName, userEmail, userBirthdate, userGender, userJob,
							userIncome, userFamily, userRegion, userPolicyInterest, createdAt, updatedAt);
				} else {
					// 비밀번호 불일치
					System.out.println("Invalid password");
				}
			} else {
				// 사용자 없음
				System.out.println("User not found");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
	
	
	// 사용자 정보 가져오는 클래스 20240728
	public UserDTO getUserById(String userId) {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            String sql = "SELECT * FROM TBL_USER WHERE USER_ID = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                user = new UserDTO();
                user.setUserId(rs.getString("USER_ID"));
                user.setUserPw(rs.getString("USER_PW"));
                user.setUserName(rs.getString("USER_NAME"));
                user.setUserEmail(rs.getString("USER_EMAIL"));
                user.setUserBirthdate(rs.getString("USER_BIRTHDATE"));
                user.setUserGender(rs.getString("USER_GENDER"));
                user.setUserJob(rs.getString("USER_JOB"));
                user.setUserIncome(rs.getInt("USER_INCOME"));
                user.setUserFamily(rs.getInt("USER_FAMILY"));
                user.setUserRegion(rs.getString("USER_REGION"));
                user.setUserPolicyInterest(rs.getString("USER_POLICY_INTEREST"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, pstmt, conn);
        }

        return user;
    }
}
