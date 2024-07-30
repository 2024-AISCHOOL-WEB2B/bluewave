<%@page import="com.model.RecPolicyDAO"%>
<%@page import="com.model.UserDTO"%>
<%@page import="com.model.UserDAO"%>
<%@page import="com.model.PolicyDAO"%>
<%@page import="com.model.PolicyDTO"%>
<%@page import="com.util.PolicyUtils"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Optional"%>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Blue Wave</title>
        <link rel="stylesheet" href="CSS/allPolicyST.css" />
        <style>
            .date, .from, .title {
                overflow: hidden;
                white-space: nowrap;
                text-overflow: ellipsis;
                width: 250px; 
                display: inline-block;
            }
            .date {
                overflow: hidden;
                white-space: nowrap;
                text-overflow: ellipsis;
                width: 160px; 
                display: inline-block;
            }
            
			.serch {
			    background-color: #f5f5f5;
			    border-radius: 10px;
			    padding: 20px;
			    margin-bottom: 20px;
			}
			
			.serch form {
			    display: flex;
			    flex-wrap: wrap;
			    gap: 15px;
			    align-items: center;
			}
			
			.serch label {
			    font-weight: bold;
			    margin-right: 10px;
			}
			
			.serch input[type="text"],
			.serch select {
			    padding: 8px 12px;
			    border: none;
			    border-radius: 4px;
			    font-size: 14px;
			    flex: 1;
			    min-width: 200px;
			}
			
			.serch select {
			    appearance: none;
			    background-image: url('data:image/svg+xml;charset=US-ASCII,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%22292.4%22%20height%3D%22292.4%22%3E%3Cpath%20fill%3D%22%23007CB2%22%20d%3D%22M287%2069.4a17.6%2017.6%200%200%200-13-5.4H18.4c-5%200-9.3%201.8-12.9%205.4A17.6%2017.6%200%200%200%200%2082.2c0%205%201.8%209.3%205.4%2012.9l128%20127.9c3.6%203.6%207.8%205.4%2012.8%205.4s9.2-1.8%2012.8-5.4L287%2095c3.5-3.5%205.4-7.8%205.4-12.8%200-5-1.9-9.2-5.5-12.8z%22%2F%3E%3C%2Fsvg%3E');
			    background-repeat: no-repeat;
			    background-position: right 12px top 50%;
			    background-size: 12px auto;
			    padding-right: 30px;
			}
			
			.serch input[type="submit"] {
			    background-color: #007bff;
			    color: white;
			    border: none;
			    padding: 10px 20px;
			    border-radius: 20px;
			    cursor: pointer;
			    font-size: 16px;
			    transition: background-color 0.3s;
			}
			
			.serch input[type="submit"]:hover {
			    background-color: #0056b3;
			}
			
			.addedKeyword {
				background-color: #ffffff;
				border-radius: 12px;
				padding: 10px;
				font-size: 12px;
			}
			
			.keywordDelBtn{
				border: none;
				font-size: 10px;
				padding: 7px;
				border-radius: 20px;
				margin-left: 5px;
			}
			
			.addBtn {
			    padding: 8px 12px;
			    border: none;
			    border-radius: 4px;
			    font-size: 14px;
			    background-color: #69d98d;
			}
			
			@media (max-width: 768px) {
			    .serch form {
			        flex-direction: column;
			        align-items: stretch;
			    }
			
			    .serch input[type="text"],
			    .serch select,
			    .serch input[type="submit"] {
			        width: 100%;
			    }
			}
            
        </style>
    </head>
    <body>
		<%
		    UserDTO info = (UserDTO) session.getAttribute("user");
		
		    String[] keywordsArray = request.getParameterValues("keywords");
		    List<String> keywords = new ArrayList<>();
		    if (keywordsArray != null) {
		        for (String keyword : keywordsArray) {
		            keywords.add(java.net.URLDecoder.decode(keyword, "UTF-8"));
		        }
		    }
		    String code = request.getParameter("code") != null ? request.getParameter("code") : "";
		
		    int currentPage = Optional.ofNullable(request.getParameter("page")).map(Integer::parseInt).orElse(1);
		    int pageSize = 23;
		    int startIndex = (currentPage - 1) * pageSize + 1;
		    int endIndex = startIndex + pageSize - 1;
		
		    PolicyDAO pDAO = new PolicyDAO();
		    List<PolicyDTO> allPolicies = pDAO.getAllPolicies(keywords, code, startIndex, endIndex+1);
		    int totalPolicyCount = pDAO.getTotalPolicyCount(keywords, code);
		    int totalPages = (int) Math.ceil(totalPolicyCount / (double) pageSize);
		%>
        <header>
            <nav>
                <div class="logo">
                    <a href="main.jsp">
                        <img src="image/Blue Wave.png" alt="Blue Wave Logo" />
                    </a>
                </div>
                <div class="right-menu">
                    <% if (info != null) { %>
                        <a href="LogoutServlet">로그아웃</a>
                    <% } else { %>
                        <a href="login.jsp">로그인</a>
                    <% } %>
                </div>
            </nav>
        </header>

        <div class="container">
            <h1>전체 청년정책 보기</h1>


				<div class="serch">
				    <form action="allPolicy.jsp" method="GET" id="searchForm">
				        키워드 <input type="text" id="keywordInput" name="keyword">
				        <button class="addBtn" type="button" onclick="addKeyword()">추가</button>
				        정책 분야
				        <select id="category" name="code">
				            <option value="">선택하세요</option>
				            <option value="23010" <%= "23010".equals(request.getParameter("code")) ? "selected" : "" %>>일자리 분야</option>
				            <option value="23020" <%= "23020".equals(request.getParameter("code")) ? "selected" : "" %>>주거 분야</option>
				            <option value="23030" <%= "23030".equals(request.getParameter("code")) ? "selected" : "" %>>교육 분야</option>
				            <option value="23040" <%= "23040".equals(request.getParameter("code")) ? "selected" : "" %>>복지&문화 분야</option>
				            <option value="23050" <%= "23050".equals(request.getParameter("code")) ? "selected" : "" %>>참여&권리 분야</option>
				        </select>
				        <input type="submit" value="검색">
				    </form>
				    <br>
				    <div class="keywordBox" id="keywordBox"></div>
				</div>
                <div class="in-header">정책 조회결과 <%= totalPolicyCount %>건</div>
                <hr width="100%" />

                <div class="Policy-row">
                    <% for (PolicyDTO policy : allPolicies) { %>
                    <div class="recPolicyList">
                        <div class="policy-info">
                            <h3 class="title"><%= policy.getPOLICY_NAME() %></h3>
                            <p class="from"><%= policy.getMAIN_DEPARTMENT_NAME() %></p>
                            <p class="date">
                                <% if (policy.getAPPLICATION_PERIOD().length() < 3) { %>
                                    상시
                                <% } else { %>
                                    <%= policy.getAPPLICATION_PERIOD() %>
                                <% } %>
                            </p>
                        </div>
                        <div class="botton-info">
                            <div class="policy-actions">
                                <button class="btn view blue" onclick="redirectToPolicyView('<%= policy.getPOLICY_ID() %>')">
                                    상세보기
                                </button>
                            </div>
                            <div class="policy-category">
                                <span class="cate"><%= PolicyUtils.getCategory(policy.getPOLICY_FIELD_CODE()) %></span>
                            </div>
                        </div>
                    </div>
                    <% } %>
                </div>

                <!-- 페이지 네비게이션 -->
                <div class="pagination">
                    <% if (currentPage > 1) { %>
                    <button class="prev" onclick="redirectToPage(<%= currentPage - 1 %>)">&lt;</button>
                    <% } %>
                    <% if (currentPage < totalPages) { %>
                    <button class="next" onclick="redirectToPage(<%= currentPage + 1 %>)">&gt;</button>
                    <% } %>
                </div>
            </div>
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
            function redirectToPolicyView(policyId) {
                console.log("Redirecting to policy view with ID: " + policyId);
                window.location.href = "policyView.jsp?policyId=" + policyId;
            }

            let keywords = [];

            function addKeyword() {
                const keyword = document.getElementById('keywordInput').value.trim();
                if (keyword && !keywords.includes(keyword)) {
                    keywords.push(keyword);
                    updateKeywordBox();
                    document.getElementById('keywordInput').value = '';
                }
            }

            function removeKeyword(encodedKeyword) {
                const keyword = decodeURIComponent(encodedKeyword);
                keywords = keywords.filter(k => k !== keyword);
                updateKeywordBox();
            }

            function updateKeywordBox() {
                const keywordBox = document.getElementById('keywordBox');
                let htmlContent = '';
                for (let i = 0; i < keywords.length; i++) {
                    const keyword = encodeURIComponent(keywords[i]);
                    htmlContent += '<span class="addedKeyword">' + decodeURIComponent(keywords[i]) + 
                                   ' <button class="keywordDelBtn" onclick="removeKeyword(\'' + keyword + '\')">X</button></span> ';
                }
                keywordBox.innerHTML = htmlContent;
            }
            
            function redirectToPage(page) {
                var form = document.createElement('form');
                form.method = 'GET';
                form.action = 'allPolicy.jsp';

                var pageInput = document.createElement('input');
                pageInput.type = 'hidden';
                pageInput.name = 'page';
                pageInput.value = page;
                form.appendChild(pageInput);

                // 현재 선택된 카테고리 추가
                var category = document.getElementById('category').value;
                var categoryInput = document.createElement('input');
                categoryInput.type = 'hidden';
                categoryInput.name = 'code';
                categoryInput.value = category;
                form.appendChild(categoryInput);

                // 키워드 추가
                keywords.forEach(function(keyword) {
                    var keywordInput = document.createElement('input');
                    keywordInput.type = 'hidden';
                    keywordInput.name = 'keywords';
                    keywordInput.value = encodeURIComponent(keyword);
                    form.appendChild(keywordInput);
                });

                document.body.appendChild(form);
                form.submit();
            }

            // 페이지 로드 시 URL 파라미터에서 키워드 복원
            window.onload = function() {
                var urlParams = new URLSearchParams(window.location.search);
                var keywordsFromUrl = urlParams.getAll('keywords');
                keywords = keywordsFromUrl.map(keyword => decodeURIComponent(keyword));
                updateKeywordBox();
            }

            document.getElementById('searchForm').onsubmit = function() {
                keywords.forEach((keyword, index) => {
                    const input = document.createElement('input');
                    input.type = 'hidden';
                    input.name = 'keywords';
                    input.value = encodeURIComponent(keyword);
                    this.appendChild(input);
                });
                return true;
            };
        </script>
    </body>
</html>