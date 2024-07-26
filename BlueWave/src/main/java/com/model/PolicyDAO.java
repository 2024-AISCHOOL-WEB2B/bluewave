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
        String query = "SELECT * FROM ALL_POLICY";

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
        String query = "SELECT * FROM ALL_POLICY WHERE POLICY_ID = ?";

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
        
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            for (int i = 0; i < policyIds.size(); i++) {
                stmt.setString(i + 1, policyIds.get(i));
                System.out.println("Binding parameter " + (i+1) + ": " + policyIds.get(i));
            }

            try (ResultSet rs = stmt.executeQuery()) {
                System.out.println("Query executed successfully");
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
                    policy.setCREATED_AT(rs.getString("CREATED_AT"));
                    policy.setUPDATED_AT(rs.getString("UPDATED_AT"));

                    policies.add(policy);
                    System.out.println("Found policy with ID: " + policy.getPOLICY_ID() + ", Name: " + policy.getPOLICY_NAME());
                }
            }
        } catch (SQLException e) {
            System.out.println("SQL Exception occurred: " + e.getMessage());
            e.printStackTrace();
        }

        System.out.println("Total policies found: " + policies.size());
        return policies;
    }
}
