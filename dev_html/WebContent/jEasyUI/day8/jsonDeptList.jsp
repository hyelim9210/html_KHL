<%@page import="com.google.gson.Gson"%>
<%@page import="orm.dao.SqlMapDeptDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Map, java.util.HashMap, java.util.List" %>
<%
	SqlMapDeptDao dDao = new SqlMapDeptDao();
	List<Map<String, Object>> deptList = dDao.getDeptList(null);
	Gson g = new Gson();
	String result = g.toJson(deptList);
	out.print(result);
	
%>