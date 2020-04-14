<%@page import="project.restaurant.RestaurantDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*, com.google.gson.Gson" %>
<%-- page directive 라고 읽는다. 여기에 코드를 적어서 import 한다. -->
<%-- jsp에서는 주석을 이렇게 달자 --%>
 <%
 	//스크립틀릿 - 자바코드를 쓸 수 있는 땅이다.
 	RestaurantDao rDao = new RestaurantDao();
 	List<Map<String, Object>> mrList = rDao.mapRestList();
 	Gson g = new Gson();
 	String imsi = g.toJson(mrList);
 	out.print(imsi);
 %>