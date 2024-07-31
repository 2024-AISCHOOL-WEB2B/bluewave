package com.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.DBUtil;

public class RecPolicyDAO {
	
	// 추천된 정책들의 id 가져오기
    public List<String> getRecPolicyIds(String userId) {
        List<String> policyIds = new ArrayList<>();
        String query = "SELECT POLICY_IDX FROM TBL_DL WHERE USER_ID = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, userId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    policyIds.add(rs.getString("POLICY_IDX"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return policyIds;
    }
}
