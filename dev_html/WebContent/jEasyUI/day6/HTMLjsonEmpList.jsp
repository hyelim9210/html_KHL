<%@page import="orm.dao.SqlMapEmpDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "orm.dao.SqlMapEmpDao" %>
<%@ page import = "java.util.*" %>

<%
	SqlMapEmpDao eDao = new SqlMapEmpDao();//이 클래스가 jsonEmpList이 인스턴스화 되었고, jsonEmpList는 객체를 주입 받은 것이다.
	List<Map<String, Object>> eList = eDao.empList2(7566);
%>
<table border = 1 >
<%
//조회 결과가 없을 때
	if(eList == null){
%>
	<tr>
		<td>조회결과가 없습니다</td>
	</tr>
<%
}
//조회 결과가 있을 때
	else{
		for(int i=0; i<eList.size();i++){
			Map<String, Object> rMap = eList.get(i);
%>
	<tr>
		<td><% out.print(rMap.get("EMPNO")); %></td>
		<td><% out.print(rMap.get("HIREDATE")); %></td>
		<td><% out.print(rMap.get("ENAME")); %></td>
		<td><% out.print(rMap.get("MGR")); %></td>
		<td><% out.print(rMap.get("JOB")); %></td>
		<td><% out.print(rMap.get("DEPTNO")); %></td>
		<td><% out.print(rMap.get("SAL")); %></td>
	</tr>
<%
	}
}
%>
</table>



