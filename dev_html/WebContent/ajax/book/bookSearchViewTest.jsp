<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서검색[자동완성 + 초성검사]</title>
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/color.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/demo/demo.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>
	<style type="text/css">
		#d_search {
			position: absolute; /* 디폴트 값은 positive이다. */
			border: 1px dotted black;
			background: #AACCFF;
			margin: 100px;
		}
		#d_test {
			margin-left: 250px;
			position: absolute;
			border: 1px dotted black;
			background: #AAFFFF;
		}
		.listIn{
			background: #CCFFFF;
		}
		.listOut{
			background: #FFFFFF;
		}
	</style>
	<script type="text/javascript">
		//여기서 함수, 전역변수 선언하기
		function choSeongAccount(str){
			var cho = [
					"ㄱ", "ㄲ", "ㄴ", "ㄷ", "ㄸ"
				  , "ㄹ", "ㅁ", "ㅂ", "ㅃ", "ㅅ"
				  , "ㅆ", "ㅇ", "ㅈ", "ㅉ", "ㅊ"
				  , "ㅋ", "ㅌ", "ㅍ", "ㅎ"
				];
			var code='';
			var result='';//자바를 입력했을 때 ㅈㅂ을 반환하는 함수
			
		/* 	for(i=0;i<cho.length;i++){
				$("#d_test").append(charCodeAt(cho[i] + " "));
			} */
			
			for(i=0;i<str.length;i++){
				code = str.charCodeAt(i)-44032;
				$("#d_msg").append(code + " ");
				if(code > -1 && code < 11172) result += cho[Math.floor(code/588)];
			}
			return result;
		}
		
		function clearMethod(){
			$("#d_search").css("backgroundColor", "#FFFFFF");
			$("#d_search").css("border", "none");
			$("#d_search").css("backgroundColor", "#FFFFFF");
			
		}
		
	</script>
</head>
<body>
	<script type="text/javascript">
		$(document).ready(function (){
			//dom 구성이 완료되었을 때
			var t = $('.textbox-f');
			t.textbox('textbox').bind('keyup', function(e){
				var v_word = $("#_easyui_textbox_input1").val();
				var p_word = '';
				var choKeyWord = choSeongAccount(v_word);
				//초성 검색인지 초성 검색이 아닌지 구분하기
				if(v_word != "" && choKeyWord==""){//초성모드 : 초성만 입력했을 때
					choMode = "Y";
				} else{
					choMode = "N";
				}
				//alert("choMode : " + choMode);
			 	var param = "book_title="+v_word+"&choMode=" + choMode;
				$.ajax({
					method:"get"
				  , url:"htmlBookList.jsp"
				  , data: param
				  , success: function(result){
					 // alert("result : " + result);
					  $("#d_search").html(result);
					  $("#d_search").css("border", "1px solid #000000");
					  $("#d_search").css("background", "#FFFFFF");
					  $("#d_search").css("top", $("#_easyui_textbox_input1").offset().bottom + "px");
					  $("#d_search").css("left", $("#_easyui_textbox_input1").offset().left + "px");
					   var tds = document.getElementsByTagName("td");
					  for(var i =0;i< tds.length; i++){//tds.length가 적용된다는 것 자체가 tds가 배열이라는 것이다.
						  tds[i].onmouseover = function(){
						  	  this.className = "listIn";
						  	  var b_no = $(this).attr("id");
							  $("#d_test").text("mouseover : " + $(this).attr("id"));
							   var b_no = $(this).attr("id");
							  var targetURL = '';
							  if("2" == $(this).attr("id")){
								  targetURL = 'bookSearchDetail2.jsp';
							  }
							  else if("3" == $(this).attr("id")){
								  targetURL = 'bookSearchDetail3.jsp';
							  }
							  $.ajax({
								  method: "get"
								, url:targetURL//이런 식으로 할 수 있다는 것 알기
								, success: function(result){
									//alert(result);
									if("2"==$(this).attr("id")){
										$("#d_detail2").html(result);
										$("#d_detail3").html("");
										location.href=tragetURL;
									}else if("3"==$(this).attr("id")){
										$("#d_detail3").html(result);
										$("#d_detail2").html("");
										location.href=tragetURL;
									}
								}
							  });
					  	  };
					  	  tds[i].onmouseout = function(){
					  		  //clearMethod();
					  		  this.className = "listOut";
					  	  }
					  	  tds[i].onclick = function(){
					  		$("#_easyui_textbox_input1").val($(this).text());
					  	  }
					  } 
				  }
				  , error: function(xhrObject){//여기서 result말고 xhrObject를 쓰는 이유는 결과가 나오지 않으니까 뭔가 받은 값이라도 표시하려고...?
					  alert(xhrObject.responseText);
				  }
				});////end of ajax
				//$("#d_search").text(p_word);
				if($("#_easyui_textbox_input1").val().length == 0){
					clearMethod();
				}
			});
		});
	</script>
	<input id="book_title" class = "easyui-textbox" style="width:200px"/> 
	<div id="d_search">조회결과처리화면</div>
	<div id="d_test">테스트</div>
	<div id="d_detail2">detail2</div>
	<div id="d_detail3">detail3</div>
</body>
</html>





