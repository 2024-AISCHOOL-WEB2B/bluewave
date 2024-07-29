package com.util;

import java.util.HashMap;
import java.util.Map;

public class CodeUtil {
    private static final Map<String, String> regionCodeMap = new HashMap<>();
    private static final Map<String, String> policyInterestCodeMap = new HashMap<>();

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
        // 필요에 따라 추가(중앙부처등의 코드)

        // 관심정책분야 코드 매핑
        policyInterestCodeMap.put("일자리", "23010");
        policyInterestCodeMap.put("주거", "23020");
        policyInterestCodeMap.put("교육", "23030");
        policyInterestCodeMap.put("복지&문화", "23040");
        policyInterestCodeMap.put("참여&권리", "23050");
    }

    public static String getRegionCode(String region) {
        return regionCodeMap.getOrDefault(region, "");
    }

    public static String getPolicyInterestCode(String interest) {
        return policyInterestCodeMap.getOrDefault(interest, "");
    }
}
