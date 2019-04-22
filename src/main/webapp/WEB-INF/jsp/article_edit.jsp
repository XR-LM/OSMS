<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="resources/css/form.css" type="text/css" rel="stylesheet" />

<div style="padding:10px 10px 10px 10px">
	<form id="itemeEditForm" class="itemForm" method="post">
		<input type="hidden" name="id" id="id"/>
	    <table cellpadding="5">
	        <tr>
				<td><p>物品名称:</p></td>
	            <td><input class="easyui-textbox" type="text" id="articleName" name="articleName" data-options="required:true" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td><p>数量:</p></td>
	            <td><input id="stockNum" class="easyui-textbox" name="stockNum" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td><p>单位:</p></td>
	            <td><input class="easyui-textbox" type="text" id="stockUnit" name="stockUnit"/>
	            </td>
	        </tr>
	        <tr>
	            <td><p>物品类别:</p></td>
				<td><select name="articleType" id="articleType"
						class="easyui-combobox" required="true" style="width: 150px;height: 35px">
							<option value="0">---请选择---</option>
							<option value="1">笔</option>
							<option value="2">笔记本</option>
							<option value="3">订书机</option>
							<option value="4">打印纸</option>
							<option value="5">订书针</option>
							<option value="6">文件夹</option>
							<option value="7">档案袋</option>
					</select></td>
	        </tr>
	        <tr>
	        	<td colspan="2"><p style="width: 380px;text-align: left;padding-left: 20px">物品描述:</p></td>
	        </tr>
			<tr>
				<td colspan="2"><textarea  class="easyui-textbox" id="articleDescribe" name="articleDescribe"  cols="2"   rows="6"    style="OVERFLOW:   hidden"></textarea></td>
			</tr>
	    </table>
	</form>
	<div style="padding:5px">
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">提交</a>
	</div>
</div>
<script type="text/javascript">
	var flag=true;
	$(function(){
		//数字验证
  	  $("#stockNum").blur(function(){
      	  var num=$("#stockNum").val();//需要判断的
      	  if(isNaN(num)){
      	    alert("你输入的不是数字");
      	    flag=false;
      	  }else{
		    	   flag=true;
		       }
  	  });
		//商品名称是否重复验证
		$("#articleName").blur(function(){
			var name=$("#articleName").val();
			var id=$("#id").val();
			$.ajax({
				url:'goods/namevalide',
				type:'POST',
				data:{'name':name,'id':id},
				success:function(data){
					if(data.status==400){
						alert(data.msg);
						flag=false;
					}else{
						flag=true;
					}
				}
			});
		});
		
	});
	
	function submitForm(){
		 if($("#articleName").val()==""||""==$("#stockNum").val().trim()||$("#articleType").val()==""||""==$("#stockUnit").val().trim()||""==$("#articleDescribe").val().trim()){
				flag=false;
			 }

		if(!$('#itemeEditForm').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}
		if(!flag){
			$.messager.alert('提示','表单信息填写有误!');
			return ;
		}
		$.post("goods/update",$("#itemeEditForm").serialize(), function(data){
			if(data.status == 200){
				$.messager.alert('提示','修改商品成功!','info',function(){
					$("#itemEditWindow").window('close');
					$("#goodsList").datagrid("reload");
				});
			}
		});
	}
</script>
