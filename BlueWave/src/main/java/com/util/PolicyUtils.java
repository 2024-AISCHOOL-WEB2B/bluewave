package com.util;

public class PolicyUtils {

    public static String getCategory(String policyFieldCode) {
        String category = "-";
        
        switch (policyFieldCode) {
            case "23010" :
            case "023010" :
                category = "일자리 분야";
                break;
            case "23020":
            case "023020":
                category = "주거 분야";
                break;
            case "23030":
            case "023030":
                category = "교육 분야";
                break;
            case "23040":
            case "023040":
                category = "복지.문화 분야";
                break;
            case "23050":
            case "023050":
                category = "참여.권리 분야";
                break;
        }
        
        return category;
    }
}
