<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>新增办公用品</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <link href="resources/css/jquery-ui-themes.css" type="text/css" rel="stylesheet"/>
    <link href="resources/css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
    <link href="data/styles.css" type="text/css" rel="stylesheet"/>
    <link href="files/新增办公用品/styles.css" type="text/css" rel="stylesheet"/>
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
    <script src="files/新增办公用品/data.js"></script>
    <script src="resources/scripts/axure/legacy.js"></script>
    <script src="resources/scripts/axure/viewer.js"></script>
    <script src="resources/scripts/axure/math.js"></script>
    <script type="text/javascript">
      $axure.utils.getTransparentGifPath = function() { return 'resources/images/transparent.gif'; };
      $axure.utils.getOtherPath = function() { return 'resources/Other.html'; };
      $axure.utils.getReloadPath = function() { return 'resources/reload.html'; };
      $(function(){
    	  var falg=true;
    	  //商品名称是否重复验证
    	  $("#u998_input").blur(function(){
    		  var name=$("#u998_input").val();
    		  $.ajax({
    			  url:'goods/namevalide',
    			  type:'POST',
    			  data:{'name':name},
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
  		//数字验证
    	  $("#u1006_input").blur(function(){
        	  var num=$("#u1006_input").val();//需要判断的值
        	  if(isNaN(num)){
        	    alert("你输入的不是数字");
        	    flag=false;
        	  }else{
		    	   flag=true;
		       }
    	  });

  		$("#bt1").click(function(){
  			
  			 if($("#u998_input").val()==null||$("#u998_input").val()==""||$("#u998_input").val()=='请输入标题'||
				$("#u1006_input").val()==null||""==$("#u1006_input").val().trim()||
				$("#u1001_input").val()==null||""==$("#u1001_input").val().trim()||
				$("#u1011_input").val()==null||""==$("#u1011_input").val().trim()){
  				flag=false;
  			 }else{
  				 flag=true;
  			 }
					
  			 
  			 if(flag==false){
  				 alert("表单信息有误");
  			 }
  			 if(flag==true){
	  			var name=$("#u998_input").val();
	  			var num=$("#u1006_input").val();
	  			var unit=$("#u1011_input").val();
	  			var type=$("#u1029_input").val();
	  			var descript=$("#u1001_input").val();

	  			switch (type) {
		  			case '笔':type=1;break;
		  			case '笔记本':type=2;break;
		  			case '订书机': type=3;break;
		  			case '打印纸': type=4;break;
		  			case '订书针': type=5;break;
		  			case '文件夹': type=6;break;
		  			case '档案袋': type=7;break;
				}
	  			$.post("goods/add", 
  					{ articleName:name, stockNum:num,stockUnit:unit,articleType: type,articleDescribe: descript }, 
  					function(data){alert("添加成功");$("#u994").click();}
	  			);
	  			
  			 }
  		});
      });
    </script>
  </head>
  <body>
  <form >
    <div id="base" class="">

      <!-- Unnamed (矩形) -->
      <div id="u990" class="ax_default box_2">
        <div id="u990_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u991" class="text" style="display: none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>
       <div id="bt1" style="height:40px;width:86px;background-color: blanchedalmond;;margin-left: 411px;margin-top: 427px; text-align: center;line-height: 40px;">提交</div>

      <!-- 百搭按钮 (矩形) -->
      <div id="u994" class="ax_default box_1" data-label="百搭按钮">
        <img id="u994_img" class="img " src="images/登陆/百搭按钮_u277.png"/>
        <!-- Unnamed () -->
        <div id="u995" class="text" style="visibility: visible;">
          <p><span>取消</span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u996" class="ax_default box_1">
        <div id="u996_div" class="">
         
        </div>
        <!-- Unnamed () -->
        <div id="u997" class="text" style="display: none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (文本框) -->
      <div id="u998" class="ax_default text_field">
      
        <input id="u998_input" type="text" value=""/>
        
      </div>
	 	
      <!-- Unnamed (矩形) -->
      <div id="u999" class="ax_default box_1">
        <div id="u999_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u1000" class="text" style="display: none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (多行文本框) -->
      <div id="u1001" class="ax_default text_area">
        <textarea id="u1001_input"></textarea>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1002" class="ax_default box_1">
        <div id="u1002_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u1003" class="text" style="visibility: visible;">
          <p><span>物品名称 </span><span style="color:#FF0000;">*</span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1004" class="ax_default box_1">
        <div id="u1004_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u1005" class="text" style="display: none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (文本框) -->
      <div id="u1006" class="ax_default text_field">
        <input id="u1006_input" type="text" value=""/>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1007" class="ax_default box_1">
        <div id="u1007_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u1008" class="text" style="visibility: visible;">
          <p><span>数量 </span><span style="color:#FF0000;">*</span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1009" class="ax_default box_1">
        <div id="u1009_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u1010" class="text" style="display: none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (文本框) -->
      <div id="u1011" class="ax_default text_field">
        <input id="u1011_input" type="text" value=""/>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1012" class="ax_default box_1">
        <div id="u1012_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u1013" class="text" style="visibility: visible;">
          <p><span>单位 </span><span style="color:#FF0000;">*</span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1014" class="ax_default box_1">
        <div id="u1014_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u1015" class="text" style="display: none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1016" class="ax_default box_1">
        <div id="u1016_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u1017" class="text" style="visibility: visible;">
          <p><span style="font-family:'微软雅黑 Regular', '微软雅黑';font-weight:400;font-style:normal;">物品描述 </span><span style="font-family:'微软雅黑 Regular', '微软雅黑';font-weight:400;color:#FF0000;">*</span></p>
        </div>
      </div>

      <!-- 下拉选项 (动态面板) -->
      <div id="u1018" class="ax_default ax_default_hidden" data-label="下拉选项" style="display: none; visibility: hidden">
        <div id="u1018_state0" class="panel_state" data-label="State1">
          <div id="u1018_state0_content" class="panel_state_content">

            <!-- 底部边线 (矩形) -->
            <div id="u1019" class="ax_default box_1" data-label="底部边线">
              <div id="u1019_div" class=""></div>
              <!-- Unnamed () -->
              <div id="u1020" class="text" style="display: none; visibility: hidden">
                <p><span></span></p>
              </div>
            </div>

            <!-- 下拉选项 (中继器) -->
            <div id="u1021" class="ax_default" data-label="下拉选项">
              <script id="u1021_script" type="axure-repeater-template" data-label="下拉选项">

                <!-- name (矩形) -->
                <div id="u1022" class="ax_default box_1 u1022" data-label="name" selectiongroup="1">
                  <img id="u1022_img" class="img u1022_img" src="images/新增办公用品/name_u1022.png"/>
                  <!-- Unnamed () -->
                  <div id="u1023" class="u1023 text" style="visibility: visible;">
                    <p><span>&nbsp; 写作</span></p>
                  </div>
                </div>
              </script>
              <div id="u1021-1" class="preeval" style="width: 518px; height: 36px;">

                <!-- name (矩形) -->
                <div id="u1022-1" class="ax_default box_1 u1022" data-label="name" selectiongroup="1">
                  <img id="u1022-1_img" class="img u1022_img" src="images/新增办公用品/name_u1022.png"/>
                  <!-- Unnamed () -->
                  <div id="u1023-1" class="u1023 text" style="visibility: visible;">
                    <p><span>&nbsp; 笔</span></p>
                  </div>
                </div>
              </div>
              <div id="u1021-2" class="preeval" style="width: 518px; height: 36px;">

                <!-- name (矩形) -->
                <div id="u1022-2" class="ax_default box_1 u1022" data-label="name" selectiongroup="1">
                  <img id="u1022-2_img" class="img u1022_img" src="images/新增办公用品/name_u1022.png"/>
                  <!-- Unnamed () -->
                  <div id="u1023-2" class="u1023 text" style="visibility: visible;">
                    <p><span>&nbsp; 笔记本</span></p>
                  </div>
                </div>
              </div>
              <div id="u1021-3" class="preeval" style="width: 518px; height: 36px;">

                <!-- name (矩形) -->
                <div id="u1022-3" class="ax_default box_1 u1022" data-label="name" selectiongroup="1">
                  <img id="u1022-3_img" class="img u1022_img" src="images/新增办公用品/name_u1022.png"/>
                  <!-- Unnamed () -->
                  <div id="u1023-3" class="u1023 text" style="visibility: visible;">
                    <p><span>&nbsp; 订书机</span></p>
                  </div>
                </div>
              </div>
              <div id="u1021-4" class="preeval" style="width: 518px; height: 36px;">

                <!-- name (矩形) -->
                <div id="u1022-4" class="ax_default box_1 u1022" data-label="name" selectiongroup="1">
                  <img id="u1022-4_img" class="img u1022_img" src="images/新增办公用品/name_u1022.png"/>
                  <!-- Unnamed () -->
                  <div id="u1023-4" class="u1023 text" style="visibility: visible;">
                    <p><span>&nbsp; 打印纸</span></p>
                  </div>
                </div>
              </div>
              <div id="u1021-5" class="preeval" style="width: 518px; height: 36px;">

                <!-- name (矩形) -->
                <div id="u1022-5" class="ax_default box_1 u1022" data-label="name" selectiongroup="1">
                  <img id="u1022-5_img" class="img u1022_img" src="images/新增办公用品/name_u1022.png"/>
                  <!-- Unnamed () -->
                  <div id="u1023-5" class="u1023 text" style="visibility: visible;">
                    <p><span>&nbsp; 订书针</span></p>
                  </div>
                </div>
              </div>
              <div id="u1021-6" class="preeval" style="width: 518px; height: 36px;">

                <!-- name (矩形) -->
                <div id="u1022-6" class="ax_default box_1 u1022" data-label="name" selectiongroup="1">
                  <img id="u1022-6_img" class="img u1022_img" src="images/新增办公用品/name_u1022.png"/>
                  <!-- Unnamed () -->
                  <div id="u1023-6" class="u1023 text" style="visibility: visible;">
                    <p><span>&nbsp; 文件夹</span></p>
                  </div>
                </div>
              </div>
              <div id="u1021-7" class="preeval" style="width: 518px; height: 36px;">

                <!-- name (矩形) -->
                <div id="u1022-7" class="ax_default box_1 u1022" data-label="name" selectiongroup="1">
                  <img id="u1022-7_img" class="img u1022_img" src="images/新增办公用品/name_u1022.png"/>
                  <!-- Unnamed () -->
                  <div id="u1023-7" class="u1023 text" style="visibility: visible;">
                    <p><span>&nbsp; 档案袋</span></p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1024" class="ax_default box_1">
        <div id="u1024_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u1025" class="text" style="visibility: visible;">
          <p><span>物品类别</span><span style="color:#FF0000;"> *</span></p>
        </div>
      </div>

      <!-- 单行选择框 (动态面板) -->
      <div id="u1026" class="ax_default" data-label="单行选择框">
        <div id="u1026_state0" class="panel_state" data-label="State1">
          <div id="u1026_state0_content" class="panel_state_content">

            <!-- 输入框背景 (矩形) -->
            <div id="u1027" class="ax_default box_1" data-label="输入框背景">
              <div id="u1027_div" class=""></div>
              <!-- Unnamed () -->
              <div id="u1028" class="text" style="display: none; visibility: hidden">
                <p><span></span></p>
              </div>
            </div>

            <!-- 文本框-单行选择框 (文本框) -->
            <div id="u1029" class="ax_default text_field" data-label="文本框-单行选择框">
              <input id="u1029_input" type="text" value="请选择" readonly/>
            </div>

            <!-- 三角 (图片) -->
            <div id="u1030" class="ax_default _图片" data-label="三角">
              <img id="u1030_img" class="img " src="images/新增办公用品/三角_u1030.png"/>
              <!-- Unnamed () -->
              <div id="u1031" class="text" style="display: none; visibility: hidden">
                <p><span></span></p>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1032" class="ax_default box_2">
        <div id="u1032_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u1033" class="text" style="display: none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1034" class="ax_default _文本段落">
        <div id="u1034_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u1035" class="text" style="visibility: visible;">
          <p><span>说明：</span></p>
        </div>
      </div>

      <!-- Unnamed (椭圆形) -->
      <div id="u1036" class="ax_default ellipse">
        <img id="u1036_img" class="img " src="images/办公用品管理/u313.png"/>
        <!-- Unnamed () -->
        <div id="u1037" class="text" style="visibility: visible;">
          <p><span>1</span></p>
        </div>
      </div>

      <!-- Unnamed (文本段落) -->
      <div id="u1038" class="ax_default _文本段落">
        <img id="u1038_img" class="img " src="resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u1039" class="text" style="visibility: visible;">
          <p><span>物品名称做重复性验证，如果名称重复，给出提示，并禁止提交；</span></p>
        </div>
      </div>

      <!-- Unnamed (文本段落) -->
      <div id="u1040" class="ax_default _文本段落">
        <img id="u1040_img" class="img " src="resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u1041" class="text" style="visibility: visible;">
          <p><span>只能填写数字，填写其他的类型的字符，给出提示，并禁止提交；</span></p>
        </div>
      </div>

      <!-- Unnamed (文本段落) -->
      <div id="u1042" class="ax_default _文本段落">
        <img id="u1042_img" class="img " src="resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u1043" class="text" style="visibility: visible;">
          <p><span>物品类别采用下拉框选择；</span></p>
        </div>
      </div>

      <!-- Unnamed (椭圆形) -->
      <div id="u1044" class="ax_default ellipse">
        <img id="u1044_img" class="img " src="images/办公用品管理/u313.png"/>
        <!-- Unnamed () -->
        <div id="u1045" class="text" style="visibility: visible;">
          <p><span>2</span></p>
        </div>
      </div>

      <!-- Unnamed (椭圆形) -->
      <div id="u1046" class="ax_default ellipse">
        <img id="u1046_img" class="img " src="images/办公用品管理/u313.png"/>
        <!-- Unnamed () -->
        <div id="u1047" class="text" style="visibility: visible;">
          <p><span>3</span></p>
        </div>
      </div>

      <!-- Unnamed (椭圆形) -->
      <div id="u1048" class="ax_default ellipse">
        <img id="u1048_img" class="img " src="images/办公用品管理/u313.png"/>
        <!-- Unnamed () -->
        <div id="u1049" class="text" style="visibility: visible;">
          <p><span>4</span></p>
        </div>
      </div>

      <!-- Unnamed (文本段落) -->
      <div id="u1050" class="ax_default _文本段落">
        <img id="u1050_img" class="img " src="resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u1051" class="text" style="visibility: visible;">
          <p><span>带“</span><span style="color:#FF0000;">*</span><span>”的为必填项，在保存的时候验证是否填写内容。</span></p>
        </div>
      </div>

      <!-- Unnamed (椭圆形) -->
      <div id="u1052" class="ax_default ellipse">
        <img id="u1052_img" class="img " src="images/办公用品管理/u313.png"/>
        <!-- Unnamed () -->
        <div id="u1053" class="text" style="visibility: visible;">
          <p><span>1</span></p>
        </div>
      </div>

      <!-- Unnamed (椭圆形) -->
      <div id="u1054" class="ax_default ellipse">
        <img id="u1054_img" class="img " src="images/办公用品管理/u313.png"/>
        <!-- Unnamed () -->
        <div id="u1055" class="text" style="visibility: visible;">
          <p><span>2</span></p>
        </div>
      </div>

      <!-- Unnamed (椭圆形) -->
      <div id="u1056" class="ax_default ellipse">
        <img id="u1056_img" class="img " src="images/办公用品管理/u313.png"/>
        <!-- Unnamed () -->
        <div id="u1057" class="text" style="visibility: visible;">
          <p><span>3</span></p>
        </div>
      </div>

      <!-- Unnamed (椭圆形) -->
      <div id="u1058" class="ax_default ellipse">
        <img id="u1058_img" class="img " src="images/办公用品管理/u313.png"/>
        <!-- Unnamed () -->
        <div id="u1059" class="text" style="visibility: visible;">
          <p><span>4</span></p>
        </div>
      </div>
    </div>
    </form>
  </body>
</html>
