<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<base href="<%=basePath%>">
<head>
<title>新增申请</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<link href="resources/css/jquery-ui-themes.css" type="text/css"
	rel="stylesheet" />
<link href="resources/css/axure_rp_page.css" type="text/css"
	rel="stylesheet" />
<link href="data/styles.css" type="text/css" rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="resources/themes/easyui.css">
<link rel="stylesheet" type="text/css" href="resources/themes/icon.css">
<link href="files/新增申请/styles.css" type="text/css" rel="stylesheet" />
<script src="resources/scripts/jquery-1.7.1.min.js" type="text/javascript"></script>
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
<script src="files/新增申请/data.js"></script>
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

	//申请表单数据加载
	function apply(id){
		$("#itemEditWindow").window({
			onLoad : function() {
				$('#goodsList').datagrid('clearSelections');
				// 回显数据
				$.post("goods/findbyid", {
					id : id
				}, function(data) {

					//数字验证
					var num=data.stockNum;//需要判断的值
					if(num==null||num==0){
						alert("库存数量不足，请联系管理员");
						$("#itemEditWindow").window('close');
						return;
					}
					$('#articleType').combobox('select', data.articleType);
					$("#articleId").val(id);
					$("#itemeEditForm").form("load", data);
				});
			}
		}).window("open");
		$("#itemEditWindow").window('refresh');
	}

	$(function() {
		//初始化申请编辑窗口
		$('#itemEditWindow').window({    
		    width:530,
		    height:580,
		    modal:true, 
		    closed:true,
		    iconCls:'icon-add',
		    href:'apply/add'
		});  
		var queryparms = {
			"pageNumber" : "1",
			"pageSize" : "10"
		};
		var columns = [ [
				{
					field : 'id',
					title : '序号',
					width : 60,
					align:'center'
				},
				{
					field : 'articleName',
					title : '商品名称',
					width : 280
				},
				{
					field : 'stockNum',
					title : '库存数量',
					width : 120
				},
				{
					field : 'stockUnit',
					title : '存储单位',
					width : 100
				},
				{
					field : 'articleType1',
					title : '商品类别',
					width : 100
				},
				{
					field : 'opt',
					title : '操作',
					width : 100,
					align : 'center',
					formatter : function(value, rec) {
						var btn = '<a id="u1466_img"  style="height: 25px;line-height: 25px;padding: 0 11px;background: border: 1px  solid;border-radius: 3px;display: inline-block;text-decoration: none;font-size: 12px;outline: none;" tabindex="0" onclick="apply(\''
								+ rec.id
								+ '\')" href="javascript:void(0)">申请</a>';
						return btn;
					}
				} ] ];

		//初始化表格
		ini_table(queryparms, 'goods/list', columns);
		
		//查询
		$("#u1335").click(function() {
			//获取商品名称
			goodsname = $("#u1332_input").val().trim();
			//获取商品类别
			goodstype = $("#u1356_input").val();
			find(1, 10, 'goods/list');
		});
		//申请
	});
</script>
</head>
<body>
	<div id="base" class="">

		<!-- Unnamed (矩形) -->
		<div id="u1316" class="ax_default box_2">
			<div id="u1316_div" class=""></div>
			<!-- Unnamed () -->
			<div id="u1317" class="text"
				style="display: none; visibility: hidden">
				<p>
					<span></span>
				</p>
			</div>
		</div>

		<!-- Unnamed (矩形) -->
		<div id="u1318" class="ax_default box_1">
			<div id="u1318_div" class=""></div>
			<!-- Unnamed () -->
			<div id="u1319" class="text"
				style="display: none; visibility: hidden">
				<p>
					<span></span>
				</p>
			</div>
		</div>

		<!-- nav-最新活动 (矩形) -->
		<div id="u1320" class="ax_default box_1" data-label="nav-最新活动">
			<div id="u1320_div" class=""></div>
			<!-- Unnamed () -->
			<div id="u1321" class="text" style="visibility: visible;">
				<p>
					<span>物品申请</span>
				</p>
			</div>
		</div>

		<!-- 底部标志-最新活动 (矩形) -->
		<div id="u1322" class="ax_default box_1" data-label="底部标志-最新活动">
			<div id="u1322_div" class=""></div>
			<!-- Unnamed () -->
			<div id="u1323" class="text"
				style="display: none; visibility: hidden">
				<p>
					<span></span>
				</p>
			</div>
		</div>

		<!-- Unnamed (水平线) -->
		<div id="u1324" class="ax_default line">
			<img id="u1324_img" class="img " src="images/办公用品管理/u341.png" />
			<!-- Unnamed () -->
			<div id="u1325" class="text"
				style="display: none; visibility: hidden">
				<p>
					<span></span>
				</p>
			</div>
		</div>

		<!-- Unnamed (矩形) -->
		<div id="u1326" class="ax_default _一级标题">
			<div id="u1326_div" class=""></div>
			<!-- Unnamed () -->
			<div id="u1327" class="text" style="visibility: visible;">
				<p>
					<span>办公用品管理系统</span>
				</p>
			</div>
		</div>

		<!-- Unnamed (矩形) -->
		<div id="u1328" class="ax_default label">
			<div id="u1328_div" class=""></div>
			<!-- Unnamed () -->
			<div id="u1329" class="text" style="visibility: visible;">
				<p>
					<span>物品名称</span>
				</p>
			</div>
		</div>

		<!-- Unnamed (矩形) -->
		<div id="u1330" class="ax_default box_1">
			<div id="u1330_div" class=""></div>
			<!-- Unnamed () -->
			<div id="u1331" class="text"
				style="display: none; visibility: hidden">
				<p>
					<span></span>
				</p>
			</div>
		</div>

		<!-- Unnamed (文本框) -->
		<div id="u1332" class="ax_default text_field">
			<input id="u1332_input" type="text" value="" />
		</div>

		<!-- Unnamed (矩形) -->
		<div id="u1333" class="ax_default label">
			<div id="u1333_div" class=""></div>
			<!-- Unnamed () -->
			<div id="u1334" class="text" style="visibility: visible;">
				<p>
					<span>物品类别</span>
				</p>
			</div>
		</div>

		<!-- 默认按钮 (矩形) -->
		<div id="u1335" class="ax_default box_1" data-label="默认按钮">
			<img id="u1335_img" class="img " src="images/登陆/login_u275.png" />
			<!-- Unnamed () -->
			<div id="u1336" class="text" style="visibility: visible;">
				<p>
					<span>查 询</span>
				</p>
			</div>
		</div>


		<!-- Unnamed (下拉列表框) -->
		<div id="u1356" class="ax_default droplist">
			<select id="u1356_input">
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
		
		<!-- Unnamed (表格) -->
		<div id="u1357" class="ax_default">
			<table id="goodsList"></table>
		</div>

	<div id="itemEditWindow" title="新增申请" style="width:80%;height:80%;padding:10px;"></div>
		<!-- Unnamed (矩形) -->
		<div id="u1484" class="ax_default _文本段落">
			<div id="u1484_div" class=""></div>
			<!-- Unnamed () -->
			<div id="u1485" class="text" style="visibility: visible;">
				<p>
					<span>说明：</span>
				</p>
			</div>
		</div>

		<!-- Unnamed (椭圆形) -->
		<div id="u1486" class="ax_default ellipse">
			<img id="u1486_img" class="img " src="images/办公用品管理/u313.png" />
			<!-- Unnamed () -->
			<div id="u1487" class="text" style="visibility: visible;">
				<p>
					<span>1</span>
				</p>
			</div>
		</div>

		<!-- Unnamed (文本段落) -->
		<div id="u1488" class="ax_default _文本段落">
			<img id="u1488_img" class="img "
				src="resources/images/transparent.gif" />
			<!-- Unnamed () -->
			<div id="u1489" class="text" style="visibility: visible;">
				<p>
					<span>物品名称支持模糊查询；</span>
				</p>
			</div>
		</div>

		<!-- Unnamed (文本段落) -->
		<div id="u1490" class="ax_default _文本段落">
			<img id="u1490_img" class="img "
				src="resources/images/transparent.gif" />
			<!-- Unnamed () -->
			<div id="u1491" class="text" style="visibility: visible;">
				<p>
					<span>点击申请，打开“申请物品”页面，并把本条信息的相关内容带到申请页面，自动填充物品的属性；</span>
				</p>
			</div>
		</div>

		<!-- Unnamed (椭圆形) -->
		<div id="u1492" class="ax_default ellipse">
			<img id="u1492_img" class="img " src="images/办公用品管理/u313.png" />
			<!-- Unnamed () -->
			<div id="u1493" class="text" style="visibility: visible;">
				<p>
					<span>2</span>
				</p>
			</div>
		</div>

		<!-- Unnamed (椭圆形) -->
		<div id="u1494" class="ax_default ellipse">
			<img id="u1494_img" class="img " src="images/办公用品管理/u313.png" />
			<!-- Unnamed () -->
			<div id="u1495" class="text" style="visibility: visible;">
				<p>
					<span>3</span>
				</p>
			</div>
		</div>

		<!-- Unnamed (文本段落) -->
		<div id="u1496" class="ax_default _文本段落">
			<img id="u1496_img" class="img "
				src="resources/images/transparent.gif" />
			<!-- Unnamed () -->
			<div id="u1497" class="text" style="visibility: visible;">
				<p>
					<span>分页的样式仅供参考，可以自己写样式，也可以用插件。</span>
				</p>
			</div>
		</div>

		<!-- Unnamed (椭圆形) -->
		<div id="u1498" class="ax_default ellipse">
			<img id="u1498_img" class="img " src="images/登陆/u291.png" />
			<!-- Unnamed () -->
			<div id="u1499" class="text" style="visibility: visible;">
				<p>
					<span>1</span>
				</p>
			</div>
		</div>

		<!-- Unnamed (椭圆形) -->
		<div id="u1500" class="ax_default ellipse">
			<img id="u1500_img" class="img " src="images/登陆/u291.png" />
			<!-- Unnamed () -->
			<div id="u1501" class="text" style="visibility: visible;">
				<p>
					<span>2</span>
				</p>
			</div>
		</div>

		<!-- Unnamed (椭圆形) -->
		<div id="u1502" class="ax_default ellipse">
			<img id="u1502_img" class="img " src="images/登陆/u291.png" />
			<!-- Unnamed () -->
			<div id="u1503" class="text" style="visibility: visible;">
				<p>
					<span>3</span>
				</p>
			</div>
		</div>
	</div>
</body>
</html>
