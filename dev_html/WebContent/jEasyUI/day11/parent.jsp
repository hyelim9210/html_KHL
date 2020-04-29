<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file = "../day9/JEasyUICommon.jsp" %>
<script type="text/javascript" src = "../../js/commons.js"></script>
<script type="text/javascript">
	function test(p_url, p_width, p_heigh, p_name){
		cmm_window_popup(p_url, p_width, p_heigh, p_name);
	}
	function fun(){
		alert("fun 호출 성공");
		url:"../day5/jsonEmpList.jsp"
	}
</script>
<%
	List<Map<String, Object>> rList = new ArrayList<>();
	Map<String, Object> rMap = new HashMap<>();
	rMap.put("name", "이성계");
	rList.add(rMap); 
	rMap = new HashMap<>();
	
	rMap.put("name", "김춘추");
	rList.add(rMap);
	rMap = new HashMap<>();
	
	rMap.put("name", "김유신");
	rList.add(rMap);
	
%>
</head>
<body>
	<table border = '1' class = "easyui-datagrid" title="데이터출력" style = "width:600x">
		<thead>
			<tr><th data-options="field:'name', width:100">이름</th></tr>
		</thead>
		<tbody>
			<%
				for(int i = 0; i<rList.size(); i++){
					Map<String, Object> rMap2 = rList.get(i);
			%>
					<tr><td width = "150"><% out.print(rMap2.get("name")); %></td></tr>
			<%
				}
			%>
		</tbody>
	</table>
	
	<table id = "dg" class = "easyui-datagrid" title = "데이터 출력 방법 종류" style="width:400px;">
		<thead>
			<tr><th data-options="field:'name', width:100">이름</th></tr>
		</thead>
		<tbody>
			<tr><td><% out.print("이성계"); %></td></tr>
		</tbody>
	</table>
	<table border = 1 width = 400>
		<tr><th>이름</th><th>주소</th></tr>
		<tr><td><% out.print("이성계"); %></td><th><% out.print("서울 금천구"); %></th></tr>
	</table>
	<button onclick="test('child2.jsp','700','450','childWindow')">등록</button>
</body>
</html>