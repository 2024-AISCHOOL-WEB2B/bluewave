<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>커뮤니티 글 목록</title>
    <link rel="stylesheet" type="text/css" href="communityStyles.css">
</head>
<body>
    <header>
        <h1>커뮤니티 글 목록</h1>
        <button class="write-button" onclick="location.href='write.jsp'">글쓰기</button>
    </header>
    <main>
        <table>
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                </tr>
            </thead>
            <tbody>
                <!-- 예시 데이터 -->
                <tr>
                    <td>1</td>
                    <td><a href="view.jsp?id=1">첫 번째 글 제목</a></td>
                    <td>홍길동</td>
                    <td>2024-07-26</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td><a href="view.jsp?id=2">두 번째 글 제목</a></td>
                    <td>김철수</td>
                    <td>2024-07-25</td>
                </tr>
            </tbody>
        </table>
    </main>
</body>
</html>
