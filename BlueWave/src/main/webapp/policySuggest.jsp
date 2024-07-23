<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Blue Wave</title>
        <link rel="stylesheet" href="CSS/policySuggestST.css" />
    </head>
    <body>
        <header>
            <nav>
                <div class="logo">
                    <a href="#">
                        <img src="image/Blue Wave.png" alt="Blue Wave Logo" />
                    </a>
                </div>

                <div class="right-menu">
                    <a href="mypage.jsp">������</a>
                </div>
            </nav>
        </header>

        <div class="container">
            <!-- ���� ��å ��õ ���� -->
            <h2 class="title">���� ��å ��õ</h2>
            <section class="policy-recommendation">
                <p class="promptText">
                    XXX���� XX�� �����Ͻô� XX�� û���̼���. <br />
                    ȸ������ �з°� �������µ��� ���������, <br />
                    �Ʒ� ��å���� ��ǿ� ���������� ����˴ϴ�. <br /><br />
                    ���� �����ϱ⿣
                    <span class="highlight">û�� ���õ帲 û��Ư���ڱ�</span>
                    ��å�� ���� ������ �� �� �����ϴ�.
                </p>
            </section>

            <hr width="60%" />

            <!-- ��å ����Ʈ ���� -->
            <section class="policy-list">
                <!-- û�� ���õ帲 ��å �׸� -->
                <div class="bestPolicy">
                    <div class="policy-info">
                        <h3>û�� ���õ帲 û��Ư���ڱ�</h3>
                        <p class="from">���������</p>
                        <p class="date">��24.04.29~��24.05.28</p>
                    </div>
                    <div class="policy-actions">
                        <button class="btn view">�󼼺���</button>
                    </div>
                </div>

                <hr width="86%" />

                <!-- ���� ���� ��å����Ʈ -->
                <div class="Policy-row">
                    <div class="recPolicyList">
                        <div class="policy-info">
                            <h3>������û���� ���б�����</h3>
                            <p class="from">���ֱ�����</p>
                            <p class="date">��24.04.29~��24.05.28</p>
                        </div>
                        <div class="policy-actions">
                            <button class="btn view blue">�󼼺���</button>
                        </div>
                    </div>

                    <div class="recPolicyList">
                        <div class="policy-info">
                            <h3>������û���� ���б�����</h3>
                            <p class="from">���ֱ�����</p>
                            <p class="date">��24.04.29~��24.05.28</p>
                        </div>
                        <div class="policy-actions">
                            <button class="btn view blue">�󼼺���</button>
                        </div>
                    </div>
                </div>
                <!-- �߰� ��å �׸���� �� ������ �ݺ� -->
            </section>

            <!-- ������ �׺���̼� -->
            <div class="pagination">
                <button class="prev">&lt;</button>
                <button class="next">&gt;</button>
            </div>
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
    </body>
</html>