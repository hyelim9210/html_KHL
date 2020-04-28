<%@page import="com.google.gson.GsonBuilder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List, java.util.ArrayList" %>
<%@ page import = "java.util.Map, java.util.HashMap" %>
<%@ page import = "com.util.DBConnectionMgr" %>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet"%>
<%
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	DBConnectionMgr dbMgr = DBConnectionMgr.getInstance();
	
	StringBuilder sql = new StringBuilder();
	sql.append("SELECT 1 as \"ck\", deptno, dname, loc FROM dept");
	List<Map<String, String>> dList = new ArrayList<>();
	
	try{
		con = dbMgr.getConnection();
		pstmt = con.prepareStatement(sql.toString());
		rs = pstmt.executeQuery();
		Map<String, String> dMap = null;
		while(rs.next()){
			dMap = new HashMap<>();
			dMap.put("ck", rs.getString("ck"));
			dMap.put("deptno", Integer.toString(rs.getInt("deptno")));
			dMap.put("dname", rs.getString("dname"));
			dMap.put("loc", rs.getString("loc"));
			dList.add(dMap);
		}
	} catch(Exception e){
		e.printStackTrace();
	}
	
	Gson g = new GsonBuilder().setPrettyPrinting().create();
	String deptList = g.toJson(dList);
	out.print(deptList);
%>