<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.BoardSet, java.util.ArrayList"%>
<jsp:useBean id="bDAO" class="board.BoardDAO"/>    
<jsp:useBean id="bVO" class="board.BoardVO"/>    
<jsp:useBean id="rVO" class="board.ReplyVO"/>
<jsp:setProperty property="*" name="bVO"/>    
<jsp:setProperty property="*" name="rVO"/>    
    
<%   
    
     
	String action=request.getParameter("action");
	System.out.println("로그: "+action);
	String cnt=(String)session.getAttribute("cnt");
	System.out.println("로그: "+cnt);
	if(cnt==null){
		cnt="2";
		session.setAttribute("cnt", cnt);
	}
	else {
		if(request.getParameter("cnt")!=null){
		cnt=Integer.parseInt(cnt)+Integer.parseInt(request.getParameter("cnt"))+"";
		session.setAttribute("cnt", cnt);
		}
	}	
	
		if(action.equals("main")){
			System.out.println("메인 로그:" );
			bVO.setCnt(Integer.parseInt(cnt));
			System.out.println("cnt 로그: "+cnt);
			ArrayList<BoardSet> datas=bDAO.selectAll(bVO);
			request.setAttribute("datas", datas);
			pageContext.forward("main.jsp"); // forward 액션
		}
    	else if(action.equals("insertB")){
			System.out.println("insertB 로그:" );
			if(bDAO.insert(bVO)){
				response.sendRedirect("ctrlB.jsp?action=main");
			}
			else{
				throw new Exception("insertB 오류");
			}
    	}
    	else if(action.equals("insertR")){
			System.out.println("insertR 로그:" );
			if(bDAO.insert_R(rVO)){
				response.sendRedirect("ctrlB.jsp?action=main");
			}
			else{
				throw new Exception("insertR 오류");
			}
    	}
    	else if(action.equals("deleteB")){
			System.out.println("deleteB 로그:" );
			if(bDAO.delete(bVO)){
				response.sendRedirect("ctrlB.jsp?action=main");
			}
			else{
				throw new Exception("deleteB 오류");
			}
    	}
		else if(action.equals("deleteR")){
			System.out.println("deleteR 로그:" );
			if(bDAO.delete_R(rVO)){
				response.sendRedirect("ctrlB.jsp?action=main");
			}
			else{
				throw new Exception("deleteR 오류");
			}
    	}
		else if(action.equals("logout")){
			session.invalidate();
			response.sendRedirect("ctrlB.jsp?action=main");
		}
    
    
    
%>		