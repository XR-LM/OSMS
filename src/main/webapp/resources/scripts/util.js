//初始翻页参数
var queryparms = {
	"pageNumber" : "1",
	"pageSize" : "10"
};

// 商品名称
var goodsname = "";
// 商品类别
var goodstype = 0;
// 申请人姓名
var username="";
// 申请时间
var applydate="";
//申请状态
var applystatus="";

// 获取当前日期
function getNowDate() {
	var myDate = new Date();
	// 获取当前年
	var year = myDate.getFullYear();
	// 获取当前月
	var month = myDate.getMonth() + 1;
	// 获取当前日
	var date = myDate.getDate();
	var nowdate = year + "/" + month + "/" + date;
	return nowdate;

}

// 获取选中节点
function getSelectionsIds() {
	var itemList = $("#goodsList");
	var sels = itemList.datagrid("getSelections");
	var ids = [];
	for ( var i in sels) {
		ids.push(sels[i].id);
	}
	ids = ids.join(",");
	return ids;
}

// 初始化表格
function ini_table(queryparms, url, columns) {
	$('#goodsList').datagrid({
		width : 1000,
		height : 1000,
		url : url,
		fitColumns : true,// 填充
		fit : true,// 自适应
		queryParams : queryparms,// 查询参数
		nowrap : false,
		columns : columns,
		pagination : true,
		onLoadSuccess : function(data) {
			$('.editcls').linkbutton({
				text : '编辑',
				plain : true,
				iconCls : 'icon-edit'
			});
		}
	});
	var p = $('#goodsList').datagrid('getPager');
	$(p).pagination({
		pageSize : 10,// 每页显示的记录条数，默认为10
		pageList : [ 10, 15, 20 ],// 可以设置每页记录条数的列表
		beforePageText : '第',// 页数文本框前显示的汉字
		afterPageText : '页    共 {pages} 页',
		displayMsg : '共 {total} 条记录',
		onSelectPage : function(pageNumber, pageSize) {// 分页触发
			find(pageNumber, pageSize, url);
		}
	});

}
function editRow(id) {
	$('#goodsList').datagrid('clearSelections');

	$("#itemEditWindow").window({
		onLoad : function() {
			// 回显数据
			$.post("goods/findbyid", {
				id : id
			}, function(data) {
				$('#articleType').combobox('select', data.articleType);
				$("#articleId").val(id);
				$("#itemeEditForm").form("load", data);
			});
		}
	}).window("open");
	$("#itemEditWindow").window('refresh');
}

// 申请页面操作按钮js
function applyeditRow(id, status) {
	$('#goodsList').datagrid('clearSelections');

	if (status == "重新申请") {
		$.ajax({
			url : 'apply/reapply',
			type : 'POST',
			data : {
				id : id
			},
			success : function(data) {
				if (data.status == 200) {
					$.messager.alert('提示', '申请成功!', undefined, function() {
						$("#goodsList").datagrid("reload");
					});
				} else {
					$.messager.alert('错误', data.msg, undefined, function() {
						$("#goodsList").datagrid("reload");
					});
				}
			}
		});
	}
	if (status == "修改") {
		$('#goodsList').datagrid('clearSelections');
		$("#itemEditWindow").window({
			onLoad : function() {
				// 回显数据
				$.get("apply/"+id, function(data) {
					$("#itemeEditForm").form("load", data);
				});
			}
		}).window("open");
		$("#itemEditWindow").window('refresh');
	}
	if (status == "撤回") {
		$.messager.confirm('确认', '确定撤回选中的申请吗？', function(r) {
			if (r) {
				var params = {
					"ids" : id
				};
				$.post("apply/undo", params, function(data) {
					if (data.status == 200) {
						$.messager.alert('提示', '撤回申请成功!', undefined,
								function() {
									$("#goodsList").datagrid("reload");
								});
					} else {
						$.messager.alert('错误', data.msg, undefined, function() {
							$("#goodsList").datagrid("reload");
						});
					}
				});
			}
		});
	}
}

// 根据页码发送查询数据
function find(pageNumber, pageSize, url) {
	$("#goodsList").datagrid('getPager').pagination({
		pageSize : pageSize,
		pageNumber : pageNumber
	});// 重置
	$("#goodsList").datagrid("loading"); // 加屏蔽
	$.ajax({
		type : "POST",
		dataType : "json",
		url : url,
		data : {
			pageNumber : pageNumber,
			pageSize : pageSize,
			goodsname : goodsname,
			goodstype : goodstype,
			username : username,
			applydate:applydate,
			applystatus:applystatus
		},
		success : function(data) {
			$("#goodsList").datagrid('loadData', data);
			$("#goodsList").datagrid("loaded"); // 移除屏蔽
		},
		error : function(err) {
			$.messager.alert('操作提示', '获取信息失败...请联系管理员!', 'error');
			$("#goodsList").datagrid("loaded"); // 移除屏蔽
		}
	});
}
