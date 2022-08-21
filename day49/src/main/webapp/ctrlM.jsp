<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.MemberVO"%>
<jsp:useBean id="mDAO" class="member.MemberDAO"/>
<jsp:useBean id="mVO" class="member.MemberVO"/>
<jsp:setProperty property="*" name="mVO"/>	
	
	
	
	
	
	
<%

		String action=request.getParameter("action");
		System.out.println("로그: "+action);
		
		if(action.equals("login")){
			System.out.println("로그인 로그:" );
			session.removeAttribute("cnt");
			MemberVO member = mDAO.selectOne(mVO);
			if(member!=null){
				session.setAttribute("member", member);
				response.sendRedirect("ctrlB.jsp?action=main");
			}
			else {
				response.sendRedirect("login.jsp");
			}
		}
		else if(action.equals("signUp")){
			System.out.println("회원가입 로그:" );
			session.removeAttribute("cnt");
			if(mDAO.insert(mVO)){
				out.println("<script>alert('회원가입 성공!!');location.href='login.jsp'</script>");
			}
			else{
				out.println("<script>alert('회원가입 실패!!');location.href='login.jsp'</script>");
			}
		}
		else if(action.equals("logout")){
			System.out.println("로그아웃 로그:" );
			session.invalidate();
			response.sendRedirect("cnrlB.jsp?action=main");
		}



%>