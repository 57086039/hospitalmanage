﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<%@include file="../../common/quote.jsp" %>
	</head>

	<body>
		<div class="main-container container-fluid">
			<div class="main-content">
				<div class="page-content">
					<div class="page-header position-relative">
						<h1>
							科室部门
							<small>
								<i class="icon-double-angle-right"></i>
								修改科室部门
							</small>
						</h1>
					</div><!--/.page-header-->

					<form id="validation-form" class="form-horizontal" action="${ctx}/departmentController/edit.do" method="post" >
						<div style="border-bottom:1px dotted #e2e2e2; padding-bottom:13px; margin-bottom:13px;">
							<button class="btn btn-small" type="button" onclick="javascript:location.href='${ctx}/departmentController/list.do';">
								<i class="icon-undo"></i>
								返回
							</button>

							<input type="hidden" name="id" value="${department.id}"/>
							<button class="btn btn-small btn-primary" type="submit">
								<i class="icon-save"></i>
								保存
							</button>
						</div>
							
						<div class="row-fluid">
							<div></div>
							<div class="span4">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">科室编号</label>
	
									<div class="controls controls-m">
										<input type="text" name="departmentcode" value="${department.departmentcode}"/>
									</div>
								</div>		
							</div><!--/span-->
	
							<div class="span4">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">科室名称</label>
	
									<div class="controls controls-m">
										<input type="text" name="departmentname" value="${department.departmentname}" onkeyup="getpinyin()"/>
									</div>
								</div>	
							</div><!--/span-->
	
							<div class="span4">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">拼音简码</label>
	
									<div class="controls controls-m">
										<input type="text" name="pinyincode" value="${department.pinyincode}" readonly="readonly"/>
									</div>
								</div>	
							</div><!--/span-->
						</div><!--/.row-fluid-->
	
						<div class="row-fluid">
							<div></div>
							<div class="span4">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">科室位置</label>
	
									<div class="controls controls-m">
										<input type="text" name="site" value="${department.site}"/>
									</div>
								</div>		
							</div><!--/span-->
	
							<div class="span4">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">挂号金额</label>
	
									<div class="controls controls-m">
										<input type="text" name="registersum" value="${department.registersum}"
										<c:if test="${department.isregister != 1}">disabled="disabled"</c:if> />
									</div>
								</div>	
							</div><!--/span-->
	
							<div class="span4">
								<div class="control-group control-group-m">
									<label class="control-label control-label-m">备注</label>
	
									<div class="controls controls-m">
										<input type="text" name="note" value="${department.note}"/>
									</div>
								</div>	
							</div><!--/span-->
						</div><!--/.row-fluid-->
	
						<div class="row-fluid">
							<div></div>	
							<div class="span4">
								<div class="control-group control-group-m">	
									<div class="controls controls-m">
										<label style="display:inline-block;">
											<label>
												<input name="isregister" class="ace-checkbox-2" type="checkbox" value="1" 
												<c:if test="${department.isregister == 1}">checked="true"</c:if> onclick="isrgs()"/>
												<span class="lbl"> 允许挂号</span>
											</label>
										</label>
									</div>
								</div>	
							</div><!--/span-->
						</div><!--/.row-fluid-->
					</form><!-- /.form -->
				</div><!--/.page-content-->
			</div><!--/.main-content-->
		</div><!--/.main-container-->

		<script type="text/javascript">
			$(function(){
				//开启表单验证
				formValidate();
			});
		
			//获取拼音码
			function getpinyin(){
				$.post("${ctx}/passController/getpinyin.do",
				{zhname:$("input[name='departmentname']").val()},
				function(data){	
					$("input[name='pinyincode']").val(data.pinyincode);
				});
			}
			
			//是否挂号复选框，选上挂号金额文本框可用，反之不可用
			function isrgs(){
				if($("input[name='isregister']").is(':checked')){
					$("input[name='registersum']").removeAttr("disabled");
				}else{
					$("input[name='registersum']").attr("disabled","disabled");
				}
			}
			
			//表单验证
			function formValidate(){
				$("#validation-form").validate({
					errorElement: 'label',
					errorClass: 'help-inline',
					focusInvalid: false,
				    rules: {
				   	  	departmentcode:{
				   	  		required:true,
				   	  		codeChar:true
				   	  	},
				      	departmentname:"required",
				      	site:"required",
				      	registersum:{
				      		required:true,
				      		number:true
				      	}
				    },
				    
				    highlight: function (e) {
						$(e).closest('.control-group').removeClass('info').addClass('error');
					},
			
					success: function (e) {
						$(e).closest('.control-group').removeClass('error').addClass('info');
						$(e).remove();
					},
					//重写提交方式
					submitHandler:function(){
						formSubmit();
					}
			    });
			}
			
			//表单提交
			function formSubmit(){
				swal({
				  	title: "是否保存?",
				  	text: "",
				  	type: "warning",
				  	showCancelButton: true,
				  	cancelButtonText: "否",
				  	confirmButtonClass: "btn-danger",
				  	confirmButtonText: "是",
				  	closeOnConfirm: true
				},
				function(){
					document.forms[0].submit();
				});
			}
		</script>
	</body>
</html>
