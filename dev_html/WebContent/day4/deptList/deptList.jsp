<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- 이게 jsp의 선언문이다. jsp를 사용할 땐 이 코드가 필요하다. -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서 목록</title>
</head>
<body>
	<table border ='1' borderColor = 'red' width = '460'>
	<tr><th>부서번호</th><th>부서명</th><th>지역</th></tr>
	<%
		for(int i=0; i<3; i++){
	%>
	<tr><th>1</th><th>2</th><th>3</th></tr>
	<%
		}
	%>
	</table>
</body>
</html>