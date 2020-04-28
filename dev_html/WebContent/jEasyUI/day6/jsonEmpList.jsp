<%@page import="com.vo.EmpVO"%>
<%@page import="orm.dao.SqlMapEmpDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "orm.dao.SqlMapEmpDao" %>
<%@ page import = "java.util.*" %>
<%@page import="com.google.gson.Gson"%>

<%
	String empno = request.getParameter("empno");
	int iempno = 0;
	if(request.getParameter("empno")!=null){
		iempno = Integer.parseInt(empno);
	}
	SqlMapEmpDao eDao = new SqlMapEmpDao();//이 클래스가 jsonEmpList이 인스턴스화 되었고, jsonEmpList는 객체를 주입 받은 것이다.
	Map<String, Object> pMap = new HashMap<>();
	pMap.put("empno", iempno);
	EmpVO eVO = new EmpVO();
	eVO.empno = iempno;
	List<Map<String, Object>> eList = eDao.empList3(eVO);
	Gson g = new Gson();
	String imsi = g.toJson(eList);
	out.print(imsi);
%>