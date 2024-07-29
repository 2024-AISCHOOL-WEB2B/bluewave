package com.util;

import java.util.HashMap;
import java.util.Map;

public class CodeUtil {
    private static final Map<String, String> regionCodeMap = new HashMap<>();
    private static final Map<String, String> policyInterestCodeMap = new HashMap<>();
    private static final Map<String, String> jobKeywordMap = new HashMap<>();

    static {
        // 거주지역 코드 매핑
        regionCodeMap.put("서울", "3002001");
        regionCodeMap.put("부산", "3002002");
        regionCodeMap.put("대구", "3002003");
        regionCodeMap.put("인천", "3002004");
        regionCodeMap.put("광주", "3002005");
        regionCodeMap.put("대전", "3002006");
        regionCodeMap.put("울산", "3002007");
        regionCodeMap.put("경기", "3002008");
        regionCodeMap.put("강원", "3002009");
        regionCodeMap.put("충북", "3002010");
        regionCodeMap.put("충남", "3002011");
        regionCodeMap.put("전북", "3002012");
        regionCodeMap.put("전남", "3002013");
        regionCodeMap.put("경북", "3002014");
        regionCodeMap.put("경남", "3002015");
        regionCodeMap.put("제주", "3002016");
        regionCodeMap.put("세종", "3002017");

        // 관심정책분야 코드 매핑
        policyInterestCodeMap.put("일자리", "23010");
        policyInterestCodeMap.put("주거", "23020");
        policyInterestCodeMap.put("교육", "23030");
        policyInterestCodeMap.put("복지&문화", "23040");
        policyInterestCodeMap.put("참여&권리", "23050");

        // 직업 키워드 매핑
        jobKeywordMap.put("미취업자", "미취업");
        jobKeywordMap.put("자영업자", "자영업자");
        jobKeywordMap.put("프리랜서", "프리랜서");
        jobKeywordMap.put("일용근로자", "일용근로자");
        jobKeywordMap.put("창업자", "예비창업자");
        jobKeywordMap.put("단기근로자", "단기근로자");
        jobKeywordMap.put("영농종사자", "영농종사자");
    }

    public static String getRegionCode(String region) {
        return regionCodeMap.getOrDefault(region, "");
    }

    public static String getPolicyInterestCode(String interest) {
        return policyInterestCodeMap.getOrDefault(interest, "");
    }

    public static String getJobCode(String job) {
        return jobKeywordMap.getOrDefault(job, "");
    }
}
