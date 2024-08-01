package com.util;

import java.time.LocalDate;
import java.time.Period;

public class AgeUtil {

    public static int calculateAge(String birthDateString) {
        // 생년월일이 "YYYYMMDD" 형식
        int year = Integer.parseInt(birthDateString.substring(0, 4));
        int month = Integer.parseInt(birthDateString.substring(4, 6));
        int day = Integer.parseInt(birthDateString.substring(6, 8));

        LocalDate birthDate = LocalDate.of(year, month, day);
        LocalDate currentDate = LocalDate.now();

        return Period.between(birthDate, currentDate).getYears();
    }
}
