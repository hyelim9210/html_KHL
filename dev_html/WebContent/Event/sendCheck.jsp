<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 파라미터로 넘어온 값을 확인하는 페이지를 만들거니까 html내용은 싹 걷어낸다. -->

<%	//스크립틀릿이라고 읽는다.
	String u_id = request.getParameter("mem_name");
	out.print("u_id : " + u_id);
%>