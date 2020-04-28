<%@page import="java.util.HashMap"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="orm.dao.SqlMapCommonDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	SqlMapCommonDao cDao = new SqlMapCommonDao();
	Map<String, Object> dongMap = new HashMap<>();
	if(request.getParameter("zdo") != null){
		dongMap.put("zdo", request.getParameter("zdo"));
	}
	if(request.getParameter("sigu") != null){
		dongMap.put("sigu", request.getParameter("sigu"));
	}
	List<Map<String, Object>> dongList = null;
	dongList = cDao.getDongList(dongMap);
	Gson g = new Gson();
	String dongResult = g.toJson(dongList);
//	out.print(dongResult);
%>
<select id = "i_dong">
	<% for(int i=0; i<dongList.size(); i++){ %>
	<option value= <%= dongList.get(i).get("DONG") %> ><%= dongList.get(i).get("DONG") %></option>
	<% } %>
</select>