<%@page import="project.restaurant.RestaurantDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    //mapDesign.html 문서에서 사용자가 화면에 입력한 아이디 가져오기
    //주소에서 ?로 구분을 해준 후 name이 온다 거기에 있는 name과 똑같이 써줘야 한다.
    String mem_id = request.getParameter("mem_id");
    String mem_pw = request.getParameter("mem_pw");
    RestaurantDao rdao = new RestaurantDao();
    String msg = null;
    msg = rdao.proc_login(mem_id, mem_pw);
    out.print(msg);
    %>