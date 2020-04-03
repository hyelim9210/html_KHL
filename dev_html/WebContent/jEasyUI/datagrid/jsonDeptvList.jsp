<%@page import="com.dept.DeptVO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.dept.DeptDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	DeptDao ddao = new DeptDao();
	List<DeptVO> dvlist = null;
	dvlist = ddao.deptvList();
	
	Gson gs = new Gson();
	String deptvList = gs.toJson(dvlist);
	out.print(deptvList);
	
%>