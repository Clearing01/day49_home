<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>

<form action="ctrlM.jsp" method="post">
	<input type="hidden" name="action" value="login">
	<table border="1">
		<tr>
			<td>아이디</td>
			<td><input type="text" name="mid" required></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="mpw" required></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="submit" value="로그인">
			</td>
		</tr>
	</table>
</form>
<hr>
<a href="signUp.jsp">회원가입하기</a> <br>
<a href="ctrlB.jsp?action=main">메인페이지로 이동</a>

</body>
</html>