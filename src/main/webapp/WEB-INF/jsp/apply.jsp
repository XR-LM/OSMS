 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>资产申请</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <link href="resources/css/jquery-ui-themes.css" type="text/css" rel="stylesheet"/>
    <link href="resources/css/axure_rp_page.css" type="text/css" rel="stylesheet"/>

    <link href="data/styles.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="resources/themes/easyui.css">
    <link rel="stylesheet" type="text/css" href="resources/themes/icon.css">


    <link href="files/资产申请/styles.css" type="text/css" rel="stylesheet"/>
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
    <script src="files/资产申请/data.js"></script>
    <script src="resources/scripts/axure/legacy.js"></script>
    <script src="resources/scripts/axure/viewer.js"></script>
    <script src="resources/scripts/axure/math.js"></script>
    <script src="resources/scripts/jquery.easyui.min.js"></script>
    <script src="resources/scripts/util.js"></script>

    <script type="text/javascript">
      $axure.utils.getTransparentGifPath = function() { return 'resources/images/transparent.gif'; };
      $axure.utils.getOtherPath = function() { return 'resources/Other.html'; };
      $axure.utils.getReloadPath = function() { return 'resources/reload.html'; };
  	$(function() {
  	  // 商品编辑表单
  		$('#itemEditWindow').window({    
		    width:500,
		    height:550,
		    modal:true, 
		    closed:true,
		    iconCls:'icon-redo',
		    href:'apply/edit'
		});
  		//表格属性
		columns=[ [ {
			field : 'ck',
			checkbox : true
		}, {
			field : 'id',
			title : '序号',
			width : 60
		}, {
			field : 'articleName1',
			title : '物品名称',
			width : 350
		}, {
			field : 'applyNum',
			title : '申请数量',
			width : 120
		}, {
			field : 'stockUnit1',
			title : '单位',
			width : 100
		}, {
			field : 'articleType1',
			title : '物品类别',
			width : 100
		},{
			field : 'applyState1',
			title : '状态',
			width : 100
		},{field:'opt',title:'操作',width:100,align:'center',  
            formatter:function(value,rec){ 
            	var style="height: 25px;line-height: 25px;padding: 0 11px;background: #02bafa;border: 1px #26bbdb solid;border-radius: 3px;"+
                "display: inline-block;text-decoration: none;font-size: 12px;outline: none;";
            	var status="";
            	if(rec.applyState1=='撤回')
            		status="重新申请";
        		if(rec.applyState1=='审核中')
                	status="撤回";
        		if(rec.applyState1=='审核通过'){
                	status="";
                	style="";
        		}
        		if(rec.applyState1=='驳回'){
                	status="修改";
        		}
                
                var btn = "<a onclick='applyeditRow(\""+rec.id+"\", \""+status+"\""+")' style='"+style+"' href='javascript:void(0)'>"+status+"</a>";  
                return btn;  
            }  
        } ] ];
		//初始化表格
		ini_table(queryparms,'apply/list',columns);

		//查询按钮
		$("#u1079").click(function() {
			//获取商品名称
			goodsname = $("#u1076_input").val();
			//获取商品类别
			goodstype = $("#u1100_input").val();
			find(1, 10,'apply/list');
		});


		//跳转到商品申请页面
		$("#u1246_img").click(function(){
			location.href = "http://localhost:8081/apply/enableapplylist";
		});
		//跳转到商品申请页面
		$("#u1247").click(function(){
			location.href = "http://localhost:8081/apply/enableapplylist";
		});

		//撤回
		$("#u1248").click(function() {
			var ids = getSelectionsIds();
			if (ids.length == 0) {
				$.messager.alert('提示', '未选中商品!');
				return;
			}
			$.messager.confirm('确认','确定要撤回选中的申请吗？',function(r){
			    if (r){
			    	var params = {"ids":ids};
		        	$.post("apply/undo",params, function(data){
		    			if(data.status == 200){
		    				$.messager.alert('提示','撤回申请成功!',undefined,function(){
		    					$("#goodsList").datagrid("reload");
		    				});
		    			}else{
		    				$.messager.alert('错误',data.msg,undefined,function(){
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

      <!-- Unnamed (矩形) -->
      <div id="u1060" class="ax_default box_2">
        <div id="u1060_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u1061" class="text" style="display: none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

    <!-- Unnamed (矩形) -->
    <div id="u1062" class="ax_default box_1">
      <div id="u1062_div" class=""></div>
      <!-- Unnamed () -->
      <div id="u1063" class="text" style="display: none; visibility: hidden">
        <p><span></span></p>
      </div>
    </div>

      <!-- nav-最新活动 (矩形) -->
      <div id="u1064" class="ax_default box_1" data-label="nav-最新活动">
        <div id="u1064_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u1065" class="text" style="visibility: visible;">
          <p><span>申请列表</span></p>
        </div>
      </div>

      <!-- Unnamed (水平线) -->
      <div id="u1068" class="ax_default line">
        <img id="u1068_img" class="img " src="images/办公用品管理/u341.png"/>
        <!-- Unnamed () -->
        <div id="u1069" class="text" style="display: none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1070" class="ax_default _一级标题">
        <div id="u1070_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u1071" class="text" style="visibility: visible;">
          <p><span>办公用品申请系统</span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1072" class="ax_default label">
        <div id="u1072_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u1073" class="text" style="visibility: visible;">
          <p><span>物品名称</span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1074" class="ax_default box_1">
        <div id="u1074_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u1075" class="text" style="display: none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (文本框) -->
      <div id="u1076" class="ax_default text_field">
        <input id="u1076_input" type="text" value=""/>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1077" class="ax_default label">
        <div id="u1077_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u1078" class="text" style="visibility: visible;">
          <p><span>物品类别</span></p>
        </div>
      </div>

      <!-- 默认按钮 (矩形) -->
      <div id="u1079" class="ax_default box_1" data-label="默认按钮">
        <img id="u1079_img" class="img " src="images/登陆/login_u275.png"/>
        <!-- Unnamed () -->
        <div id="u1080" class="text" style="visibility: visible;">
          <p><span>查 询</span></p>
        </div>
      </div>


      <!-- Unnamed (下拉列表框) -->
      <div id="u1100" class="ax_default droplist">
        <select id="u1100_input">
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
      <div id="u1101" class="ax_default">
		 <table id="goodsList"></table>
      </div>
      
   
      
	       <div id="bt1" style="height:40px;width:86px;
	       background-color: blanchedalmond;
	       margin-left: 411px;margin-top: 427px; 
	       text-align: center;line-height: 40px;">提交</div>
      <!-- 百搭按钮 (矩形) -->
      <div id="bt1" class="ax_default box_1"  style="margin-left: 411px;margin-top: 427px; data-label="百搭按钮">
        <img id="u1246_img" class="img " src="images/登陆/百搭按钮_u277.png"/>
        <!-- Unnamed () -->
        <div id="u1247" class="text" style="visibility: visible;">
          <p><span>新增申请</span></p>
        </div>
      </div>

      <!-- 原始按钮 (矩形) -->
      <div id="u1248" class="ax_default box_1" data-label="原始按钮">
        <img id="u1248_img" class="img " src="images/办公用品管理/原始按钮_u502.png"/>
        <!-- Unnamed () -->
        <div id="u1249" class="text" style="visibility: visible;">
          <p><span>撤回</span></p>
        </div>
      </div>
   <div id="itemEditWindow" title="修改申请" style="width:80%;height:80%;padding:10px;">
  
    </div>
  </body>
</html>
