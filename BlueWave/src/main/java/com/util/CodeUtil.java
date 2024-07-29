package com.util;

import java.util.HashMap;
import java.util.Map;

public class CodeUtil {
    private static final Map<String, String> regionCodeMap = new HashMap<>();
    private static final Map<String, String> policyInterestCodeMap = new HashMap<>();

    static {
        // 거주지역 코드 매핑
        regionCodeMap.put("강원", "3001001");
        regionCodeMap.put("광주", "3001002");
        regionCodeMap.put("경북", "3001003");
        regionCodeMap.put("인천", "3001004");
        regionCodeMap.put("전남", "3001005");
        regionCodeMap.put("대전", "3001006");
        regionCodeMap.put("경남", "3001007");
        regionCodeMap.put("서울", "3001008");
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
