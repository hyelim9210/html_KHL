<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="orm.dao.SqlMapCommonDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원관리 - [jEasyUI활용]</title>
<%@ include file="./JEasyUICommon.jsp" %>
	<script type="text/javascript">
		function empINS(){
			//insert here
			$("#dlg_ins").dialog('open');
		}
		function empnoSearch(){
			//alert("empnoSearch 호출");
			var s_empno = $("#s_empno").val();
			$("#dg_emp").datagrid({
				url:'jsonEmpList.jsp?empno='+s_empno
			});
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
		/////////////////// DataGrid에 직접 수정 모드 추가하기 시작 ////////////////////
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
		/////////////////// DataGrid에 직접 수정 모드 추가하기  끝  ////////////////////
		function zipcode_search(){
			var u_dong = $("#dong").val();
			alert(u_dong);
			$("#dg_zipcode").datagrid({
				title : '우편번호 찾기 검색 결과'
			  , url: 'zipcodeSearch.jsp?input=' + u_dong
			  , columns:[[
				  {field:'ZIPCODE', title:'우편번호', width:100, align:'center'}
				, {field:'ADDRESS', title:'주소', width:400, align:'center'}
			  ]]
			});
		}
	</script>
</head>
<body>
<!--============= 검색 조건 추가하기  시작 ===============-->
<div id="tbar_emp">
	<form id="f_search">
		<table>
			<tr>
				<td width="190px">
					<label width="80px">사원번호</label>
					<input id="s_empno" name="s_empno" class="easyui-searchbox" data-options="prompt:'사원번호', searcher:empnoSearch" style="width:110px">
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
<!--============= 검색 조건 추가하기   끝   ===============-->
    <table id="dg_emp"></table>
	<script type="text/javascript">
		$(document).ready(function(){
		//	$("#dlg_zipcode").hide();
			$("#dlg_zipcode").dialog({
				closed: true
			});
		
		
			/* 우편번호 찾기 버튼 */
			$('#btn_zipcode').linkbutton({
				onClick:function(){
					$("#dlg_zipcode").dialog({
						closed: false
					  , title: '우편번호 검색기'
					}); 
					//$("#dlg_zipcode").dialog('open');
				}
			});
			$('#dlg_upd').dialog({
				closed:true
			});
			$('#dg_emp').datagrid({
				toolbar:'#tbar_emp'
			   ,width: '1100px'
			   ,title:'사원관리 - 자바스크립트 만으로 구성하기'
			   ,url:'jsonEmpList.jsp'
			   ,columns:[[
			        {field:'CK', checkbox:true ,width:50,align:'center'}
			       ,{field:'EMPNO',title:'사원번호',width:90,align:'center', editor:'numberbox'}
			       ,{field:'ENAME',title:'사원명',width:120,align:'center', editor:'text'}
			       ,{field:'JOB',title:'JOB',width:130,align:'center', editor:'text'}
			       ,{field:'HIREDATE',title:'입사일자',width:150,align:'center', editor:'text'}
			       ,{field:'MGR',title:'MGR',width:90,align:'center', editor:'numberbox', hidden:'true'}
			       ,{field:'SAL',title:'급여',width:110,align:'center', editor:'numberbox'}
			       ,{field:'COMM',title:'인센티브',width:100,align:'center', editor:'numberbox'}
			       ,{field:'DEPTNO',title:'부서번호',width:150,align:'center'
			    	  ,editor:{
			    		 type:'combobox'
			    		,options:{
						   valueField:'DEPTNO'//실제 서버에 넘어가는 필드
						  ,textField:'DNAME' //화면에 출력되는 필드
						  ,url:'./jsonDeptList.jsp'
						  ,required:true
			    		}////////end of options
			    	  }//////////end of editor
			        }
			       ,{field:'action',title:'Action',width:100,align:'center',
		                formatter:function(value,row,index){
		                    if (row.editing){
		                        var s = '<a href="javascript:void(0)" onclick="saverow(this)">Save</a> ';
		                        var c = '<a href="javascript:void(0)" onclick="cancelrow(this)">Cancel</a>';
		                        return s+c;// '안녕'||'내일봐'
		                    } else {
		                        var e = '<a href="javascript:void(0)" onclick="editrow(this)">Edit</a> ';
		                        var d = '<a href="javascript:void(0)" onclick="deleterow(this)">Delete</a>';
		                        return e+d;
		                    }
		                }
		            }
			    ]]
			,
	        onEndEdit:function(index,row){
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
	<!--====================== 우편번호 찾기 시작 =======================-->
	<div id="dlg_zipcode" style="width:100%; max-width:600px; padding:30px 30px;">
		<input class="easyui-textbox" id="dong" name="dong" labelPosition="top" data-options="prompt:'동이름이나 주소 정보 입력...'" style="width:210px;">
		<a id="btn_search" href="javascript:zipcode_search();" data-options="iconCls:'icon-search'">찾기</a>
		<div style="margin-bottom:10px;"></div>
		<table id="dg_zipcode"></table>
	</div>
	<!--====================== 우편번호 찾기  끝   =======================-->
	<!--====================== 사원등록 시작 =======================-->
	<div id="dlg_ins" data-options="closed:true, title:'사원정보 등록', modal:'true'" class="easyui-dialog" style="width:100%;max-width:480px;padding:30px 60px">
		<form id="f_ins">
			<div style="margin-bottom:10px">
			<input class="easyui-textbox" id="empno" name="empno" label="사원번호" labelPosition="top" data-options="prompt:'Enter a EmpNO'" style="width:150px">
			</div>
			<div style="margin-bottom:10px">
			<input class="easyui-textbox" id="ename" name="ename" label="사원명" labelPosition="top" data-options="prompt:'Enter a ENAME'" style="width:250px">
			</div>
			<div style="margin-bottom:10px">
			<input class="easyui-textbox" id="zipcode" name="zipcode" label="우편번호" labelPosition="top" data-options="prompt:'Enter a ZIPCODE'" style="width:100px">
			<a id="btn_zipcode" href="#" class="easyui-linkbutton">우편번호찾기</a>
			</div>
			<div style="margin-bottom:10px">
			<input class="easyui-textbox" id="mem_addr" name="mem_addr" label="주소" labelPosition="top" data-options="prompt:'Enter a ADDRESS'" style="width:400px">
			</div>
		</form>
	</div>
	<!--====================== 사원등록   끝  =======================-->
	<!--====================== 사원수정 시작 =======================-->
	<div id="dlg_upd" class="easyui-dialog" style="width:100%;max-width:480px;padding:30px 60px">
		<form id="f_upd">
		수정
		</form>
	</div>	
	<!--====================== 사원수정   끝  =======================-->
	<!--====================== 사원삭제 시작 =======================-->
	<div id="dlg_del" class="easyui-dialog" data-options="closed:true" style="width:100%;max-width:480px;padding:30px 60px">
		<form id="f_del">
		삭제
		</form>
	</div>		
	<!--====================== 사원삭제   끝  =======================-->
</body>
</html>





