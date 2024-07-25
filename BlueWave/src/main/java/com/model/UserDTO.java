package com.model;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;

public class UserDTO {
    private String userId;
    private String userPw;
    private String userName;
    private String userEmail;
    private String userBirthdate;
    private String userGender;
    private String userJob;
    private int userIncome;
    private int userFamily;
    private String userRegion;
    private String userPolicyInterest;
    private Timestamp createdAt;
    private Timestamp updatedAt;

    public UserDTO() {
    }
    public UserDTO(String userId, String userPw, String userName, String userEmail, String userBirthdate,
                   String userGender, String userJob, int userIncome, int userFamily, String userRegion,
                   String userPolicyInterest, Timestamp createdAt, Timestamp updatedAt) {
        this.userId = userId;
        this.userPw = userPw;
        this.userName = userName;
        this.userEmail = userEmail;
        this.userBirthdate = userBirthdate;
        this.userGender = userGender;
        this.userJob = userJob;
        this.userIncome = userIncome;
        this.userFamily = userFamily;
        this.userRegion = userRegion;
        this.userPolicyInterest = userPolicyInterest;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    // Getters and Setters
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserPw() {
        return userPw;
    }

    public void setUserPw(String userPw) {
        this.userPw = userPw;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserBirthdate() {
        return userBirthdate;
    }

    public void setUserBirthdate(String userBirthdate) {
        this.userBirthdate = userBirthdate;
    }

    public String getUserGender() {
        return userGender;
    }

    public void setUserGender(String userGender) {
        this.userGender = userGender;
    }

    public String getUserJob() {
        return userJob;
    }

    public void setUserJob(String userJob) {
        this.userJob = userJob;
    }

    public int getUserIncome() {
        return userIncome;
    }

    public void setUserIncome(int userIncome) {
        this.userIncome = userIncome;
    }

    public int getUserFamily() {
        return userFamily;
    }

    public void setUserFamily(int userFamily) {
        this.userFamily = userFamily;
    }

    public String getUserRegion() {
        return userRegion;
    }

    public void setUserRegion(String userRegion) {
        this.userRegion = userRegion;
    }

    public String getUserPolicyInterest() {
        return userPolicyInterest;
    }

    public void setUserPolicyInterest(String userPolicyInterest) {
        this.userPolicyInterest = userPolicyInterest;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }

}
