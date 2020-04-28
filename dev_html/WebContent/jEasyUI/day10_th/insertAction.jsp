<%@page import="com.dept.HashMapBinder"%>
<%@page import="orm.dao.SqlMapEmpDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int empno = 0;
	String ename = "";
	String job = "";
	int mgr = 0;
	String hiredate = "";
	int sal    = 0;
	int comm   = 0;
	int deptno = 0;
	//Map<String, String[]> pMap = null;
/* 	if(request.getParameter("empno")!=null){
		empno = Integer.parseInt(request.getParameter("empno"));
		pMap.put("empno", empno);
	}
	if(request.getParameter("ename")!=null){
		ename = request.getParameter("ename");
		pMap.put("ename", ename);
	}
	if(request.getParameter("job")!=null){
		job = request.getParameter("job");
		pMap.put("job", job);
	}
	if(request.getParameter("mgr")!=null){
		mgr = Integer.parseInt(request.getParameter("mgr"));
		pMap.put("mgr", mgr);
	}
	if(request.getParameter("hiredate")!=null){
		hiredate = request.getParameter("hiredate");
		pMap.put("hiredate", hiredate);
	}
	if(request.getParameter("sal")!=null){
		sal = Integer.parseInt(request.getParameter("sal"));
		pMap.put("sal", sal);
	}
	if(request.getParameter("comm")!=null){
		comm = Integer.parseInt(request.getParameter("comm"));
		pMap.put("comm", comm);
	}
	if(request.getParameter("deptno")!=null){
		deptno = Integer.parseInt(request.getParameter("deptno"));
		pMap.put("deptno", deptno);
	}
	SqlMapEmpDao eDao = new SqlMapEmpDao();
	int result = eDao.empINS(pMap);
	out.print("result : " + result); */
	
	//response.sendRedirect("EmpManagerVer7.jsp");
	
	HashMapBinder mBinder = new HashMapBinder();
	SqlMapEmpDao eDao = new SqlMapEmpDao();

	Map<String, String[]> pMap = request.getParameterMap();
	Map<String, Object> dataMap = mBinder.getDataMap(pMap);
	int result = eDao.empINS(dataMap);
	out.print("result : " + result);
%>