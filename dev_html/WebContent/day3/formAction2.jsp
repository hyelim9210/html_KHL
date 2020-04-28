<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 땅 자체는 html땅이다 -->

<%
/* 이렇게 생긴 땅이 자바 땅이다. */
	String mem_id = request.getParameter("mem_name");
	out.print(mem_id);
%>
</body>
</html>