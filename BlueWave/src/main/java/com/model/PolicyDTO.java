package com.model;

public class PolicyDTO {
	
	private String POLICY_ID;
	private String ORG_CODE;
	private String POLICY_NAME;
	private String POLICY_DESC;
	private String SUPPORT_CONTENT;
	private String SUPPORT_SCALE;
	private String OPERATION_PERIOD;
	private String APPLICATION_REPEAT_CODE;
	private String APPLICATION_PERIOD;
	private String AGE_INFO;
	private String RESIDENCE_INCOME_CONDITION;
	private String APPLICATION_PROCESS;
	private String PARTICIPATION_LIMIT_TARGET;
	private String APPLICATION_PROCEDURE;
	private String MAIN_DEPARTMENT_NAME;
	private String MAIN_DEPARTMENT_CONTACT;
	private String MAIN_DEPARTMENT_PHONE;
	private String OPERATING_INSTITUTION_NAME;
	private String OPERATING_INSTITUTION_CONTACT;
	private String OPERATING_INSTITUTION_PHONE;
	private String SUBMISSION_DOCUMENTS;
	private String EVALUATION_AND_ANNOUNCEMENT;
	private String APPLICATION_SITE_URL;
	private String REFERENCE_SITE_URL1;
	private String REFERENCE_SITE_URL2;
	private String ETC;
	private String POLICY_FIELD_CODE;
	private String CREATED_AT;
	private String UPDATED_AT;
	
	private long numericPolicyId; //숫자로 변환된 policy_id 를 저장할 변수
	
	
	public String getPOLICY_ID() {
		return POLICY_ID;
	}
	public void setPOLICY_ID(String pOLICY_ID) {
		POLICY_ID = pOLICY_ID;
	}
	public String getORG_CODE() {
		return ORG_CODE;
	}
	public void setORG_CODE(String oRG_CODE) {
		ORG_CODE = oRG_CODE;
	}
	public String getPOLICY_NAME() {
		return POLICY_NAME;
	}
	public void setPOLICY_NAME(String pOLICY_NAME) {
		POLICY_NAME = pOLICY_NAME;
	}
	public String getPOLICY_DESC() {
		return POLICY_DESC;
	}
	public void setPOLICY_DESC(String pOLICY_DESC) {
		POLICY_DESC = pOLICY_DESC;
	}
	public String getSUPPORT_CONTENT() {
		return SUPPORT_CONTENT;
	}
	public void setSUPPORT_CONTENT(String sUPPORT_CONTENT) {
		SUPPORT_CONTENT = sUPPORT_CONTENT;
	}
	public String getSUPPORT_SCALE() {
		return SUPPORT_SCALE;
	}
	public void setSUPPORT_SCALE(String sUPPORT_SCALE) {
		SUPPORT_SCALE = sUPPORT_SCALE;
	}
	public String getOPERATION_PERIOD() {
		return OPERATION_PERIOD;
	}
	public void setOPERATION_PERIOD(String oPERATION_PERIOD) {
		OPERATION_PERIOD = oPERATION_PERIOD;
	}
	public String getAPPLICATION_REPEAT_CODE() {
		return APPLICATION_REPEAT_CODE;
	}
	public void setAPPLICATION_REPEAT_CODE(String aPPLICATION_REPEAT_CODE) {
		APPLICATION_REPEAT_CODE = aPPLICATION_REPEAT_CODE;
	}
	public String getAPPLICATION_PERIOD() {
		return APPLICATION_PERIOD;
	}
	public void setAPPLICATION_PERIOD(String aPPLICATION_PERIOD) {
		APPLICATION_PERIOD = aPPLICATION_PERIOD;
	}
	public String getAGE_INFO() {
		return AGE_INFO;
	}
	public void setAGE_INFO(String aGE_INFO) {
		AGE_INFO = aGE_INFO;
	}
	public String getRESIDENCE_INCOME_CONDITION() {
		return RESIDENCE_INCOME_CONDITION;
	}
	public void setRESIDENCE_INCOME_CONDITION(String rESIDENCE_INCOME_CONDITION) {
		RESIDENCE_INCOME_CONDITION = rESIDENCE_INCOME_CONDITION;
	}
	public String getAPPLICATION_PROCESS() {
		return APPLICATION_PROCESS;
	}
	public void setAPPLICATION_PROCESS(String aPPLICATION_PROCESS) {
		APPLICATION_PROCESS = aPPLICATION_PROCESS;
	}
	public String getPARTICIPATION_LIMIT_TARGET() {
		return PARTICIPATION_LIMIT_TARGET;
	}
	public void setPARTICIPATION_LIMIT_TARGET(String pARTICIPATION_LIMIT_TARGET) {
		PARTICIPATION_LIMIT_TARGET = pARTICIPATION_LIMIT_TARGET;
	}
	public String getAPPLICATION_PROCEDURE() {
		return APPLICATION_PROCEDURE;
	}
	public void setAPPLICATION_PROCEDURE(String aPPLICATION_PROCEDURE) {
		APPLICATION_PROCEDURE = aPPLICATION_PROCEDURE;
	}
	public String getMAIN_DEPARTMENT_NAME() {
		return MAIN_DEPARTMENT_NAME;
	}
	public void setMAIN_DEPARTMENT_NAME(String mAIN_DEPARTMENT_NAME) {
		MAIN_DEPARTMENT_NAME = mAIN_DEPARTMENT_NAME;
	}
	public String getMAIN_DEPARTMENT_CONTACT() {
		return MAIN_DEPARTMENT_CONTACT;
	}
	public void setMAIN_DEPARTMENT_CONTACT(String mAIN_DEPARTMENT_CONTACT) {
		MAIN_DEPARTMENT_CONTACT = mAIN_DEPARTMENT_CONTACT;
	}
	public String getMAIN_DEPARTMENT_PHONE() {
		return MAIN_DEPARTMENT_PHONE;
	}
	public void setMAIN_DEPARTMENT_PHONE(String mAIN_DEPARTMENT_PHONE) {
		MAIN_DEPARTMENT_PHONE = mAIN_DEPARTMENT_PHONE;
	}
	public String getOPERATING_INSTITUTION_NAME() {
		return OPERATING_INSTITUTION_NAME;
	}
	public void setOPERATING_INSTITUTION_NAME(String oPERATING_INSTITUTION_NAME) {
		OPERATING_INSTITUTION_NAME = oPERATING_INSTITUTION_NAME;
	}
	public String getOPERATING_INSTITUTION_CONTACT() {
		return OPERATING_INSTITUTION_CONTACT;
	}
	public void setOPERATING_INSTITUTION_CONTACT(String oPERATING_INSTITUTION_CONTACT) {
		OPERATING_INSTITUTION_CONTACT = oPERATING_INSTITUTION_CONTACT;
	}
	public String getOPERATING_INSTITUTION_PHONE() {
		return OPERATING_INSTITUTION_PHONE;
	}
	public void setOPERATING_INSTITUTION_PHONE(String oPERATING_INSTITUTION_PHONE) {
		OPERATING_INSTITUTION_PHONE = oPERATING_INSTITUTION_PHONE;
	}
	public String getSUBMISSION_DOCUMENTS() {
		return SUBMISSION_DOCUMENTS;
	}
	public void setSUBMISSION_DOCUMENTS(String sUBMISSION_DOCUMENTS) {
		SUBMISSION_DOCUMENTS = sUBMISSION_DOCUMENTS;
	}
	public String getEVALUATION_AND_ANNOUNCEMENT() {
		return EVALUATION_AND_ANNOUNCEMENT;
	}
	public void setEVALUATION_AND_ANNOUNCEMENT(String eVALUATION_AND_ANNOUNCEMENT) {
		EVALUATION_AND_ANNOUNCEMENT = eVALUATION_AND_ANNOUNCEMENT;
	}
	public String getAPPLICATION_SITE_URL() {
		return APPLICATION_SITE_URL;
	}
	public void setAPPLICATION_SITE_URL(String aPPLICATION_SITE_URL) {
		APPLICATION_SITE_URL = aPPLICATION_SITE_URL;
	}
	public String getREFERENCE_SITE_URL1() {
		return REFERENCE_SITE_URL1;
	}
	public void setREFERENCE_SITE_URL1(String rEFERENCE_SITE_URL1) {
		REFERENCE_SITE_URL1 = rEFERENCE_SITE_URL1;
	}
	public String getREFERENCE_SITE_URL2() {
		return REFERENCE_SITE_URL2;
	}
	public void setREFERENCE_SITE_URL2(String rEFERENCE_SITE_URL2) {
		REFERENCE_SITE_URL2 = rEFERENCE_SITE_URL2;
	}
	public String getETC() {
		return ETC;
	}
	public void setETC(String eTC) {
		ETC = eTC;
	}
	public String getPOLICY_FIELD_CODE() {
		return POLICY_FIELD_CODE;
	}
	public void setPOLICY_FIELD_CODE(String pOLICY_FIELD_CODE) {
		POLICY_FIELD_CODE = pOLICY_FIELD_CODE;
	}
	public String getCREATED_AT() {
		return CREATED_AT;
	}
	public void setCREATED_AT(String cREATED_AT) {
		CREATED_AT = cREATED_AT;
	}
	public String getUPDATED_AT() {
		return UPDATED_AT;
	}
	public void setUPDATED_AT(String uPDATED_AT) {
		UPDATED_AT = uPDATED_AT;
	}
	
    public long getNumericPolicyId() {
        return numericPolicyId;
    }

    public void setNumericPolicyId(long numericPolicyId) {
        this.numericPolicyId = numericPolicyId;
    }
	
	
	
	
	
	
	

}
