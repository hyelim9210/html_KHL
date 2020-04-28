<%@page import="orm.dao.SqlMapEmpDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "orm.dao.SqlMapEmpDao" %>
<%@ page import = "java.util.*" %>
<%@page import="com.google.gson.Gson"%>

<%
	SqlMapEmpDao eDao = new SqlMapEmpDao();//이 클래스가 jsonEmpList이 인스턴스화 되었고, jsonEmpList는 객체를 주입 받은 것이다.
	List<Map<String, Object>> eList = eDao.empList(null);
	Gson g = new Gson();
	String imsi = g.toJson(eList);
	out.print(imsi);
%>