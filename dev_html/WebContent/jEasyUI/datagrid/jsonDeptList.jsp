<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.dept.DeptDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	DeptDao ddao = new DeptDao();
	List<Map<String, Object>> dlist = null;
	dlist = ddao.deptList();
	
	Gson gs = new Gson();
	String deptList = gs.toJson(dlist);
	out.print(deptList);
	
%>