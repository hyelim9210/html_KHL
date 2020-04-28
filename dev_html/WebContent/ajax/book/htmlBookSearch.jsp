<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String book_title = request.getParameter("book_title");
	out.print(book_title);
%>