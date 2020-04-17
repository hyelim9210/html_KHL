<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
	//스크립틀릿에서 선언한 변수는 모두 다 지역변수이다.
		String c_name;
		String db_id = "test";
		String db_pw = "123";
		String db_name = null;
		String u_id = request.getParameter("mem_id");
		//out.print(u_id+"<br>");
		String u_pw = request.getParameter("mem_pw");
		//out.print(u_pw);
		if(u_id.equals(db_id)){//아이디가 존재하니?
			if(u_pw.equals(db_pw)){//비번은?
				db_name = "ttestt";
				
			}else{
				db_name = "비번 틀림";
			}
		}else{//아이디가 없는 경우
			db_name = "아이디 없음";
		}
		out.print(db_name);
	%>
