<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="resources/css/form.css" type="text/css" rel="stylesheet" />
<div style="padding: 10px 10px 10px 10px">
	<form id="itemeEditForm" class="itemForm" method="post">
	

		<input type="hidden" name="articleId" id="articleId" />
		<input type="hidden" name="userId" id="userId" value="${sessionScope.user.id}" />
		<input type="hidden" name="applyNum" id="applyNum" />
		<input type="hidden" name="applyUnit" id="applyUnit" value="1"/>
		
		<table cellpadding="5">
			<tr>
				<td><p>物品名称</p></td>
				<td><input class="easyui-textbox" type="text"
					name="articleName" data-options="required:true"
					style="width: 280px;" readonly="readonly"></input></td>
			</tr>
			<tr>
				<td><p>物品类别</p></td>
				<td><select name="articleType" id="articleType"
					class="easyui-combobox" required="true" style="width: 150px;"
					disabled>
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
				<td><p>申请日期</p></td>
				<td><input class="easyui-textbox" id="applyDate"
					name="applyDate" style="width: 280px;" readonly="readonly"></input></td>
			</tr>
			<tr>
				<td><p>申请人</p></td>
				<td><input class="easyui-textbox" type="text" name="applyName" value="${sessionScope.user.userName}"
					readonly="readonly"/></td>
			</tr>
			<tr>
				<td><p>申请数量</p></td>
				<td><input class="easyui-textbox" name="stockNum" id="stockNum"
					style="width: 280px;"></input></td>
			</tr>
			<tr id="error" style="display: none;">
				<td colspan="2"><span style="color:red;background: white;" >超出库存</span></td>
			</tr>
			<tr>
				<td><p>单位</p></td>
				<td><input class="easyui-textbox" type="text" name="stockUnit"
					readonly="readonly" /></td>
			</tr>
			<tr>
				<td colspan="2"><p style="width: 380px;text-align: left;padding-left: 20px">原因说明</p></td>
			</tr>
			<tr>
				<td colspan="2"><textarea  class="easyui-textbox" id="applyReason" name="applyReason"  cols="2"   rows="6"    style="OVERFLOW:   hidden"></textarea></td>
			</tr>
		</table>
	</form>
	<div style="padding: 5px">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			onclick="submitForm()">申请</a>
	</div>
</div>
<script type="text/javascript">
	var flag = true;
	$(function() {

		//数字验证
		$("#stockNum").blur(function(){
			var num=$("#stockNum").val();//需要判断的值
			if(isNaN(num)){
				alert("你输入的不是数字");
				flag=false;
			}else{
				flag=true;
			}
		});

		//设置时间
		$("#applyDate").val(getNowDate());


		///发送一个ajax请求校验申请数量
		$("#stockNum").blur(function() {
			//商品id
			var id = $("#articleId").val();
			//申请数量
			var num = $("#stockNum").val();
			$.ajax({
				url : 'apply/validNum',
				data : {
					num : num,
					id : id
				},
				success : function(data) {
					if (data.status != 200) {
						$("#error").css("display","block");
						flag = false;
					} else {
						$("#error").css("display","none");
						$("#applyNum").val(num);
						flag = true;
					}
				}

			});
			
		});
	});
	
	
	function submitForm() {
		var applyNum=$("#applyNum").val($("#stockNum").val());
		//判断申请数量，申请原因是否为空
		if($("#applyReason").val()==null||$("#applyReason").val()==""||applyNum==null||applyNum==""||applyNum==0)
			flag=false;
		else
			flag=true;

		//判断表单是否合法
		if (flag == false) {
			$.messager.alert('提示', '表单信息填写有误!');
			return;
		}


		$.post("apply/insert", $("#itemeEditForm").serialize(), function(data) {
			if (data.status == 200) {
				$.messager.alert('提示', '申请办公用品成功!', 'info', function() {
					$("#itemEditWindow").window('close');
					$("#goodsList").datagrid("reload");
				});
			}
		});
	}
</script>
