<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="orm.dao.SqlMapCommonDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	SqlMapCommonDao cDao = new SqlMapCommonDao();
	Map<String, Object> guMap = new HashMap<>();
	if(request.getParameter("zdo") != null){
		guMap.put("zdo", request.getParameter("zdo"));
	}
	List<Map<String, Object>> guList = cDao.getSiGuList(guMap);
	Gson g = new Gson();
	String guResult = g.toJson(guList);
//	out.print(guResult);
%>
<select id = "i_sigu">
	<% for(int i=0; i<guList.size(); i++){ %>
	<option value= <%= guList.get(i).get("SIGU") %> ><%= guList.get(i).get("SIGU") %></option>
	<% } %>
</select>
