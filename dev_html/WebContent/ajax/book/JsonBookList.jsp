<%@page import="com.vo.BookVO"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "orm.dao.BookDao" %>
<%@ page import = "java.util.List, java.util.Map"%>
<%@ page import = "com.google.gson.Gson" %>
<%	
	//공통코드
	BookDao bDao = new BookDao();
	Gson g = new Gson();
%>
<%
	///book_title로 비교
	{//***
	Map<String, Object> pMap = new HashMap<>();
	if(request.getParameter("bname")!=null){
		pMap.put("book_title", request.getParameter("bname"));
	}
	List<Map<String, Object>> bList = bDao.getBookList_t(pMap);
	String result = g.toJson(bList);
	out.print(result);
	}//***
/* 	//////////b_no로 검색
	{
		Map<String, Object> pMap = new HashMap<>();
	if(request.getParameter("bno")!=null){
		pMap.put("book_no", request.getParameter("bno"));
	}
	List<Map<String, Object>> bList = bDao.getBookList(pMap);
	String result = g.toJson(bList);
	out.print(result);
	} */
/* 	///////////////////
	//VO사용/b_no로 검색
	BookVO pVO = new BookVO();
	if(request.getParameter("bno")!=null){
		pVO.setBook_no(Integer.parseInt(request.getParameter("bno")));
	}
	List<BookVO> bookList = bDao.getBookListVO(pVO);
	String voResult = g.toJson(bList);
	//out.print(voResult);
	 */
%>