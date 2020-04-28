<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="orm.dao.SqlMapCommonDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	SqlMapCommonDao sDao = new SqlMapCommonDao();
	Map<String, Object> pMap = new HashMap<>();
	if(request.getParameter("input") != null){
		pMap.put("input",request.getParameter("input"));
	}
	List<Map<String, Object>> zipcodeList = sDao.getZipcode(pMap);
	Gson g = new Gson();
	String result = g.toJson(zipcodeList);
	out.print(result);
	
%>
			