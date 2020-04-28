<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="orm.dao.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<%
	String b_title = "";
	String choMode = "";
	b_title = request.getParameter("book_title");
		choMode = request.getParameter("choMode");
	if(request.getParameter("book_title")!=null){
	}
	if(request.getParameter("choMode")!=null){
	}
	BookDao bDao = new BookDao();
	Map<String, Object> pMap = new HashMap<>();
	pMap.put("book_title", b_title);
	pMap.put("choMode", choMode);
	List<Map<String, Object>> bList = null;
	bList = bDao.getBookList_t(pMap);
%>
<table border = 1 >
<%
//조회 결과가 없을 때
	if(bList == null){
%>
	<tr>
		<td>조회결과가 없습니다</td>
	</tr>
<%
}
//조회 결과가 있을 때
	else{
		for(int i=0; i<bList.size();i++){
			Map<String, Object> rMap = bList.get(i);
%>
	<tr>
		<td><% out.print(rMap.get("BOOK_TITLE")); %></td>
	</tr>
<%  /////<%=  % >이렇게 생긴 것은 교재 53페이지
	}
}
%>
</table>
