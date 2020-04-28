<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax 실전연습</title>
<script type="text/javascript" src = "http://code.jquery.com/jquery-3.4.1.js"></script>
	<style type="text/css">
		table{
			border: 3px solid #CCAAFF;
		}
		td{
			border: 3px solid #CCAAFF;
			text-align:center;
			height: 45px;
		}
	</style>
	<script type="text/javascript">
		var p_zdo = '';//sigu 선택할 때도 사용하기 위해 전역변수로 선언
		function siguIN(){
			//alert("siguIN()");
			$("#i_sigu").change(function(){//i_zdo에 대한 change이벤트가 일어나면 function에서 처리한다
				//이 조건에 만족 했을 때 function 실행.
				$("#i_sigu option:selected").each(function(){//each문은 for문과 비슷하다. 달라질 때마다
					var p_sigu = $(this).text();//지금 selected 안에 있어서 this로 접근 가능. 텍스트를 가져오려고 .text()
					//alert("p_zdo : " + p_zdo);//여기서 this가 가리키는 것은 i_sigu
					var param = "zdo=" + p_zdo + "&sigu=" + p_sigu;
					alert("dong.change");
					$.ajax({
						method: "post"
					  , url: "getDongList.jsp"
					  , data: param
					  , success: function(result){
						  $("#sigu").val(p_sigu);
						  $("#d_dong").html(result);
						  dongIN();
					    }
					});
				});
			});//////end of i_sigu.change
		}
		function dongIN(){
			$("#i_dong").change(function(){
				$("#i_dong option:selected").each(function(){//each문은 for문과 비슷하다. 달라질 때마다
					var p_dong= $(this).text();//지금 selected 안에 있어서 this로 접근 가능. 텍스트를 가져오려고 .text()
					//alert("p_zdo : " + p_zdo);//여기서 this가 가리키는 것은 i_sigu
					var param = "zdo=" + p_zdo;
					$.ajax({
						method: "post"
					  , url: "getDongList.jsp"
					  , data: param
					  , success: function(result){
						  $("#dong").val(p_dong);
					  }
					});
				});
			});
		}
		
	</script>
</head>
<body>
	<table width = "700" height = " 60" cellpadding="0" cellspacing="0">
		<tr>
			<td width = "50">시도</td>
			<td width = "140">
				<div id = "d_zdo"></div>
			</td>
			<td width = "50">구</td>
			<td width = "140">
				<div id = "d_sigu"></div>
			</td>
			<td width = "50">동</td>
			<td width = "140">
				<div id = "d_dong"></div>
			</td>
		</tr>
		<tr>
			<td width = "50">시도</td>
			<td width "140">
				<input type ="text" id = "zdo" name = "zdo"/>
				<div id = "d_zdo"></div>
			</td>
			<td width = "50">구</td>
			<td width "140">
				<input type ="text" id = "sigu" name = "sigu"/>
				<div id = "d_sigu">
								
				</div>
			</td>
			<td width = "50">동</td>
			<td width "140">
				<input type ="text" id = "dong" name = "dong"/>
			</td>
		</tr>
	</table>
	<script type="text/javascript">
		$(document).ready(function(){
			$.ajax({
				method: "get"
			  , url : "getZDOList.jsp"
			  , success : function(result){
				  $("#d_zdo").html(result);
			  }
			});-
			$("#d_zdo").change(function(){//i_zdo에 대한 change이벤트가 일어나면 function에서 처리한다.
				$("#i_zdo option:selected").each(function(){//each문은 for문과 비슷하다. 달라질 때마다
					p_zdo = $(this).text();//지금 selected 안에 있어서 this로 접근 가능. 텍스트를 가져오려고 .text()
				//	alert("p_zdo : " + p_zdo);
					var param = "zdo=" + p_zdo;
					$.ajax({
						method: "post"
					  , url: "getSiGuList.jsp"
					  , data: param
					  , success: function(result){
						  $("#zdo").val(p_zdo);
						  $("#d_sigu").html(result);
						  siguIN();
					  }
					});
				});
			});//////end of i_zdo.change
			$("#i_sigu").change(function(){//i_zdo에 대한 change이벤트가 일어나면 function에서 처리한다.
				$("#i_sigu option:selected").each(function(){//each문은 for문과 비슷하다. 달라질 때마다
					var p_sigu = $(this).text();//지금 selected 안에 있어서 this로 접근 가능. 텍스트를 가져오려고 .text()
					//alert("p_zdo : " + p_zdo);
					var param = "zdo=" + p_zdo + "&sigu=" + p_sigu;
					alert("sigu.change1");
					$.ajax({
						method: "post"
					  , url: "getDongList.jsp"
					  , data: param
					  , success: function(result){
						  $("#sigu").val(p_sigu);
						  $("#d_dong").html(result);
					  }
					});
				});
			});//////end of i_sigu.change
			 
		});
	</script>
</body>
</html>