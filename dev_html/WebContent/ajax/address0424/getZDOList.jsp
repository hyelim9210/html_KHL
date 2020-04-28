<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="orm.dao.SqlMapCommonDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	SqlMapCommonDao cDao = new SqlMapCommonDao();
	List<Map<String, Object>> zdoList = null;
	zdoList = cDao.getZDOList(null);
%>
<select id = "i_zdo">
	<% for(int i=0; i<zdoList.size(); i++){ %>
	<option value= <%= zdoList.get(i).get("ZDO") %> ><%= zdoList.get(i).get("ZDO") %></option>
	<% } %>
</select>
