<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>사원관리</title>
	<%@ include file="./JEasyUICommon.jsp" %>
	<script type="text/javascript">
		function zipcode_search(){
			alert("우편번호 찾기 함수");
			onClick : function(){
				$("#dlg_zipcode").dialog({
					open: 'true'
				  , title: '우편번호 검색기'
				});
			}
		}
		function empList(){
		   $("#dg_emp").datagrid({
				url:"jsonEmpList.jsp"
			   ,onLoadSuccess: function(data){
				    var result = JSON.stringify(data);
					alert("새로고침 처리 성공 : "+data+","+result);
				}			   
		   });
		}//end of empList
		
		function empINS(){
			$("#dlg_ins").dialog({
				title: '사원 등록'
			  , closed:false
			  , width: 300
			  , height: 400
			  , modal: true
			});
		}
		function empUPD(){
			$("#dlg_upd").dialog({
				title: '사원 수정'
			  , closed:false
			  , width: 300
			  , height: 400
			  , modal: true
			});
		}
		function empDEL(){
			$("#dlg_del").dialog({
				title: '사원 삭제'
			  , closed:false
			  , width: 300
			  , height: 200
			  , modal: true
			});
		}
		
		function empnoSearch(){
			var s_empno = $("#s_empno").val();
			$("#dg_emp").datagrid({
				url: 'jsonEmpList.jsp?empno=' + s_empno
			  , method: "get"
			});
		}
		////////////////////DataGrid에 직접 수정 모드 추가하기 시작 /////////////////////////////
		function getRowIndex(target){
		    var tr = $(target).closest('tr.datagrid-row');
		    return parseInt(tr.attr('datagrid-row-index'));
		}
		function editrow(target){
		    $('#dg_emp').datagrid('beginEdit', getRowIndex(target));
		}
		function deleterow(target){
		    $.messager.confirm('Confirm','Are you sure?',function(r){
		        if (r){
		            $('#dg_emp').datagrid('deleteRow', getRowIndex(target));
		        }
		    });
		}
		function saverow(target){
		    $('#dg_emp').datagrid('endEdit', getRowIndex(target));
		}
		function cancelrow(target){
		    $('#dg_emp').datagrid('cancelEdit', getRowIndex(target));
		}
		
		////////////////////DataGrid에 직접 수정 모드 추가하기 끝 /////////////////////////////
	</script>
</head>
<body>
<!-- =============================== 검색 조건 추가하기  시작 =============================== -->
	<div id = "tbar_emp">
		<form if ="f_search">
			<table>
				<tr>
					<td width = "190px">
						<label width = "80px">사원번호</label><!-- html5에서 컴포넌트 앞에 주석달기 위해 제공되는 태그 -->
						<input id = "s_empno" name = "s_empno" class = "easyui-searchbox"
							   data-options = "prompt:'사원번호', searcher:empnoSearch" style="width:110px">
							   	<!-- searcher 속성의 값 empnoSearch 라는 함수를 만들어줘야 한다. head에 만들어주자. -->
							   	<!-- sytle : 가까운 속성이 우선 적용된다..? -->
					</td>
				</tr>
				<tr>
					<td>
				        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="empList()">사원조회</a>
				        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-man" plain="true" onclick="empINS()">사원등록</a>
				        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="empUPD()">사원수정</a>
				        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="empDEL()">사원삭제</a>
						</td>
					</tr>
			</table>
		</form>
	</div>
<!-- ================================ 검색 조건 추가하기 끝 ================================ -->

    <table id="dg_emp"></table>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#btn_zipcode").linkbutton({//우편번호 찾기 버튼
				onClick:function(){
					$("#dlg_zipcode").dialog('open');
				}
			});
			
			$('#dg_emp').datagrid({
				title:'사원관리 - 자바스크립트 만으로 구성하기'
			   ,width: '1100px'
			   ,url:'jsonEmpList.jsp'
	           ,toolbar: "#tbar_emp"
			   ,columns:[[
			        {field:'CK', checkbox: true ,width:50,align:'center'}
			      , {field:'DEPTNO',title:'부서번호',width:120,align:'center'
			    	  , editor: {
			    		  		type : "combobox"
			    		  	  , options : {
			    		  		  		valueField: "DEPTNO" //실제 서버에 넘어가는 필드
			    		  		  	  , textField: "DNAME" // 화면에 출력되는 필드
			    		  		  	  , url: './jsonDeptList.jsp'
			    		  		  	  , required:true
			    		  	  }/////end of options
			    	  }/////end of editor
			    	  
			      	}
			      , {field:'EMPNO',title:'사원번호',width:100,align:'center', editor: 'numberbox'}
			      , {field:'ENAME',title:'사원명',width:180,align:'center', editor: 'text'}
			      , {field:'MGR',title:'그룹코드',width:150,align:'center', editor: 'numberbox', hidden:'true'}
			      , {field:'JOB',title:'JOB',width:150,align:'center', editor: 'text'}
			      , {field:'HIREDATE',title:'입사일자',width:200,align:'center', editor: 'text'}
			      , {field:'SAL',title:'급여',width:80,align:'center', editor: 'numberbox'}
			      , {field:'COMM',title:'인센티브',width:80,align:'center', editor: 'numberbox'}
	        	,   {field:'action',title:'Action',width:100,align:'center',
		                formatter:function(value,row,index){
		                    if (row.editing){
		                        var s = '<a href="javascript:void(0)" onclick="saverow(this)">Save</a> ';
		                        var c = '<a href="javascript:void(0)" onclick="cancelrow(this)">Cancel</a>';
		                        return s+c;//파이프연산자 같은 느낌 s와 c를 붙여서 써달라
		                    } else {
		                        var e = '<a href="javascript:void(0)" onclick="editrow(this)">Edit</a> ';
		                        var d = '<a href="javascript:void(0)" onclick="deleterow(this)">Delete</a>';
		                        return e+d;
		                    }
	               		}
	         	   }
			    ]]
				, onEndEdit:function(index,row){
		            var ed = $(this).datagrid('getEditor', {
		                index: index,
		                field: 'productid'
		            });
		            row.productname = $(ed.target).combobox('getText');
		        },
		        onBeforeEdit:function(index,row){
		            row.editing = true;
		            $(this).datagrid('refreshRow', index);
		        },
		        onAfterEdit:function(index,row){
		            row.editing = false;
		            $(this).datagrid('refreshRow', index);
		        },
		        onCancelEdit:function(index,row){
		            row.editing = false;
		            $(this).datagrid('refreshRow', index);
		        }

			});///////////////////end of datagrid			
		});///////////////////////end of ready
	</script>
	<!-- ========================== 사원 등록 시작 ============================ -->
	<div id = "dlg_ins" class = "easyui-dialog" data-options = "closed:true" style = "width:100%; max-width:480px; padding:30px 60px">
		<form id = "f_ins">
			<div style = "margin-bottom:10px;">
				<input class = "easyui-textbox" id = "empno" name = "empno" label="사원번호" data-options ="prompt:'Enter a EMPNO'" style='width:200px'">
			</div>
			<div style = "margin-bottom:10px;">
				<input class = "easyui-textbox" id = "ename" name = "ename" label="사원이름" data-options ="prompt:'Enter a ENAME'" style='width:200px'">
			</div>
			<div style = "margin-bottom:10px;">
				<input class = "easyui-textbox" id = "zipcode" name = "zipcode" label="우편번호" data-options ="prompt:'Enter a ZIPCODE'" style='width:200px'">
				<a id="btn_zipcode" href="#" class="easyui-linkbutton">우편번호 찾기</a>
			</div>
			<div style = "margin-bottom:10px;">
				<input class = "easyui-textbox" id = "addr" name = "addr" label="주소" data-options ="prompt:'Enter a ADDRESS'" style='width:200px'">
			</div>
		</form>
	</div>
	<!-- ========================== 우편번호 찾기 시작 ============================ -->
	<div id="dlg_zipcode" style="width:100%; max-width:600px; padding:30px 30px;">
		<input class="easyui-textbox" id="dong" name="dong" labelPosition="top" data-options="prompt:'동 이름이나 주소 정보를 입력하세요'" style = "width:210px;">
		<a href = "javascript:zipcode_search();" data-options = "iconCls">찾기</a>
		<!-- id를 가지고 이벤트 처리, href를 가지고 이벤트 처리 하는 방법 다 알아야 된다. -->
		<div margin-bottom=10px></div>
			<table id = "dg_zipcode"></table>
		
	</div>
	<!-- =========================== 우편번호 찾기 끝 ============================= -->
	<!-- =========================== 사원 등록 끝 ============================= -->
	<!-- ========================== 사원 수정 시작 ============================ -->
	<div id = "dlg_upd" class = "easyui-dialog"  data-options = "closed:true" style = "width:100%; max-width:480px; padding:30px 60px">
		<form id = "f_upd">
		
		</form>
	</div>
	<!-- =========================== 사원 수정 끝 ============================= -->
	<!-- ========================== 사원 삭제 시작 ============================ -->
	<div id = "dlg_del" class = "easyui-dialog"  data-options = "closed:true" style = "width:100%; max-width:480px; padding:30px 60px">
		<form id = "f_del">
		
		</form>
	</div>
	<!-- =========================== 사원 삭제 끝 ============================= -->
</body>
</html>





