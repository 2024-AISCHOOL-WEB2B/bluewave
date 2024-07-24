package com.model;

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

    // 기본 생성자
    public UserDTO() {}

    // 매개변수가 있는 생성자
    public UserDTO(String userId, String userPw, String userName, String userEmail, String userBirthdate, String userGender, String userJob, int userIncome, int userFamily, String userRegion, String userPolicyInterest) {
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
    }

    // getter 및 setter 메서드
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
}
