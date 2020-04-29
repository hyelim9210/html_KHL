<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//여기는 톰캣 서버 내부에서 처리되는 코드이고, 처리된 결과만이 클라이언트 측으로 다운로드 된다.
	if(1==1) out.print("나야");
%>
	<script>
	//여기는 처리 주체가 사용자의 컴퓨터이다.
	//처리 시간이 다르고, 위치가 다르다는 것이다.
		opener.location.href="javascript:fun();"//부모의 함수를 호출할 수 있다.
		self.close();
	</script>