<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
//declaration
//여기에 선언한 변수는 전역 변수이고, 스크립틀릿에 선언한 변수는 지역변수이다.
//서블릿을 싱글톤으로 관리한다.
//newsData_jsp.java가 서블릿이고, HttpServlet을 상속 받았다.
//그럼 이 객체는 페이지 새로고침 할 때도 계속 유지된다.
	int x = 1;
	public String newsList(String news[]){
		StringBuilder sb = new StringBuilder();
		sb.append("<table border = '1'>");
		sb.append("<tr><td><a href='"+news[2]+"'>" + news[0] + "	| " + news[1] + " </a></td></tr>");
		sb.append("</table>");
		//return "<b>"+news[0] + "	|	" + news[1]+ "</b>";
		return sb.toString();
	}
%>
<%
//스크립틀릿(68페이지)에서는 메소드 선언이 불가하다.
	String news1[] = {"교회·식당·투표…첫 증상 발현 후 9일간 일상생활", "오승현 기자","https://news.naver.com/main/read.nhn?mode=LPOD&mid=sec&oid=001&aid=0011558619&isYeonhapFlash=Y&rc=N"};
	String news2[] = {"초등 1∼3학년 오늘 온라인개학…초중고 540만명 원격수업 시대", "한영인 기자", "https://news.naver.com/main/read.nhn?mode=LPOD&mid=sec&oid=001&aid=0011558399&isYeonhapFlash=Y&rc=N"};
	String news3[] = {"CGV 여의도, 대면 최소화 '언택트시네마'로 재탄생", "권태훈 기자", "https://news.naver.com/main/read.nhn?mode=LSD&mid=sec&sid1=103&oid=055&aid=0000809188"};
	String news4[] = {"사회적 거리두기 완화됐지만... 국립문화예술시설 '휴관'", "김병기 기자", "https://news.naver.com/main/read.nhn?mode=LS2D&mid=sec&sid1=103&sid2=245&oid=047&aid=0002267052"};
	String news5[] = {"'페스트' 알베르 까뮈, 교보문고 '올해의 아이콘' 선정", "임종명 기자", "https://news.naver.com/main/read.nhn?mode=LS2D&mid=sec&sid1=103&sid2=245&oid=003&aid=0009824157"};
	
	//화면에 내보내질 코드 담기
	String datas = "";
	switch(x){
	case 1:
		datas = newsList(news1);
		x++;
		break;
	case 2:
		datas = newsList(news2);
		x++;
		break;
	case 3:
		datas = newsList(news3);
		x++;
		break;
	case 4:
		datas = newsList(news4);
		x++;
		break;
	case 5:
		datas = newsList(news5);
		x++;
		x = 1;//마지막까지 가면 다시 1로 돌아와야 하니까.
		break;
	}
	out.print(datas);
%>