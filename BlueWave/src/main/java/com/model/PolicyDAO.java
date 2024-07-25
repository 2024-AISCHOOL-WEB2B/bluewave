package com.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PolicyDAO {

    private String jdbcURL = "jdbc:oracle:thin:@project-db-stu3.smhrd.com:1524:xe";
    private String jdbcUsername = "Insa5_SpringB_hacksim_2";
    private String jdbcPassword = "aishcool2";
    
    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    // 모든 정책 가져오기
    public List<PolicyDTO> getAllPolicies() {
        List<PolicyDTO> policies = new ArrayList<>();
        String query = "SELECT * FROM Policy";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                PolicyDTO policy = new PolicyDTO();
                policy.setAGE_INFO(rs.getString("age_info"));
                policy.setRESIDENCE_INCOME_CONDITION(rs.getString("residence_income_condition"));
                policy.setAPPLICATION_PROCESS(rs.getString("application_process"));
                policy.setPARTICIPATION_LIMIT_TARGET(rs.getString("participation_limit_target"));
                policy.setAPPLICATION_PROCEDURE(rs.getString("application_procedure"));
                policy.setMAIN_DEPARTMENT_NAME(rs.getString("main_department_name"));
                policy.setMAIN_DEPARTMENT_CONTACT(rs.getString("main_department_contact"));
                policy.setMAIN_DEPARTMENT_PHONE(rs.getString("main_department_phone"));
                policy.setOPERATING_INSTITUTION_NAME(rs.getString("operating_institution_name"));
                policy.setOPERATING_INSTITUTION_CONTACT(rs.getString("operating_institution_contact"));
                policy.setOPERATING_INSTITUTION_PHONE(rs.getString("operating_institution_phone"));
                policy.setSUBMISSION_DOCUMENTS(rs.getString("submission_documents"));
                policy.setEVALUATION_AND_ANNOUNCEMENT(rs.getString("evaluation_and_announcement"));
                policy.setAPPLICATION_SITE_URL(rs.getString("application_site_url"));
                policy.setREFERENCE_SITE_URL1(rs.getString("reference_site_url1"));
                policy.setREFERENCE_SITE_URL2(rs.getString("reference_site_url2"));
                policy.setETC(rs.getString("etc"));
                policy.setPOLICY_FIELD_CODE(rs.getString("policy_field_code"));
                policy.setCREATED_AT(rs.getTimestamp("created_at").toString()); // Timestamp to String
                policy.setUPDATED_AT(rs.getTimestamp("updated_at").toString()); // Timestamp to String

                policies.add(policy);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return policies;
    }

    // 특정 정책 ID로 정책 가져오기
    public PolicyDTO getPolicyById(String policyId) {
        PolicyDTO policy = null;
        String query = "SELECT * FROM Policy WHERE id = ?";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, policyId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    policy = new PolicyDTO();
                    policy.setAGE_INFO(rs.getString("age_info"));
                    policy.setRESIDENCE_INCOME_CONDITION(rs.getString("residence_income_condition"));
                    policy.setAPPLICATION_PROCESS(rs.getString("application_process"));
                    policy.setPARTICIPATION_LIMIT_TARGET(rs.getString("participation_limit_target"));
                    policy.setAPPLICATION_PROCEDURE(rs.getString("application_procedure"));
                    policy.setMAIN_DEPARTMENT_NAME(rs.getString("main_department_name"));
                    policy.setMAIN_DEPARTMENT_CONTACT(rs.getString("main_department_contact"));
                    policy.setMAIN_DEPARTMENT_PHONE(rs.getString("main_department_phone"));
                    policy.setOPERATING_INSTITUTION_NAME(rs.getString("operating_institution_name"));
                    policy.setOPERATING_INSTITUTION_CONTACT(rs.getString("operating_institution_contact"));
                    policy.setOPERATING_INSTITUTION_PHONE(rs.getString("operating_institution_phone"));
                    policy.setSUBMISSION_DOCUMENTS(rs.getString("submission_documents"));
                    policy.setEVALUATION_AND_ANNOUNCEMENT(rs.getString("evaluation_and_announcement"));
                    policy.setAPPLICATION_SITE_URL(rs.getString("application_site_url"));
                    policy.setREFERENCE_SITE_URL1(rs.getString("reference_site_url1"));
                    policy.setREFERENCE_SITE_URL2(rs.getString("reference_site_url2"));
                    policy.setETC(rs.getString("etc"));
                    policy.setPOLICY_FIELD_CODE(rs.getString("policy_field_code"));
                    policy.setCREATED_AT(rs.getTimestamp("created_at").toString()); // Timestamp to String
                    policy.setUPDATED_AT(rs.getTimestamp("updated_at").toString()); // Timestamp to String
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return policy;
    }
}
