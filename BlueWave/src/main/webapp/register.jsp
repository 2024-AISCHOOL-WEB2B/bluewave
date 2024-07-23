<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>ȸ������</title>
        <link rel="stylesheet" href="CSS/registerST.css" />
    </head>
    <body>
        <!-- ȸ������ ���� ��ü�� ���δ� �����̳� -->
        <div class="register-container">
            <!-- ��� �ؽ�Ʈ -->
            <div class="background-text">
                <span>BLUE</span>
                <span>WAVE</span>
            </div>

            <form id="signupForm" onsubmit="return validateForm()">
                <div class="signup-form">
                    <img src="image/Blue Wave.png" alt="logo" />
                    <h2>
                        �ȳ��ϼ���!<br />ȸ�������� ���� ������ �Է����ּ���.
                    </h2>
                    <br /><br />
                    <div class="form-row">
                        <div class="form-group">
                            <label for="name">�̸�</label>
                            <input type="text" id="name" name="name" required />
                        </div>
                        <div class="form-group">
                            <label for="gender">����</label>
                            <select id="gender" name="gender" required>
                                <option value="">�����ϼ���</option>
                                <option value="male">����</option>
                                <option value="female">����</option>
                                <option value="other">��Ÿ</option>
                                <option value="prefer_not_to_say">
                                    ���� �� ��
                                </option>
                            </select>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group full-width">
                            <label for="birthdate">�������</label>
                            <div class="birthdate-inputs">
                                <input
                                    type="text"
                                    id="birth-year"
                                    name="birth-year"
                                    placeholder="��(4��)"
                                    maxlength="4"
                                    required
                                />
                                <input
                                    type="text"
                                    id="birth-month"
                                    name="birth-month"
                                    placeholder="��"
                                    maxlength="2"
                                    required
                                />
                                <input
                                    type="text"
                                    id="birth-day"
                                    name="birth-day"
                                    placeholder="��"
                                    maxlength="2"
                                    required
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group full-width">
                            <label for="email">�̸���</label>
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
                            <label for="education">�����з�</label>
                            <select id="education" name="education" required>
                                <option value="">�����ϼ���</option>
                                <option value="�����̸�">���� �̸�</option>
                                <option value="������">�� ����</option>
                                <option value="��������">���� ����</option>
                                <option value="������">�� ����</option>
                                <option value="��������">���� ����</option>
                                <option value="��������">���� ����</option>
                                <option value="��������">���� ����</option>
                                <option value="���ڻ�">�����ڻ�</option>
                                <option value="���Ѿ���">���Ѿ���</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="employment">��������</label>
                            <select id="employment" name="employment" required>
                                <option value="">�����ϼ���</option>
                                <option value="������">������</option>
                                <option value="�ڿ�����">�ڿ�����</option>
                                <option value="�������">�������</option>
                                <option value="��������">��������</option>
                                <option value="�Ͽ�ٷ���">�Ͽ�ٷ���</option>
                                <option value="(����)â����">
                                    (����)â����
                                </option>
                                <option value="�ܱ�ٷ���">�ܱ�ٷ���</option>
                                <option value="����������">����������</option>
                                <option value="���Ѿ���">���Ѿ���</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="gender">����</label>
                            <select id="gender" name="gender" required>
                                <option value="">�����ϼ���</option>
                                <option value="����">����</option>
                                <option value="����">����</option>
                                <option value="��Ÿ">��Ÿ</option>
                                <option value="���þ���">���� �� ��</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="addressSelect">��������</label>
                            <select
                                id="addressSelect"
                                name="addressSelect"
                                required
                            >
                                <option value="">�����ϼ���</option>
                                <option value="����">����</option>
                                <option value="�λ�">�λ�</option>
                                <option value="�뱸">�뱸</option>
                                <option value="��õ">��õ</option>
                                <option value="����">����</option>
                                <option value="����">����</option>
                                <option value="���">���</option>
                                <option value="���">���</option>
                                <option value="����">����</option>
                                <option value="���">���</option>
                                <option value="�泲">�泲</option>
                                <option value="����">����</option>
                                <option value="����">����</option>
                                <option value="���">���</option>
                                <option value="�泲">�泲</option>
                                <option value="����">����</option>
                                <option value="����">����</option>
                                <option value="�߾Ӻ�ó">�߾Ӻ�ó</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group full-width">
                            <label for="pay">�ҵ����</label>
                            <input
                                type="text"
                                id="pay"
                                name="pay"
                                placeholder="����"
                            />
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="username">���̵�</label>
                            <input type="text" id="username" name="username" />
                        </div>
                        <div class="form-group">
                            <button
                                type="button"
                                onclick="checkUsername()"
                                id="idcheck"
                            >
                                ���̵� �ߺ�Ȯ��
                            </button>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="password">��й�ȣ</label>
                            <input
                                type="password"
                                id="password"
                                name="password"
                            />
                        </div>
                        <div class="form-group">
                            <label for="passwordConfirm">��й�ȣ Ȯ��</label>
                            <input
                                type="password"
                                id="passwordConfirm"
                                name="passwordConfirm"
                            />
                        </div>
                    </div>

                    <button type="submit" class="submit-button">
                        <span>BlueWave</span><br />ȸ������
                    </button>
                </div>
            </form>
        </div>

        <!-- �������� ���ϴ� -->
        <footer>
            <div class="footer-container">
                <img src="image/Blue Wave.png" alt="Logo" class="footer-logo" />
                <nav class="footer-nav">
                    <a href="#">�� �Ұ�</a>
                    <a href="#">�̿���</a>
                    <a href="#">��������ó����ħ</a>
                    <a href="#">�ý��� ����</a>
                </nav>
            </div>
        </footer>

        <script>
            // ������ �ߺ� ���̵� ���
            const existingUsernames = ["user1", "user2", "user3"];

            function checkUsername() {
                const usernameInput = document.getElementById("username");
                const username = usernameInput.value.trim();
                const button = document.querySelector(
                    'button[onclick="checkUsername()"]'
                );

                // ���⼭ ���� ������ ����ϰų�, ������ ����� ���� �ߺ��� Ȯ���ϴ� �κ�
                if (existingUsernames.includes(username)) {
                    alert("�� ���̵�� �̹� ��� ���Դϴ�.");
                } else {
                    alert("�� ���̵�� ��� �����մϴ�.");
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
                    alert("��� �ʵ带 �Է����ּ���.");
                    return false; // �� ������ ����
                }

                if (password !== passwordConfirm) {
                    alert("��й�ȣ�� ��й�ȣ Ȯ���� ��ġ���� �ʽ��ϴ�.");
                    return false; // �� ������ ����
                }

                // ��ȿ�� �˻縦 ����ϸ� �������� ������
                window.location.href = "registerSuc.jsp";
                return false; // �� ������ ���� �������� �̵���Ŵ
            }
        </script>
    </body>
</html>
