<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cheSeongTest.jsp</title>
</head>
<script type="text/javascript" src = "http://code.jquery.com/jquery-1.9.1.min.js"></script>
<body>
<div id = "d_msg"></div>
<div id = "d_test"></div>
<script type="text/javascript">
	function choSeongAccount(str){
		var cho = [
				"ㄱ", "ㄲ", "ㄴ", "ㄷ", "ㄸ"
			  , "ㄹ", "ㅁ", "ㅂ", "ㅃ", "ㅅ"
			  , "ㅆ", "ㅇ", "ㅈ", "ㅉ", "ㅊ"
			  , "ㅋ", "ㅌ", "ㅍ", "ㅎ"
			];
		var code='';
		var result='';//자바를 입력했을 때 ㅈㅂ을 반환하는 함수
		
		for(i=0;i<cho.length;i++){
			$("#d_test").append(cho[i].charCodeAt(0) +"|");
		}
	 	
		for(i=0;i<str.length;i++){
			code = str.charCodeAt(i)-44032;
			$("#d_msg").append(code + " ");
			if(code > -1 && code < 11172) result += cho[Math.floor(code/588)];
			//
		}
		return result;
	}
	var a = choSeongAccount("자바");
	//alert(String.fromCharCode(44032+11171));
	alert('귤'.charCodeAt(0));
//	alert("a : " + a);
</script>
</body>
</html>