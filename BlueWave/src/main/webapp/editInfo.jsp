<%@page import="com.model.UserDTO"%>
<%@page import="com.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Blue Wave</title>
<link rel="stylesheet" href="CSS/baseStyle.css">
<style>
    .container {
        max-width: 600px;
        margin: 20px auto;
        padding: 20px;
        background-color: #f5f5f5;
        border-radius: 8px;
        margin-bottom: 120px;
    }
    
    .container h2 {
        position: relative;
        right: 200px;
        margin: 10px;
    }
    
    .title {
        display: flex;
    }
    
    .myInfo {
        background-color: none;
        padding: 20px;
        padding-left: 27px;
        width: 90%;
    }
    
    .profile {
        text-align: center;
        margin-bottom: 20px;
    }
    
    .profile img {
        width: 100px;
        height: 100px;
        border-radius: 50%;
        background-color: #87CEEB;
    }
    
    .profile p {
        margin-top: 10px;
        font-weight: bold;
    }
    
    .info-grid {
        display: flex;
        flex-direction: column;
        gap: 10px;
    }
    
    .info-row {
        display: flex;
        justify-content: space-between;
        padding: 10px 0;
    }
    
    .info-label {
        font-weight: bold;
        width: 150px; /* Adjust as needed */
    }
    
    .infoContent {
    	background-color: #ffffff;
    	padding: 5px;
    	border-radius: 10px;
    	width: 40%;
    	margin-right: 20px;
    	text-align: center;
    }
    
    .infoContentE {
    	background-color: #ffffff;
    	padding: 5px;
    	border-radius: 10px;
    	width: 120%;
    	margin-right: 20px;
    	text-align: center;
    }
    
    .button-group {
        display: flex;
        justify-content: space-between;
        margin-top: 50px;
    }
    
    .button {
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
    
    .button-edit {
        background-color: #008CBA;
        padding: 10px 30px;
        border: none;
        border-radius: 10px;
        position: relative;
        left: 430px;
    }
    
    .info-grid input {
    	border:none;
    	padding: 7px;
    	font-size: 15px;
    }
    
    .info-grid select {
    	border:none;
    	padding: 7px;
    	font-size: 15px;
    	width: 43%;
    }
</style>
<script>
    function validateForm() {
        const birthdate = document.querySelector('input[name="userBirthdate"]').value;
        const income = document.querySelector('input[name="userIncome"]').value;
        const family = document.querySelector('input[name="userFamily"]').value;

        // 정규 표현식으로 8자리 숫자 검증
        const birthdatePattern = /^\d{8}$/;
        const numericPattern = /^\d+$/;

        if (!birthdatePattern.test(birthdate)) {
            alert("생년월일은 8자리 숫자로 입력해 주세요.");
            return false;
        }

        // 생년월일 유효성 검사
        const year = parseInt(birthdate.substring(0, 4), 10);
        const month = parseInt(birthdate.substring(4, 6), 10);
        const day = parseInt(birthdate.substring(6, 8), 10);

        if (!isValidDate(year, month, day)) {
            alert("올바른 생년월일을 입력해주세요.");
            return false;
        }

        if (!numericPattern.test(income)) {
            alert("소득수준은 숫자만 입력해주세요.");
            return false;
        }

        if (!numericPattern.test(family)) {
            alert("가구원수는 숫자만 입력해주세요.");
            return false;
        }

        return true;
    }

    function isValidDate(year, month, day) {
        // month는 1~12 범위여야 하며, day는 해당 월의 일수 범위여야 함
        if (month < 1 || month > 12) return false;

        const daysInMonth = [31, (isLeapYear(year) ? 29 : 28), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
        return day > 0 && day <= daysInMonth[month - 1];
    }

    function isLeapYear(year) {
        // 윤년 계산
        return (year % 4 === 0 && year % 100 !== 0) || (year % 400 === 0);
    }
	function redirectToMain() {
	    window.location.href = "main.jsp";
	} 
</script>

</head>

<body>

	<%
	UserDTO info = (UserDTO) session.getAttribute("user");
	%>
	
	<header>
		<nav>
		    <div class="logo">
		        <a href="#"> <img src="image/Blue Wave.png" alt="Blue Wave Logo"  onclick="redirectToMain()"> </a>
		    </div>
		
		    <div class="right-menu">
		        <%
		        if (info != null) {
		        %>
		            <a class="logNavBtn" href="LogoutServlet">로그아웃</a>
		        <%
		        } else {
		        %>
		            <a class="logNavBtn" href="login.jsp">로그인</a>
		        <%
		        }
		        %>
		    </div>
		</nav>
	</header>
	
	<div class="container">
	    <h2 class="title">내 정보 수정</h2>
	    <form action="UpdateUserServlet" method="post" onsubmit="return validateForm()">
	        <div class="myInfo">
				<div class="profile">
				    <%
				    String gender = info != null ? info.getUserGender() : "";
				    String imagePath = "image/profile.png"; // 기본 이미지
				    if ("M".equals(gender)) {
				        imagePath = "image/male.jpg";
				    } else if ("F".equals(gender)) {
				        imagePath = "image/female.jpg";
				    }
				    %>
				    <img src="<%=imagePath%>" alt="Profile Image">
				    <p><%=info != null ? info.getUserName() : ""%> 회원님<br>안녕하세요.</p>
				</div>
	            <div class="info-grid">
	                <div class="info-row">
	                    <div class="info-label">이름</div>
	                    <input type="text" name="userName" class="infoContent" value="<%=info != null ? info.getUserName() : ""%>" placeholder="이름">
	                    <div class="info-label">성별</div>
	                    <select id="gender" name="userGender" class="infoContent">
	                        <option value="M" <%= "M".equals(info != null ? info.getUserGender() : "") ? "selected" : "" %>>남성</option>
	                        <option value="F" <%= "F".equals(info != null ? info.getUserGender() : "") ? "selected" : "" %>>여성</option>
	                    </select>
	                </div>
	                <div class="info-row">
	                    <div class="info-label">생년월일</div>
	                    <input type="text" name="userBirthdate" class="infoContent" value="<%=info != null ? info.getUserBirthdate() : ""%>" placeholder="생년월일">
	                    <div class="info-label">거주지역</div>
	                    <select id="addressSelect" name="userRegion" class="infoContent">
	                        <option value="">선택하세요</option>
	                        <option value="서울" <%= "서울".equals(info != null ? info.getUserRegion() : "") ? "selected" : "" %>>서울</option>
	                        <option value="부산" <%= "부산".equals(info != null ? info.getUserRegion() : "") ? "selected" : "" %>>부산</option>
	                        <option value="대구" <%= "대구".equals(info != null ? info.getUserRegion() : "") ? "selected" : "" %>>대구</option>
	                        <option value="인천" <%= "인천".equals(info != null ? info.getUserRegion() : "") ? "selected" : "" %>>인천</option>
	                        <option value="광주" <%= "광주".equals(info != null ? info.getUserRegion() : "") ? "selected" : "" %>>광주</option>
	                        <option value="대전" <%= "대전".equals(info != null ? info.getUserRegion() : "") ? "selected" : "" %>>대전</option>
	                        <option value="울산" <%= "울산".equals(info != null ? info.getUserRegion() : "") ? "selected" : "" %>>울산</option>
	                        <option value="경기" <%= "경기".equals(info != null ? info.getUserRegion() : "") ? "selected" : "" %>>경기</option>
	                        <option value="강원" <%= "강원".equals(info != null ? info.getUserRegion() : "") ? "selected" : "" %>>강원</option>
	                        <option value="충북" <%= "충북".equals(info != null ? info.getUserRegion() : "") ? "selected" : "" %>>충북</option>
	                        <option value="충남" <%= "충남".equals(info != null ? info.getUserRegion() : "") ? "selected" : "" %>>충남</option>
	                        <option value="전북" <%= "전북".equals(info != null ? info.getUserRegion() : "") ? "selected" : "" %>>전북</option>
	                        <option value="전남" <%= "전남".equals(info != null ? info.getUserRegion() : "") ? "selected" : "" %>>전남</option>
	                        <option value="경북" <%= "경북".equals(info != null ? info.getUserRegion() : "") ? "selected" : "" %>>경북</option>
	                        <option value="경남" <%= "경남".equals(info != null ? info.getUserRegion() : "") ? "selected" : "" %>>경남</option>
	                        <option value="제주" <%= "제주".equals(info != null ? info.getUserRegion() : "") ? "selected" : "" %>>제주</option>
	                        <option value="세종" <%= "세종".equals(info != null ? info.getUserRegion() : "") ? "selected" : "" %>>세종</option>
	                        <option value="중앙부처" <%= "중앙부처".equals(info != null ? info.getUserRegion() : "") ? "selected" : "" %>>중앙부처</option>
	                    </select>
	                </div>
	                <div class="info-row">
	                    <div class="info-label">이메일</div>
	                    <input type="email" name="userEmail" class="infoContentE" value="<%=info != null ? info.getUserEmail() : ""%>" placeholder="이메일">
	                </div>
	                <div class="info-row">
	                    <div class="info-label">재직상태</div>
	                    <select id="employment" name="userJob" class="infoContentE">
	                        <option value="">선택하세요</option>
	                        <option value="재직자" <%= "재직자".equals(info != null ? info.getUserJob() : "") ? "selected" : "" %>>재직자</option>
	                        <option value="자영업자" <%= "자영업자".equals(info != null ? info.getUserJob() : "") ? "selected" : "" %>>자영업자</option>
	                        <option value="미취업자" <%= "미취업자".equals(info != null ? info.getUserJob() : "") ? "selected" : "" %>>미취업자</option>
	                        <option value="프리랜서" <%= "프리랜서".equals(info != null ? info.getUserJob() : "") ? "selected" : "" %>>프리랜서</option>
	                        <option value="일용근로자" <%= "일용근로자".equals(info != null ? info.getUserJob() : "") ? "selected" : "" %>>일용근로자</option>
	                        <option value="(예비)창업자" <%= "(예비)창업자".equals(info != null ? info.getUserJob() : "") ? "selected" : "" %>> (예비)창업자</option>
	                        <option value="단기근로자" <%= "단기근로자".equals(info != null ? info.getUserJob() : "") ? "selected" : "" %>>단기근로자</option>
	                        <option value="영농종사자" <%= "영농종사자".equals(info != null ? info.getUserJob() : "") ? "selected" : "" %>>영농종사자</option>
	                        <option value="제한없음" <%= "제한없음".equals(info != null ? info.getUserJob() : "") ? "selected" : "" %>>제한없음</option>
	                    </select>
	                    <div class="info-label">관심분야</div>
	                    <select id="policyInterest" name="userInterest" class="infoContentE">
	                        <option value="">선택하세요</option>
	                        <option value="일자리" <%= "일자리".equals(info != null ? info.getUserPolicyInterest() : "") ? "selected" : "" %>>일자리</option>
	                        <option value="주거" <%= "주거".equals(info != null ? info.getUserPolicyInterest() : "") ? "selected" : "" %>>주거</option>
	                        <option value="교육" <%= "교육".equals(info != null ? info.getUserPolicyInterest() : "") ? "selected" : "" %>>교육</option>
	                        <option value="복지.문화" <%= "복지.문화".equals(info != null ? info.getUserPolicyInterest() : "") ? "selected" : "" %>>복지&문화</option>
	                        <option value="참여.권리" <%= "참여.권리".equals(info != null ? info.getUserPolicyInterest() : "") ? "selected" : "" %>>참여&권리</option>
	                    </select>
	                </div>
	                <div class="info-row">
	                    <div class="info-label">소득수준</div>
	                    <input type="text" name="userIncome" class="infoContent" value="<%=info != null ? info.getUserIncome() : ""%>" placeholder="소득수준">
	                    <div class="info-label">가구원수</div>
	                    <input type="text" name="userFamily" class="infoContent" value="<%=info != null ? info.getUserFamily() : ""%>" placeholder="가구원수">
	                </div>
	            </div>
	        </div>
	        <div class="button-group">
	            <button type="submit" class="button-edit">수정하기</button>
	        </div>
	    </form>
	</div>

    <!-- 웹페이지 최하단 -->
    <footer>
        <div class="footer-container">
            <img src="image/Blue Wave.png" alt="Logo" class="footer-logo">
            <nav class="footer-nav">
                <a href="#">팀 소개</a>
                <a href="#">이용약관</a>
                <a href="#">개인정보처리방침</a>
                <a href="#">시스템 문의</a>
            </nav>
        </div>
    </footer>
</body>
</html>
