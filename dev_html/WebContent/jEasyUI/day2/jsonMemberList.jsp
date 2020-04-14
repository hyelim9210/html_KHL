<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "jeasyui.member.MemberDAO, java.util.List, java.util.Map" %>
<%@ page import = "com.google.gson.Gson" %>
	<%-- 주석은 이 모양으로 써야 jsp의 주석이다. 느낌표로 쓰면 안 된다. --%>
<%
	//스크립틀릿이라고 한다. 여기는 자바의 땅이고 바깥은 html 땅이다.(위의 contentType(mime type)이 html일 때)
	MemberDAO mDao = new MemberDAO();
	List<Map<String, Object>> mList = null;
	mList = mDao.procMemberList();
	Gson g = new Gson();
	String imsi = g.toJson(mList);
	out.print(imsi);
%>
