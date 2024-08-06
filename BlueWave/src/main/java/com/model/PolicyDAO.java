package com.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.util.DBUtil;

public class PolicyDAO {

	// 키워드and검색용 메서드
	public List<PolicyDTO> getAllPolicies(List<String> keywords, String code, int start, int end) {
		List<PolicyDTO> allPolicies = new ArrayList<>();
		StringBuilder queryBuilder = new StringBuilder(
				"SELECT * FROM (SELECT a.*, ROWNUM r__ FROM " + "(SELECT * FROM ALL_POLICY WHERE 1=1 ");

		for (int i = 0; i < keywords.size(); i++) {
			queryBuilder.append("AND POLICY_NAME LIKE ? ");
		}

		if (code != null && !code.isEmpty()) {
			queryBuilder.append("AND POLICY_FIELD_CODE = ? ");
		}

		queryBuilder.append("ORDER BY TO_NUMBER(SUBSTR(POLICY_ID, 2)) DESC) a " + "WHERE ROWNUM <= ?) WHERE r__ >= ?");

		try (Connection conn = DBUtil.getConnection();
				PreparedStatement stmt = conn.prepareStatement(queryBuilder.toString())) {

			int parameterIndex = 1;
			for (String keyword : keywords) {
				stmt.setString(parameterIndex++, "%" + keyword + "%");
			}

			if (code != null && !code.isEmpty()) {
				stmt.setString(parameterIndex++, code);
			}

			stmt.setInt(parameterIndex++, end);
			stmt.setInt(parameterIndex, start);

			System.out.println("Executing query: " + stmt.toString());
			try (ResultSet rs = stmt.executeQuery()) {
				while (rs.next()) {
					PolicyDTO policy = createPolicyFromResultSet(rs);
					allPolicies.add(policy);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQLException occurred while retrieving policies: " + e.getMessage());
		}

		return allPolicies;
	}

	public int getTotalPolicyCount(List<String> keywords, String code) {
		StringBuilder queryBuilder = new StringBuilder("SELECT COUNT(*) FROM ALL_POLICY WHERE 1=1 ");

		for (int i = 0; i < keywords.size(); i++) {
			queryBuilder.append("AND POLICY_NAME LIKE ? ");
		}

		if (code != null && !code.isEmpty()) {
			queryBuilder.append("AND POLICY_FIELD_CODE = ? ");
		}

		int count = 0;

		try (Connection conn = DBUtil.getConnection();
				PreparedStatement stmt = conn.prepareStatement(queryBuilder.toString())) {

			int parameterIndex = 1;
			for (String keyword : keywords) {
				stmt.setString(parameterIndex++, "%" + keyword + "%");
			}

			if (code != null && !code.isEmpty()) {
				stmt.setString(parameterIndex, code);
			}

			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					count = rs.getInt(1);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return count;
	}

	// 올폴리시 테이블의 전체 행 개수를 가져오는 메서드
	// 전체 청년정책 데이터의 갯수를 표시하기 위함
	public int getTotalPolicyCount() {
		int totalCount = 0;
		String query = "SELECT COUNT(*) FROM ALL_POLICY";

		try (Connection conn = DBUtil.getConnection();
				PreparedStatement stmt = conn.prepareStatement(query);
				ResultSet rs = stmt.executeQuery()) {

			if (rs.next()) {
				totalCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQLException occurred while retrieving total policy count: " + e.getMessage());
		}

		return totalCount;
	}

	// 검색 조건에 맞는 정책 갯수 반환하는 메서드
	public int getTotalPolicyCount(String title, String code) {
		String query = "SELECT COUNT(*) FROM ALL_POLICY WHERE POLICY_NAME LIKE ? "
				+ (code != null && !code.isEmpty() ? "AND POLICY_FIELD_CODE = ? " : "");
		int count = 0;

		try (Connection conn = DBUtil.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {

			stmt.setString(1, "%" + title + "%");
			if (code != null && !code.isEmpty()) {
				stmt.setString(2, code);
			}

			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					count = rs.getInt(1);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return count;
	}

	// 정책 범위에 따라 가져오기
	// 모든 정책을 가져오는 메서드로 설계했지만 성능상의 문제로 범위지정으로 변경했음
	public List<PolicyDTO> getAllPolicies(int start, int end) {
		List<PolicyDTO> allPolicies = new ArrayList<>();
		String query = "SELECT * FROM (SELECT a.*, ROWNUM r__ FROM (SELECT * FROM ALL_POLICY ORDER BY TO_NUMBER(SUBSTR(POLICY_ID, 2)) DESC) a WHERE ROWNUM <= ?) WHERE r__ >= ?";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {

			int limit = end;
			stmt.setInt(1, limit);
			stmt.setInt(2, start);

			System.out.println("Executing query: " + stmt.toString());
			try (ResultSet rs = stmt.executeQuery()) {
				while (rs.next()) {
					PolicyDTO policy = createPolicyFromResultSet(rs);
					allPolicies.add(policy);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQLException occurred while retrieving policies: " + e.getMessage());
		}

		return allPolicies;
	}

	// 정책 범위에 따라 가져오기
	// 키워드 검색기능을 포함한 오버라이딩
	public List<PolicyDTO> getAllPolicies(String title, String code, int start, int end) {
		List<PolicyDTO> allPolicies = new ArrayList<>();
		String query = "SELECT * FROM (SELECT a.*, ROWNUM r__ FROM " + "(SELECT * FROM ALL_POLICY "
				+ "WHERE POLICY_NAME LIKE ? " + (code != null && !code.isEmpty() ? "AND POLICY_FIELD_CODE = ? " : "")
				+ "ORDER BY TO_NUMBER(SUBSTR(POLICY_ID, 2)) DESC) a " + "WHERE ROWNUM <= ?) WHERE r__ >= ?";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {

			int parameterIndex = 1;
			stmt.setString(parameterIndex++, "%" + title + "%");

			if (code != null && !code.isEmpty()) {
				stmt.setString(parameterIndex++, code);
			}

			stmt.setInt(parameterIndex++, end);
			stmt.setInt(parameterIndex, start);

			System.out.println("Executing query: " + stmt.toString());
			try (ResultSet rs = stmt.executeQuery()) {
				while (rs.next()) {
					PolicyDTO policy = createPolicyFromResultSet(rs);
					allPolicies.add(policy);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQLException occurred while retrieving policies: " + e.getMessage());
		}

		return allPolicies;
	}

	// 특정 정책 ID로 정책 가져오기
	public PolicyDTO getPolicyById(String policyId) {
		PolicyDTO policy = null;
		String query = "SELECT * FROM ALL_POLICY WHERE POLICY_ID = ?";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {

			stmt.setString(1, policyId);
			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					policy = createPolicyFromResultSet(rs);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return policy;
	}

	// 여러 정책 ID로 정책 리스트 가져오기
	public List<PolicyDTO> getPoliciesByIds(List<String> policyIds) {
		List<PolicyDTO> policies = new ArrayList<>();
		if (policyIds == null || policyIds.isEmpty()) {
			System.out.println("policyIds is null or empty");
			return policies;
		}

		StringBuilder placeholders = new StringBuilder();
		for (int i = 0; i < policyIds.size(); i++) {
			if (i > 0) {
				placeholders.append(",");
			}
			placeholders.append("?");
		}
		String query = "SELECT * FROM ALL_POLICY WHERE POLICY_ID IN (" + placeholders.toString() + ")";
		System.out.println("Executing query: " + query);

		try (Connection conn = DBUtil.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {

			for (int i = 0; i < policyIds.size(); i++) {
				stmt.setString(i + 1, policyIds.get(i));
				System.out.println("Binding parameter " + (i + 1) + ": " + policyIds.get(i));
			}

			try (ResultSet rs = stmt.executeQuery()) {
				System.out.println("Query executed successfully");
				while (rs.next()) {
					PolicyDTO policy = createPolicyFromResultSet(rs);
					policies.add(policy);
					System.out.println(
							"Found policy with ID: " + policy.getPOLICY_ID() + ", Name: " + policy.getPOLICY_NAME());
				}
			}
		} catch (SQLException e) {
			System.out.println("SQL Exception occurred: " + e.getMessage());
			e.printStackTrace();
		}

		System.out.println("Total policies found: " + policies.size());
		return policies;
	}

	public List<PolicyDTO> getLatestPoliciesByField(String policyFieldCode, int limit) { // 메인페이지 하단용 메서드
		List<PolicyDTO> policies = new ArrayList<>();
		String query = "SELECT * FROM (SELECT a.*, ROWNUM r__ FROM " + "(SELECT * FROM ALL_POLICY "
				+ "WHERE POLICY_FIELD_CODE = ? " + "ORDER BY TO_NUMBER(SUBSTR(POLICY_ID, 2)) DESC) a "
				+ "WHERE ROWNUM <= ?) WHERE r__ >= 1";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {

			stmt.setString(1, policyFieldCode);
			stmt.setInt(2, limit);

			try (ResultSet rs = stmt.executeQuery()) {
				while (rs.next()) {
					PolicyDTO policy = createPolicyFromResultSet(rs);
					policies.add(policy);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQLException occurred while retrieving latest policies by field: " + e.getMessage());
		}

		return policies;
	}

	// ResultSet에서 PolicyDTO 객체 생성
	private PolicyDTO createPolicyFromResultSet(ResultSet rs) throws SQLException {
		PolicyDTO policy = new PolicyDTO();
		String policyId = rs.getString("POLICY_ID");
		policy.setPOLICY_ID(policyId);

		// POLICY_ID 숫자로 변환 처리
		if (policyId != null && policyId.startsWith("R")) {
			try {
				long numericId = Long.parseLong(policyId.substring(1));
				policy.setNumericPolicyId(numericId);
			} catch (NumberFormatException e) {
				System.out.println("Invalid POLICY_ID format: " + policyId);
				// 오류 처리
			}
		}

		policy.setORG_CODE(rs.getString("ORG_CODE"));
		policy.setPOLICY_NAME(rs.getString("POLICY_NAME"));
		policy.setPOLICY_DESC(rs.getString("POLICY_DESC"));
		policy.setSUPPORT_CONTENT(rs.getString("SUPPORT_CONTENT"));
		policy.setSUPPORT_SCALE(rs.getString("SUPPORT_SCALE"));
		policy.setOPERATION_PERIOD(rs.getString("OPERATION_PERIOD"));
		policy.setAPPLICATION_REPEAT_CODE(rs.getString("APPLICATION_REPEAT_CODE"));
		policy.setAPPLICATION_PERIOD(rs.getString("APPLICATION_PERIOD"));
		policy.setAGE_INFO(rs.getString("AGE_INFO"));
		policy.setRESIDENCE_INCOME_CONDITION(rs.getString("RESIDENCE_INCOME_CONDITION"));
		policy.setAPPLICATION_PROCESS(rs.getString("APPLICATION_PROCESS"));
		policy.setPARTICIPATION_LIMIT_TARGET(rs.getString("PARTICIPATION_LIMIT_TARGET"));
		policy.setAPPLICATION_PROCEDURE(rs.getString("APPLICATION_PROCEDURE"));
		policy.setMAIN_DEPARTMENT_NAME(rs.getString("MAIN_DEPARTMENT_NAME"));
		policy.setMAIN_DEPARTMENT_CONTACT(rs.getString("MAIN_DEPARTMENT_CONTACT"));
		policy.setMAIN_DEPARTMENT_PHONE(rs.getString("MAIN_DEPARTMENT_PHONE"));
		policy.setOPERATING_INSTITUTION_NAME(rs.getString("OPERATING_INSTITUTION_NAME"));
		policy.setOPERATING_INSTITUTION_CONTACT(rs.getString("OPERATING_INSTITUTION_CONTACT"));
		policy.setOPERATING_INSTITUTION_PHONE(rs.getString("OPERATING_INSTITUTION_PHONE"));
		policy.setSUBMISSION_DOCUMENTS(rs.getString("SUBMISSION_DOCUMENTS"));
		policy.setEVALUATION_AND_ANNOUNCEMENT(rs.getString("EVALUATION_AND_ANNOUNCEMENT"));
		policy.setAPPLICATION_SITE_URL(rs.getString("APPLICATION_SITE_URL"));
		policy.setREFERENCE_SITE_URL1(rs.getString("REFERENCE_SITE_URL1"));
		policy.setREFERENCE_SITE_URL2(rs.getString("REFERENCE_SITE_URL2"));
		policy.setETC(rs.getString("ETC"));
		policy.setPOLICY_FIELD_CODE(rs.getString("POLICY_FIELD_CODE"));
		policy.setCREATED_AT(rs.getTimestamp("created_at").toString());
		policy.setFETCHED_AT(rs.getTimestamp("fetched_at").toString());

		return policy;
	}

	// 정책필터링 클래스
	public List<PolicyDTO> getFilteredPolicies(String policyFieldCode, String orgCode, String jobKeyword) {
		List<PolicyDTO> policies = new ArrayList<>();
		String baseQuery = "SELECT * FROM ALL_POLICY WHERE POLICY_FIELD_CODE = ? AND ORG_CODE = ? ";
		String jobQuery = "AND POLICY_DESC LIKE ? ";
		String finalQuery = "ORDER BY FETCHED_AT DESC";
		String query = baseQuery + (jobKeyword != null && !jobKeyword.isEmpty() ? jobQuery : "") + finalQuery;

		try (Connection conn = DBUtil.getConnection(); PreparedStatement pstmt = conn.prepareStatement(query)) {

			pstmt.setString(1, policyFieldCode);
			pstmt.setString(2, orgCode);
			if (jobKeyword != null && !jobKeyword.isEmpty()) {
				pstmt.setString(3, "%" + jobKeyword + "%");
			}

			try (ResultSet rs = pstmt.executeQuery()) {
				while (rs.next()) {
					PolicyDTO policy = new PolicyDTO();
					policy.setPOLICY_ID(rs.getString("POLICY_ID"));
					policy.setORG_CODE(rs.getString("ORG_CODE"));
					policy.setPOLICY_NAME(rs.getString("POLICY_NAME"));
					policy.setPOLICY_DESC(rs.getString("POLICY_DESC"));
					policy.setSUPPORT_CONTENT(rs.getString("SUPPORT_CONTENT"));
					policy.setSUPPORT_SCALE(rs.getString("SUPPORT_SCALE"));
					policy.setOPERATION_PERIOD(rs.getString("OPERATION_PERIOD"));
					policy.setAPPLICATION_REPEAT_CODE(rs.getString("APPLICATION_REPEAT_CODE"));
					policy.setAPPLICATION_PERIOD(rs.getString("APPLICATION_PERIOD"));
					policy.setAGE_INFO(rs.getString("AGE_INFO"));
					policy.setRESIDENCE_INCOME_CONDITION(rs.getString("RESIDENCE_INCOME_CONDITION"));
					policy.setAPPLICATION_PROCESS(rs.getString("APPLICATION_PROCESS"));
					policy.setPARTICIPATION_LIMIT_TARGET(rs.getString("PARTICIPATION_LIMIT_TARGET"));
					policy.setAPPLICATION_PROCEDURE(rs.getString("APPLICATION_PROCEDURE"));
					policy.setMAIN_DEPARTMENT_NAME(rs.getString("MAIN_DEPARTMENT_NAME"));
					policy.setMAIN_DEPARTMENT_CONTACT(rs.getString("MAIN_DEPARTMENT_CONTACT"));
					policy.setMAIN_DEPARTMENT_PHONE(rs.getString("MAIN_DEPARTMENT_PHONE"));
					policy.setOPERATING_INSTITUTION_NAME(rs.getString("OPERATING_INSTITUTION_NAME"));
					policy.setOPERATING_INSTITUTION_CONTACT(rs.getString("OPERATING_INSTITUTION_CONTACT"));
					policy.setOPERATING_INSTITUTION_PHONE(rs.getString("OPERATING_INSTITUTION_PHONE"));
					policy.setSUBMISSION_DOCUMENTS(rs.getString("SUBMISSION_DOCUMENTS"));
					policy.setEVALUATION_AND_ANNOUNCEMENT(rs.getString("EVALUATION_AND_ANNOUNCEMENT"));
					policy.setAPPLICATION_SITE_URL(rs.getString("APPLICATION_SITE_URL"));
					policy.setREFERENCE_SITE_URL1(rs.getString("REFERENCE_SITE_URL1"));
					policy.setREFERENCE_SITE_URL2(rs.getString("REFERENCE_SITE_URL2"));
					policy.setETC(rs.getString("ETC"));
					policy.setPOLICY_FIELD_CODE(rs.getString("POLICY_FIELD_CODE"));
					policies.add(policy);
				}
			}

			// 재직상태넣어서 조회했을때 안나오는경우
			if (policies.isEmpty() && (jobKeyword != null && !jobKeyword.isEmpty())) {
				query = baseQuery + finalQuery;
				try (PreparedStatement pstmt2 = conn.prepareStatement(query)) {
					pstmt2.setString(1, policyFieldCode);
					pstmt2.setString(2, orgCode);

					try (ResultSet rs = pstmt2.executeQuery()) {
						while (rs.next()) {
							PolicyDTO policy = new PolicyDTO();
							policy.setPOLICY_ID(rs.getString("POLICY_ID"));
							policy.setORG_CODE(rs.getString("ORG_CODE"));
							policy.setPOLICY_NAME(rs.getString("POLICY_NAME"));
							policy.setPOLICY_DESC(rs.getString("POLICY_DESC"));
							policy.setSUPPORT_CONTENT(rs.getString("SUPPORT_CONTENT"));
							policy.setSUPPORT_SCALE(rs.getString("SUPPORT_SCALE"));
							policy.setOPERATION_PERIOD(rs.getString("OPERATION_PERIOD"));
							policy.setAPPLICATION_REPEAT_CODE(rs.getString("APPLICATION_REPEAT_CODE"));
							policy.setAPPLICATION_PERIOD(rs.getString("APPLICATION_PERIOD"));
							policy.setAGE_INFO(rs.getString("AGE_INFO"));
							policy.setRESIDENCE_INCOME_CONDITION(rs.getString("RESIDENCE_INCOME_CONDITION"));
							policy.setAPPLICATION_PROCESS(rs.getString("APPLICATION_PROCESS"));
							policy.setPARTICIPATION_LIMIT_TARGET(rs.getString("PARTICIPATION_LIMIT_TARGET"));
							policy.setAPPLICATION_PROCEDURE(rs.getString("APPLICATION_PROCEDURE"));
							policy.setMAIN_DEPARTMENT_NAME(rs.getString("MAIN_DEPARTMENT_NAME"));
							policy.setMAIN_DEPARTMENT_CONTACT(rs.getString("MAIN_DEPARTMENT_CONTACT"));
							policy.setMAIN_DEPARTMENT_PHONE(rs.getString("MAIN_DEPARTMENT_PHONE"));
							policy.setOPERATING_INSTITUTION_NAME(rs.getString("OPERATING_INSTITUTION_NAME"));
							policy.setOPERATING_INSTITUTION_CONTACT(rs.getString("OPERATING_INSTITUTION_CONTACT"));
							policy.setOPERATING_INSTITUTION_PHONE(rs.getString("OPERATING_INSTITUTION_PHONE"));
							policy.setSUBMISSION_DOCUMENTS(rs.getString("SUBMISSION_DOCUMENTS"));
							policy.setEVALUATION_AND_ANNOUNCEMENT(rs.getString("EVALUATION_AND_ANNOUNCEMENT"));
							policy.setAPPLICATION_SITE_URL(rs.getString("APPLICATION_SITE_URL"));
							policy.setREFERENCE_SITE_URL1(rs.getString("REFERENCE_SITE_URL1"));
							policy.setREFERENCE_SITE_URL2(rs.getString("REFERENCE_SITE_URL2"));
							policy.setETC(rs.getString("ETC"));
							policy.setPOLICY_FIELD_CODE(rs.getString("POLICY_FIELD_CODE"));
							policies.add(policy);
						}
					}
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return policies;
	}
}