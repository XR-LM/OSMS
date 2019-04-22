<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>办公用品管理</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<link href="resources/css/jquery-ui-themes.css" type="text/css"
	rel="stylesheet" />
<link href="resources/css/axure_rp_page.css" type="text/css"
	rel="stylesheet" />
<link href="data/styles.css" type="text/css" rel="stylesheet" />
<link href="files/办公用品管理/styles.css" type="text/css" rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="resources/themes/easyui.css">
<link rel="stylesheet" type="text/css" href="resources/themes/icon.css">
<script src="resources/scripts/jquery-1.7.1.min.js"></script>
<script src="resources/scripts/jquery-ui-1.8.10.custom.min.js"></script>
<script src="resources/scripts/axure/axQuery.js"></script>
<script src="resources/scripts/axure/globals.js"></script>
<script src="resources/scripts/axutils.js"></script>
<script src="resources/scripts/axure/annotation.js"></script>
<script src="resources/scripts/axure/axQuery.std.js"></script>
<script src="resources/scripts/axure/doc.js"></script>
<script src="data/document.js"></script>
<script src="resources/scripts/messagecenter.js"></script>
<script src="resources/scripts/axure/events.js"></script>
<script src="resources/scripts/axure/recording.js"></script>
<script src="resources/scripts/axure/action.js"></script>
<script src="resources/scripts/axure/expr.js"></script>
<script src="resources/scripts/axure/geometry.js"></script>
<script src="resources/scripts/axure/flyout.js"></script>
<script src="resources/scripts/axure/ie.js"></script>
<script src="resources/scripts/axure/model.js"></script>
<script src="resources/scripts/axure/repeater.js"></script>
<script src="resources/scripts/axure/sto.js"></script>
<script src="resources/scripts/axure/utils.temp.js"></script>
<script src="resources/scripts/axure/variables.js"></script>
<script src="resources/scripts/axure/drag.js"></script>
<script src="resources/scripts/axure/move.js"></script>
<script src="resources/scripts/axure/visibility.js"></script>
<script src="resources/scripts/axure/style.js"></script>
<script src="resources/scripts/axure/adaptive.js"></script>
<script src="resources/scripts/axure/tree.js"></script>
<script src="resources/scripts/axure/init.temp.js"></script>
<script src="files/办公用品管理/data.js"></script>
<script src="resources/scripts/axure/legacy.js"></script>
<script src="resources/scripts/axure/viewer.js"></script>
<script src="resources/scripts/axure/math.js"></script>
<script src="resources/scripts/jquery.easyui.min.js"></script>
<script src="resources/scripts/util.js"></script>
<script type="text/javascript">
	$axure.utils.getTransparentGifPath = function() {
		return 'resources/images/transparent.gif';
	};
	$axure.utils.getOtherPath = function() {
		return 'resources/Other.html';
	};
	$axure.utils.getReloadPath = function() {
		return 'resources/reload.html';
	};
	
	
	$(function() {
		$('#itemEditWindow').window({    
		    width:470,
		    height:500,
		    modal:true, 
		    closed:true,
		    iconCls:'icon-edit',
		    href:'article_edit'
		});  
		var queryparms = {
			"pageNumber" : "1",
			"pageSize" : "10"
		};
		var columns=[ [ {
			field : 'ck',
			checkbox : true
		}, {
			field : 'id',
			title : '商品编号',
			width : 60
		}, {
			field : 'articleName',
			title : '商品名称',
			width : 280
		}, {
			field : 'stockNum',
			title : '库存数量',
			width : 120
		}, {
			field : 'stockUnit',
			title : '存储单位',
			width : 100
		}, {
			field : 'articleType1',
			title : '商品类别',
			width : 100
		},{field:'opt',title:'操作',width:100,align:'center',  
            formatter:function(value,rec){  
                var btn = '<a class="editcls" style="background: rgb(75, 178, 255);border-radius: 3px;color:white" onclick="editRow(\''+rec.id+'\')" href="javascript:void(0)">修改</a>';
                return btn;  
            }  
        } ] ];
		ini_table(queryparms,'goods/list',columns);
		//查询办公用品
		$("#u352").click(function() {
			//获取商品名称
			goodsname = $("#u349_input").val().trim();
			//获取商品类别
			goodstype = $("#u372_input").val();
			find(1, 10,'goods/list');
		});

		//删除商品
		$("#u502").click(function() {
			var ids = getSelectionsIds();
			if (ids.length == 0) {
				$.messager.alert('提示', '未选中商品!');
				return;
			}
			$.messager.confirm('确认','确定删除选中的商品吗？',function(r){
				    if (r){
				    	var params = {"ids":ids};
			        	$.post("goods/delete",params, function(data){
			    			if(data.status == 200){
			    				$.messager.alert('提示','删除商品成功!',undefined,function(){
			    					$("#goodsList").datagrid("reload");
			    				});
			    			}
			    		});
				    }
				});
		});

	});
</script>
</head>
<body>
	<div id="base" class="">

		<!-- Unnamed (组合) -->
		<div id="u307" class="ax_default">

			<!-- Unnamed (矩形) -->
			<div id="u308" class="ax_default box_2">
				<div id="u308_div" class=""></div>
				<!-- Unnamed () -->
				<div id="u309" class="text"
					style="display: none; visibility: hidden">
					<p>
						<span></span>
					</p>
				</div>
			</div>

			<!-- Unnamed (组合) -->
			<div id="u310" class="ax_default">

				<!-- Unnamed (矩形) -->
				<div id="u311" class="ax_default _文本段落">
					<div id="u311_div" class=""></div>
					<!-- Unnamed () -->
					<div id="u312" class="text" style="visibility: visible;">
						<p>
							<span>说明：</span>
						</p>
					</div>
				</div>

				<!-- Unnamed (椭圆形) -->
				<div id="u313" class="ax_default ellipse">
					<img id="u313_img" class="img " src="images/办公用品管理/u313.png" />
					<!-- Unnamed () -->
					<div id="u314" class="text" style="visibility: visible;">
						<p>
							<span>1</span>
						</p>
					</div>
				</div>

				<!-- Unnamed (文本段落) -->
				<div id="u315" class="ax_default _文本段落">
					<img id="u315_img" class="img "
						src="resources/images/transparent.gif" />
					<!-- Unnamed () -->
					<div id="u316" class="text" style="visibility: visible;">
						<p>
							<span>物品名称支持模糊查询；</span>
						</p>
					</div>
				</div>

				<!-- Unnamed (文本段落) -->
				<div id="u317" class="ax_default _文本段落">
					<img id="u317_img" class="img "
						src="resources/images/transparent.gif" />
					<!-- Unnamed () -->
					<div id="u318" class="text" style="visibility: visible;">
						<p>
							<span>批量删除，删除的时候，判断多选框是否选中，未选中给出提示；选中，给出删除的确认信息；删除成功之后，提示；</span>
						</p>
					</div>
				</div>

				<!-- Unnamed (文本段落) -->
				<div id="u319" class="ax_default _文本段落">
					<img id="u319_img" class="img "
						src="resources/images/transparent.gif" />
					<!-- Unnamed () -->
					<div id="u320" class="text" style="visibility: visible;">
						<p>
							<span>${total }</span>
						</p>
					</div>
				</div>

				<!-- Unnamed (椭圆形) -->
				<div id="u321" class="ax_default ellipse">
					<img id="u321_img" class="img " src="images/办公用品管理/u313.png" />
					<!-- Unnamed () -->
					<div id="u322" class="text" style="visibility: visible;">
						<p>
							<span>2</span>
						</p>
					</div>
				</div>

				<!-- Unnamed (椭圆形) -->
				<div id="u323" class="ax_default ellipse">
					<img id="u323_img" class="img " src="images/办公用品管理/u313.png" />
					<!-- Unnamed () -->
					<div id="u324" class="text" style="visibility: visible;">
						<p>
							<span>3</span>
						</p>
					</div>
				</div>

				<!-- Unnamed (椭圆形) -->
				<div id="u325" class="ax_default ellipse">
					<img id="u325_img" class="img " src="images/办公用品管理/u313.png" />
					<!-- Unnamed () -->
					<div id="u326" class="text" style="visibility: visible;">
						<p>
							<span>4</span>
						</p>
					</div>
				</div>

				<!-- Unnamed (文本段落) -->
				<div id="u327" class="ax_default _文本段落">
					<img id="u327_img" class="img "
						src="resources/images/transparent.gif" />
					<!-- Unnamed () -->
					<div id="u328" class="text" style="visibility: visible;">
						<p>
							<span>分页的样式仅供参考，可以自己写样式，也可以用插件。</span>
						</p>
					</div>
				</div>
			</div>
		</div>

		<!-- Unnamed (矩形) -->
		<div id="u329" class="ax_default box_2">
			<div id="u329_div" class=""></div>
			<!-- Unnamed () -->
			<div id="u330" class="text" style="display: none; visibility: hidden">
				<p>
					<span></span>
				</p>
			</div>
		</div>

		<!-- Unnamed (矩形) -->
		<div id="u331" class="ax_default box_1">
			<div id="u331_div" class=""></div>
			<!-- Unnamed () -->
			<div id="u332" class="text" style="display: none; visibility: hidden">
				<p>
					<span></span>
				</p>
			</div>
		</div>

		<!-- nav-最新活动 (矩形) 维护 -->
		<div id="u333" class="ax_default box_1" data-label="nav-最新活动">
			<div id="u333_div" class=""></div>
			<!-- Unnamed () -->
			<div id="u334" class="text" style="visibility: visible;">
				<p>
					<span>物品维护</span>
				</p>
			</div>
		</div>

		<!-- nav-产品 (矩形) 审核-->
		<div id="u335" class="ax_default box_1" data-label="nav-产品">
			<div id="u335_div" class=""></div>
			<!-- Unnamed () -->
			<div id="u336" class="text" style="visibility: visible;">
				<p>
					<span>申请审核</span>
				</p>
			</div>
		</div>

		<!-- 底部标志-最新活动 (矩形) -->
		<div id="u337" class="ax_default box_1" data-label="底部标志-最新活动">
			<div id="u337_div" class=""></div>
			<!-- Unnamed () -->
			<div id="u338" class="text" style="display: none; visibility: hidden">
				<p>
					<span></span>
				</p>
			</div>
		</div>

		<!-- 底部标志-产品 (矩形) -->
		<div id="u339" class="ax_default box_1 ax_default_hidden"
			data-label="底部标志-产品" style="display: none; visibility: hidden">
			<div id="u339_div" class=""></div>
			<!-- Unnamed () -->
			<div id="u340" class="text" style="display: none; visibility: hidden">
				<p>
					<span></span>
				</p>
			</div>
		</div>

		<!-- Unnamed (水平线) -->
		<div id="u341" class="ax_default line">
			<img id="u341_img" class="img " src="images/办公用品管理/u341.png" />
			<!-- Unnamed () -->
			<div id="u342" class="text" style="display: none; visibility: hidden">
				<p>
					<span></span>
				</p>
			</div>
		</div>

		<!-- Unnamed (矩形) 标题 -->
		<div id="u343" class="ax_default _一级标题">
			<div id="u343_div" class=""></div>
			<!-- Unnamed () -->
			<div id="u344" class="text" style="visibility: visible;">
				<p>
					<span>办公用品管理系统</span>
				</p>
			</div>
		</div>

		<!-- Unnamed (矩形) 物品名称-->
		<div id="u345" class="ax_default label">
			<div id="u345_div" class=""></div>
			<!-- Unnamed () -->
			<div id="u346" class="text" style="visibility: visible;">
				<p>
					<span>物品名称</span>
				</p>
			</div>
		</div>

		<!-- 输入框 -->
		<!-- Unnamed (矩形) 查询输入框-->
		<div id="u347" class="ax_default box_1">
			<div id="u347_div" class=""></div>
			<!-- Unnamed () -->
			<div id="u348" class="text" style="display: none; visibility: hidden">
				<p>
					<span></span>
				</p>
			</div>
		</div>


		<!-- Unnamed (文本框) -->
		<div id="u349" class="ax_default text_field">
			<input id="u349_input" type="text" value="" />
		</div>
		<!-- 输入框 -->


		<!-- Unnamed (矩形) 物品类别-->
		<div id="u350" class="ax_default label">
			<div id="u350_div" class=""></div>
			<!-- Unnamed () -->
			<div id="u351" class="text" style="visibility: visible;">
				<p>
					<span>物品类别</span>
				</p>
			</div>
		</div>

		<!-- 查询 -->
		<!-- 默认按钮 (矩形) -->
		<div id="u352" class="ax_default box_1" data-label="默认按钮">
			<img id="u352_img" class="img " src="images/登陆/login_u275.png" />
			<!-- Unnamed () -->
			<div id="u353" class="text" style="visibility: visible;">
				<p>
					<span>查 询</span>
				</p>
			</div>
		</div>
		<!-- 查询 -->


		<!-- 下拉列表框 -->
		<!-- Unnamed (下拉列表框) -->
		<div id="u372" class="ax_default droplist">
			<select id="u372_input">
				<option selected value="0">--请选择--</option>
			<option value="1">笔</option>
			<option value="2">笔记本</option>
			<option value="3">订书机</option>
			<option value="4">打印纸</option>
			<option value="5">订书针</option>
			<option value="6">文件夹</option>
			<option value="7">档案袋</option>
			</select>
		</div>
		<!-- 下拉列表框 -->
		<!-- 百搭按钮 (矩形) -->
		<div id="u500" class="ax_default box_1" data-label="百搭按钮">
			<img id="u500_img" class="img " src="images/登陆/百搭按钮_u277.png" />
			<!-- Unnamed () -->
			<div id="u501" class="text" style="visibility: visible;">
				<p>
					<span>新增</span>
				</p>
			</div>
		</div>
		<!-- 原始按钮 (矩形) -->
		<div id="u502" class="ax_default box_1" data-label="原始按钮">
			<img id="u502_img" class="img " src="images/办公用品管理/原始按钮_u502.png" />
			<!-- Unnamed () -->
			<div id="u503" class="text" style="visibility: visible;">
				<p>
					<span>删除</span>
				</p>
			</div>
		</div>
		<div id="itemEditWindow" title="编辑商品" style="width: 566px;height: 389px;padding: 10px;">
		</div>
		
		<!-- Unnamed (表格) -->
		<div id="u373" class="ax_default">
			<table id="goodsList"></table>
		</div>
	</div>

</body>
</html>
