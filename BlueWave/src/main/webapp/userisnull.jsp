<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		alert("회원이 아닙니다!");
		if (confirm("회원가입 하시겠습니까?")) {
			window.location.href = "register.jsp";
		} else {
			window.location.href = "main.jsp";
		}
	</script>
</body>
</html>