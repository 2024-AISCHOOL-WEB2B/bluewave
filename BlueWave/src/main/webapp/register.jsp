<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>회원가입</title>
        <link rel="stylesheet" href="CSS/registerST.css" />
    </head>
    <body>
        <div class="register-container">
            <div class="background-text">
                <span>BLUE</span>
                <span>WAVE</span>
            </div>

            <form id="signupForm" action="register" method="POST" onsubmit="return validateForm()">
                <div class="signup-form">
                    <img src="image/Blue Wave.png" alt="logo" onclick="redirectToMain()"/>
                    <h2>
                        안녕하세요!<br />회원가입을 위해 정보를 입력해주세요.
                    </h2>
                    <br /><br />
                    <div class="form-row">
                        <div class="form-group">
                            <label for="name">이름</label>
                            <input type="text" id="name" name="name" required />
                        </div>
                        <div class="form-group">
                            <label for="gender">성별</label>
                            <select id="gender" name="gender" required>
                                <option value="">선택하세요</option>
                                <option value="M">남성</option>
                                <option value="F">여성</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group full-width">
                            <label for="birthdate">생년월일</label>
                            <div class="birthdate-inputs">
                                <input
                                    type="text"
                                    id="birth-year"
                                    name="birth-year"
                                    placeholder="년(4자)"
                                    maxlength="4"
                                    required
                                />
                                <input
                                    type="text"
                                    id="birth-month"
                                    name="birth-month"
                                    placeholder="월"
                                    maxlength="2"
                                    required
                                />
                                <input
                                    type="text"
                                    id="birth-day"
                                    name="birth-day"
                                    placeholder="일"
                                    maxlength="2"
                                    required
                                />
                            </div>
                        </div>
                    </div>
                    <input type="hidden" id="birthdate" name="birthdate" />
                    <div class="form-row">
                        <div class="form-group full-width">
                            <label for="email">이메일</label>
                            <input
                                type="email"
                                id="email"
                                name="email"
                                placeholder="email"
                            />
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="education">최종학력</label>
                            <select id="education" name="education" required>
                                <option value="">선택하세요</option>
                                <option value="고졸미만">고졸 미만</option>
                                <option value="고교재학">고교 재학</option>
                                <option value="고졸예정">고졸 예정</option>
                                <option value="고교졸업">고교 졸업</option>
                                <option value="대학재학">대학 재학</option>
                                <option value="대졸예정">대졸 예정</option>
                                <option value="대학졸업">대학 졸업</option>
                                <option value="석박사">석·박사</option>
                                <option value="제한없음">제한없음</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="employment">재직상태</label>
                            <select id="employment" name="job" required>
                                <option value="">선택하세요</option>
                                <option value="재직자">재직자</option>
                                <option value="자영업자">자영업자</option>
                                <option value="미취업자">미취업자</option>
                                <option value="프리랜서">프리랜서</option>
                                <option value="일용근로자">일용근로자</option>
                                <option value="(예비)창업자">
                                    (예비)창업자
                                </option>
                                <option value="단기근로자">단기근로자</option>
                                <option value="영농종사자">영농종사자</option>
                                <option value="제한없음">제한없음</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="policyInterest">관심정책분야</label>
                            <select
                                id="policyInterest"
                                name="policyInterest"
                                required
                            >
                                <option value="">선택하세요</option>
                                <option value="일자리">일자리</option>
                                <option value="주거">주거</option>
                                <option value="교육">교육</option>
                                <option value="복지.문화">복지&문화</option>
                                <option value="참여.권리">참여&권리</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="addressSelect">거주지역</label>
                            <select
                                id="addressSelect"
                                name="addressSelect"
                                required
                            >
                                <option value="">선택하세요</option>
                                <option value="서울">서울</option>
                                <option value="부산">부산</option>
                                <option value="대구">대구</option>
                                <option value="인천">인천</option>
                                <option value="광주">광주</option>
                                <option value="대전">대전</option>
                                <option value="울산">울산</option>
                                <option value="경기">경기</option>
                                <option value="강원">강원</option>
                                <option value="충북">충북</option>
                                <option value="충남">충남</option>
                                <option value="전북">전북</option>
                                <option value="전남">전남</option>
                                <option value="경북">경북</option>
                                <option value="경남">경남</option>
                                <option value="제주">제주</option>
                                <option value="세종">세종</option>
                                <option value="중앙부처">중앙부처</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="pay">소득수준</label>
                            <input
                                type="number"
                                id="pay"
                                name="pay"
                                placeholder="만원"
                            />
                        </div>

                        <div class="form-group">
                            <label for="familly">가구원수</label>
                            <input
                                type="number"
                                id="familly"
                                name="familly"
                                placeholder="명"
                            />
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="username">아이디</label>
                            <input type="text" id="username" name="username" required/>
                        </div>
                        <div class="form-group">
                            <button
                                type="button"
                                onclick="checkUsername()"
                                id="idcheck"
                            >
                                아이디 중복확인
                            </button>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="password">비밀번호</label>
                            <input
                                type="password"
                                id="password"
                                name="password"
                                required
                            />
                        </div>
                        <div class="form-group">
                            <label for="passwordConfirm">비밀번호 확인</label>
                            <input
                                type="password"
                                id="passwordConfirm"
                                name="passwordConfirm"
                                required
                            />
                        </div>
                    </div>

                    <button type="submit" class="submit-button">
                        <span>BlueWave</span><br />회원가입
                    </button>
                </div>
            </form>
        </div>

        <footer>
            <div class="footer-container">
                <img src="image/Blue Wave.png" alt="Logo" class="footer-logo" />
                <nav class="footer-nav">
                    <a href="#">팀 소개</a>
                    <a href="#">이용약관</a>
                    <a href="#">개인정보처리방침</a>
                    <a href="#">시스템 문의</a>
                </nav>
            </div>
        </footer>


		<script>
		let isUsernameDuplicate = false; //중복확인 결과 여부
		document.addEventListener("DOMContentLoaded", function () {
		    const birthdateInputs = document.querySelector(".birthdate-inputs");
		    const inputs = birthdateInputs.querySelectorAll("input");
		
		    const yearInput = inputs[0];
		    const monthInput = inputs[1];
		    const dayInput = inputs[2];
		
		    // 년도 입력 제한
		    yearInput.addEventListener("input", function () {
		        this.value = this.value.replace(/[^0-9]/g, "").slice(0, 4);
		        if (this.value.length === 4) {
		            const year = parseInt(this.value);
		            if (year < 1900 || year > new Date().getFullYear()) {
		                alert("유효한 년도를 입력해주세요.");
		                this.value = "";
		            }
		        }
		    });
		
		    // 월 입력 제한 및 포맷팅
		    monthInput.addEventListener("input", function () {
		        this.value = this.value.replace(/[^0-9]/g, "").slice(0, 2);
		        const month = parseInt(this.value);
		        if (this.value.length === 2 && (month < 1 || month > 12)) {
		            alert("유효한 월을 입력해주세요.");
		            this.value = "";
		        }
		    });
		
		    // 일 입력 제한 및 포맷팅
		    dayInput.addEventListener("input", function () {
		        this.value = this.value.replace(/[^0-9]/g, "").slice(0, 2);
		        const day = parseInt(this.value);
		        if (this.value.length === 2 && (day < 1 || day > 31)) {
		            alert("유효한 일을 입력해주세요.");
		            this.value = "";
		        }
		    });
		
		    // 포커스를 잃었을 때 한 자리 숫자 앞에 0 추가
		    [monthInput, dayInput].forEach((input) => {
		        input.addEventListener("blur", function () {
		            if (this.value.length === 1) {
		                this.value = this.value.padStart(2, '0');
		            }
		        });
		    });
		
		    // 각 입력 필드의 최대 길이 설정
		    yearInput.setAttribute("maxlength", "4");
		    monthInput.setAttribute("maxlength", "2");
		    dayInput.setAttribute("maxlength", "2");
		
		    // 플레이스홀더 설정
		    yearInput.setAttribute("placeholder", "년(4자리)");
		    monthInput.setAttribute("placeholder", "월");
		    dayInput.setAttribute("placeholder", "일");
		    
		    
		    const usernameInput = document.getElementById("username");
		    usernameInput.addEventListener("input", function() {
		        isUsernameDuplicate = true; // 아이디가 변경되면 중복 상태로 설정
		    });
		    
		    
		});
		
		function checkUsername() {
		    const usernameInput = document.getElementById("username");
		    const username = usernameInput.value.trim();

		    if (username === "") {
		        alert("아이디를 입력해주세요.");
		        return;
		    }

		    const xhr = new XMLHttpRequest();
		    xhr.onreadystatechange = function() {
		        if (xhr.readyState === XMLHttpRequest.DONE) {
		            if (xhr.status === 200) {
		                const response = xhr.responseText;
		                if (response === "exists") {
		                    alert("이 아이디는 이미 사용 중입니다.");
		                    isUsernameDuplicate = true;
		                } else if (response === "available") {
		                    alert("이 아이디는 사용 가능합니다.");
		                    isUsernameDuplicate = false;
		                } else {
		                    alert("중복 확인 중 오류가 발생했습니다.");
		                    isUsernameDuplicate = true;
		                }
		            } else {
		                alert("중복 확인 중 오류가 발생했습니다.");
		                isUsernameDuplicate = true;
		            }
		        }
		    };
		    xhr.open("GET", "CheckUsernameServlet?username=" + encodeURIComponent(username), true);
		    xhr.send();
		}
		
		function validateForm() {
		    var name = document.getElementById("name").value;
		    var birthYear = document.getElementById("birth-year").value;
		    var birthMonth = document.getElementById("birth-month").value;
		    var birthDay = document.getElementById("birth-day").value;
		    var email = document.getElementById("email").value;
		    var education = document.getElementById("education").value;
		    var employment = document.getElementById("employment").value;
		    var gender = document.getElementById("gender").value;
		    var addressSelect = document.getElementById("addressSelect").value;
		    var pay = document.getElementById("pay").value;
		    var familly = document.getElementById("familly").value;
		    var username = document.getElementById("username").value;
		    var password = document.getElementById("password").value;
		    var passwordConfirm = document.getElementById("passwordConfirm").value;
		    var birthdateInput = document.getElementById("birthdate");
		
		    if (
		        !name ||
		        !birthYear ||
		        !birthMonth ||
		        !birthDay ||
		        !email ||
		        !education ||
		        !employment ||
		        !gender ||
		        !addressSelect ||
		        !pay ||
		        !familly ||
		        !username ||
		        !password ||
		        !passwordConfirm
		    ) {
		        alert("모든 필드를 입력해주세요.");
		        return false; // 폼 제출을 막음
		    }
		
		    if (password !== passwordConfirm) {
		        alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
		        return false; // 폼 제출을 막음
		    }
		
		    // 생년월일을 YYYYMMDD 형식으로 결합하여 숨겨진 필드에 설정
		    var birthdate = 
		        birthYear.padStart(4, '0') + 
		        birthMonth.padStart(2, '0') + 
		        birthDay.padStart(2, '0');
		    birthdateInput.value = birthdate;
		    
		    if (isUsernameDuplicate) {
		        alert("중복된 아이디입니다. 다른 아이디를 선택해주세요.");
		        return false;
		    }
		
		    // 유효성 검사를 통과하면 폼을 제출
		    return true;
		}
		
		function redirectToMain() {
		    window.location.href = "main.jsp";
		}  
		</script>



</body>
</html>
