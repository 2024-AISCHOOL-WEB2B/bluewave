<%@page import="com.model.UserDTO"%>
<%@page import="com.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Blue Wave</title>
        <link rel="stylesheet" href="CSS/policyViewST.css" />
    </head>
    <body>
    	<%
		UserDTO info = (UserDTO)session.getAttribute("user");
		%>
        <header>
            <nav>
                <div class="logo">
                    <a href="#">
                        <img src="image/Blue Wave.png" alt="Blue Wave Logo" onclick="redirectToMain()" />
                    </a>
                </div>

                <div class="right-menu">
		        <% if(info != null){ %>
					<a href="LogoutServlet">�α׾ƿ�<a>
				<% }else{ %>
					<a href="login.jsp">�α���</a>
				<% } %>
                </div>
            </nav>
        </header>

        <div class="container">
            <div class="tbl-header">
                <h3 class="h3-tit">�� ���� ���� ��å ���</h3>
            </div>
            <div class="table_wrap">
                <ul class="common_table01 type2">
                    <li>
                        <div class="list_tit">��å ��ȣ</div>
                        <div class="list_cont">bizId</div>
                    </li>
                    <li>
                        <div class="list_tit">��å �о�</div>
                        <div class="list_cont">
                            <span class="txt">bizTycdSel</span>
                        </div>
                    </li>
                    <li>
                        <div class="list_tit">���� ����</div>
                        <div class="list_cont">
                            sporCn
                        </div>
                    </li>
                    <li>
                        <div class="list_tit">��� � �Ⱓ</div>
                        <div class="list_cont">bizPrdCn</div>
                    </li>
                    <li>
                        <div class="list_tit">��� ��û �Ⱓ</div>
                        <div class="list_cont">
                            <!-- Ư���Ⱓ -->

                            rqutPrdCn

                            <br />
                        </div>
                    </li>
                    <li>
                        <div class="list_tit">���� �Ը�(��)</div>
                        <div class="list_cont">sporScvl</div>
                    </li>
                    <li>
                        <div class="list_tit">���</div>
                        <div class="list_cont">
                            �����
                        </div>
                    </li>
                </ul>
            </div>
            <div class="tbl-header">
                <h3 class="h3-tit">��û�ڰ�</h3>
            </div>
            <div class="table_wrap">
                <ul class="common_table01 type2">
                    <li>
                        <div class="list_tit">����</div>
                        <div class="list_cont">ageInfo</div>
                    </li>
                    <li>
                        <div class="list_tit">������ �� �ҵ�</div>
                        <div class="list_cont">
                            prcpCn
                        </div>
                    </li>
                    <li>
                        <div class="list_tit">�з�</div>
                        <div class="list_cont">accrRqisCn</div>
                    </li>
                    <li>
                        <div class="list_tit">����</div>
                        <div class="list_cont">majrRqisCn</div>
                    </li>
                    <li>
                        <div class="list_tit">��� ����</div>
                        <div class="list_cont">empmSttsCn</div>
                    </li>
                    <li>
                        <div class="list_tit">Ưȭ �о�</div>
                        <div class="list_cont">splzRlmRqisCn</div>
                    </li>
                    <li>
                        <div class="list_tit">�߰� �ܼ� ����</div>
                        <div class="list_cont">aditRscn</div>
                    </li>
                    <li>
                        <div class="list_tit">���� ���� ���</div>
                        <div class="list_cont">prcpLmttTrgtCn</div>
                    </li>
                </ul>
            </div>
            <div class="tbl-header">
                <h3 class="h3-tit">��û���</h3>
            </div>
            <div class="table_wrap">
                <ul class="common_table01 type2">
                    <li>
                        <div class="list_tit">��û ����</div>
                        <div class="list_cont">rqutProcCn</div>
                    </li>
                    <li>
                        <div class="list_tit">�ɻ� �� ��ǥ</div>
                        <div class="list_cont">jdgnPresCn</div>
                    </li>
                    <li>
                        <div class="list_tit">��û ����Ʈ</div>
                        <div
                            class="list_cont"
                            style="word-break: break-all"
                        >rqutUrla</div>
                    </li>
                    <li>
                        <div class="list_tit">���� ����</div>
                        <div class="list_cont">pstnPaprCn</div>
                    </li>
                </ul>
            </div>
            <div class="tbl-header">
                <h3 class="h3-tit">��Ÿ</h3>
            </div>
            <div class="table_wrap">
                <ul class="common_table01 type2">
                    <li>
                        <div class="list_tit">��Ÿ ���� ����</div>
                        <div class="list_cont">
                            ��Ÿ������������
                        </div>
                    </li>
                    <li>
                        <div class="list_tit">�ְ� ���</div>
                        <div class="list_cont">mngtMson</div>
                    </li>
                    <li>
                        <div class="list_tit">� ���</div>
                        <div class="list_cont">cnsgNmor</div>
                    </li>
                    <li>
                        <div class="list_tit">������� ���� ����Ʈ 1</div>
                        <div class="list_cont" style="word-break: break-all">
                            rfcSiteUrla1
                        </div>
                    </li>
                    <li>
                        <div class="list_tit">������� ���� ����Ʈ 2</div>
                        <div class="list_cont" style="word-break: break-all">
                            rfcSiteUrla2
                        </div>
                    </li>
                    <li>
                        <div class="list_tit">÷������</div>
                        <div class="list_cont">÷�����ϳ���</div>
                    </li>
                </ul>
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
        <script>
    		function redirectToMain() {
    		    window.location.href = "main.jsp";
    		}  
    	</script>
    </body>
</html>
