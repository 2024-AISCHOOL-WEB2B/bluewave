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
        <!-- 회원가입 섹션 전체를 감싸는 컨테이너 -->
        <div class="register-container">
            <!-- 배경 텍스트 -->
            <div class="background-text">
                <span>BLUE</span>
                <span>WAVE</span>
            </div>

            <form id="signupForm" onsubmit="return validateForm()">
                <div class="signup-form">
                    <img src="image/Blue Wave.png" alt="logo" />
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
                                <option value="male">남성</option>
                                <option value="female">여성</option>
                                <option value="other">기타</option>
                                <option value="prefer_not_to_say">
                                    선택 안 함
                                </option>
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
                    <div class="form-row">
                        <div class="form-group full-width">
                            <label for="email">이메일</label>
                            <input
                                type="text"
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
                            <select id="employment" name="employment" required>
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
                            <label for="gender">성별</label>
                            <select id="gender" name="gender" required>
                                <option value="">선택하세요</option>
                                <option value="남성">남성</option>
                                <option value="여성">여성</option>
                                <option value="기타">기타</option>
                                <option value="선택안함">선택 안 함</option>
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
                        <div class="form-group full-width">
                            <label for="pay">소득수준</label>
                            <input
                                type="text"
                                id="pay"
                                name="pay"
                                placeholder="만원"
                            />
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="username">아이디</label>
                            <input type="text" id="username" name="username" />
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
                            />
                        </div>
                        <div class="form-group">
                            <label for="passwordConfirm">비밀번호 확인</label>
                            <input
                                type="password"
                                id="passwordConfirm"
                                name="passwordConfirm"
                            />
                        </div>
                    </div>

                    <button type="submit" class="submit-button">
                        <span>BlueWave</span><br />회원가입
                    </button>
                </div>
            </form>
        </div>

        <!-- 웹페이지 최하단 -->
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
            // 가상의 중복 아이디 목록
            const existingUsernames = ["user1", "user2", "user3"];

            function checkUsername() {
                const usernameInput = document.getElementById("username");
                const username = usernameInput.value.trim();
                const button = document.querySelector(
                    'button[onclick="checkUsername()"]'
                );

                // 여기서 실제 서버와 통신하거나, 고정된 목록을 통해 중복을 확인하는 부분
                if (existingUsernames.includes(username)) {
                    alert("이 아이디는 이미 사용 중입니다.");
                } else {
                    alert("이 아이디는 사용 가능합니다.");
                }
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
                var addressSelect =
                    document.getElementById("addressSelect").value;
                var pay = document.getElementById("pay").value;
                var username = document.getElementById("username").value;
                var password = document.getElementById("password").value;
                var passwordConfirm =
                    document.getElementById("passwordConfirm").value;

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

                // 유효성 검사를 통과하면 페이지를 변경함
                window.location.href = "registerSuc.jsp";
                return false; // 폼 제출을 막고 페이지를 이동시킴
            }
        </script>
    </body>
</html>
