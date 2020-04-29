<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file = "../day9/JEasyUICommon.jsp" %>
</head>
<body>
	<table id = "dg" class = "easyui-datagrid" data-options = "url:'member.json'" title = "데이터 출력 방법 종류" style="width:400px;">
		<thead>
			<tr><th data-options="field:'name', width:100">이름</th></tr>
		</thead>
		<tbody>
			<tr><td width="150"><% out.print("이성계"); %></td></tr>
		</tbody>
	</table>
 	<table border = 1 width = 400>
		<tr><th>이름</th><th>주소</th></tr>
		<tr><td><% out.print("이성계"); %></td><th><% out.print("서울 금천구"); %></th></tr>
	</table>
</body>
</html>