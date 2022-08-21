<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="member" class="member.MemberVO" scope="session" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>
<body>

	<div id="header">
		<h1>작은 티모</h1>

<%
	if(member.getMid()!=null){
%>
	<h1>${member.mname}님, 반갑습니다!</h1>
	<a href="ctrlB.jsp?action=logout">로그아웃</a> <br><br>
<%
	} else {
%>
	<h1>GUEST님, 반갑습니다!</h1>
<%
	}
%>
		<div class="gnb">
			<ul>
				<li><a>메인으로</a></li>
				<li><a href="signUp.jsp">회원가입</a></li>
				<li><a href="login.jsp">로그인</a></li>
			</ul>
		</div>	
	</div>

	<div id="wrapper">
		<div id="content">
			<h2>글 등록하기</h2>
			<form action="ctrlB.jsp" method="post">
				<input type="hidden" name="action" value="insertB">
				<input type="hidden" name="mid" value="${member.mid}">
				<input type="text" name="msg">
				<input type="submit" value="글 등록">
				<!-- 만약에, 로그인을 하지않았다면, 로그인후에 이용하세요! -->
			</form>
		</div>
		<%
			if(request.getAttribute("datas")==null){
		%>
			<p>게시글이 없습니다....</p>			
		<%
			} else {
		%>
		<div id="main">
			<h2>글 목록보기</h2>
			<c:forEach var="v" items="${datas}">
				<c:set var="b" value="${v.boardVO}" />
				<h3>[${b.mid}] ${b.msg} [ 좋아요 ${b.favcnt} | 댓글 ${b.rcnt} ]

					<a href="ctrlB.jsp?action=deleteB&bid=${b.bid}">삭제</a>

				</h3>
				<div class="reply">
					<ul>
						<c:forEach var="r" items="${v.rList}">
							<li>[${r.mid}] ${r.rmsg}
								
								<a href="ctrlB.jsp?action=deleteR&rid=${r.rid}">삭제</a>

							</li>
						</c:forEach>				
					</ul>
				</div>					
				<div class="reply">
					<form action="ctrlB.jsp?action=insertR" method="post">
						<input type="hidden" name="mid" value="${member.mid}">
						<input type="hidden" name="bid" value="${b.bid}">
						<input type="text" name="rmsg">
						<input type="submit" value="댓글 등록">
					</form>
				</div>
			</c:forEach>
		
		</div>
		<a href="ctrlB.jsp?action=main&cnt=2">더보기&gt;&gt;</a>	
	</div>
		<%
			}
		%>
	<footer id="footer">
		회사소개 | 이용약관 | <Strong>개인정보처리방침</Strong> | 보호정책 | 고객센터 <Strong>ⓒ Corp.</Strong>	
	</footer>

<script type="text/javascript">



</script>	
</body>
</html>