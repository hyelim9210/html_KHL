<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<%@ include file = "./JEasyUICommon.jsp" %>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		$("#tb_id").textbox({
		   prompt: 'hello'
		  , onChange : function(newVal, oldVal){
				alert("newVal : " + newVal);
				alert("oldVal : " + oldVal);
			}
		});
		$("#d_test").dialog({
			closed: false
	 	  , title: '우편번호 검색기'
		});
	})
</script>
<body>
<input id = "tb_id" class = "easyui-textbox" data-options ="propt:'안녕'">

<div id ="d_test" style = "width:100px; height:100px; border:1px solid black; "> 안녕 </div>
</body>
</html>