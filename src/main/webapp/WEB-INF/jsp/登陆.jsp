<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>登陆</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<link href="resources/css/jquery-ui-themes.css" type="text/css"
		  rel="stylesheet" />
	<link href="resources/css/axure_rp_page.css" type="text/css"
		  rel="stylesheet" />
	<link href="data/styles.css" type="text/css" rel="stylesheet" />
	<link href="files/登录/styles.css" type="text/css" rel="stylesheet" />
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
	<script src="files/登录/data.js"></script>
	<script src="resources/scripts/axure/legacy.js"></script>
	<script src="resources/scripts/axure/viewer.js"></script>
	<script src="../../resources/scripts/jQuery.md5.js" type="text/javascript"></script>
	<script src="resources/scripts/axure/math.js"></script>
	<script type="text/javascript">
		$axure.utils.getTransparentGifPath = function() { return 'resources/images/transparent.gif'; };
		$axure.utils.getOtherPath = function() { return 'resources/Other.html'; };
		$axure.utils.getReloadPath = function() { return 'resources/reload.html'; };
		$(function(){
			//表单提交
			$("#u276").click(function(){
				var flag=true;
				//获取用户名
				var username=$("#u265_input").val();

				//判断用户名是否为空
				if(username==null||$.trim(username) == ''||username=='请输入用户名')
					flag=false;

				//获取密码并加密
				var password=$("#u272_input").val();

				//判断密码是否weikong
				if(password==null||$.trim(password) == ''||password=='请输入密码')
					flag=false;

				if(flag==true){
					//使用md5对密码加密

					$.post("userlogin",{name:username,password:password},function(data){
						if (data.status == 200) {
							alert("登陆成功！");
							//根据用户不同权限跳转至不同页面1.办公用品管理页面 2.办公用品申请页面
							if(data.data.role==1)
								location.href = "http://localhost:8081/goods.html";
							else
								location.href = "http://localhost:8081/apply.html";
						} else {
							alert(data.msg);
						}
					},"json");
				}

			});
			//重置表单
			$("#u277").click(function(){
				//获取用户名
				var username=$("#u265_input").val("");
				//获取密码并加密
				var password=$("#u272_input").val("");
			});

		});
	</script>
</head>
<body>
<div id="base" class="">

	<!-- Unnamed (矩形) -->
	<div id="u251" class="ax_default box_1">
		<div id="u251_div" class=""></div>
		<!-- Unnamed () -->
		<div id="u252" class="text" style="display: none; visibility: hidden">
			<p>
				<span></span>
			</p>
		</div>
	</div>

	<!-- Unnamed (矩形) -->
	<div id="u253" class="ax_default box_2">
		<div id="u253_div" class=""></div>
		<!-- Unnamed () -->
		<div id="u254" class="text" style="display: none; visibility: hidden">
			<p>
				<span></span>
			</p>
		</div>
	</div>

	<!-- Unnamed (组合) -->
	<div id="u255" class="ax_default">

		<!-- Unnamed (矩形) -->
		<div id="u256" class="ax_default box_1">
			<div id="u256_div" class=""></div>
			<!-- Unnamed () -->
			<div id="u257" class="text"
				 style="display: none; visibility: hidden">
				<p>
					<span></span>
				</p>
			</div>
		</div>

		<!-- Unnamed (图片) -->
		<div id="u258" class="ax_default _图片">
			<img id="u258_img" class="img " src="images/登陆/u258.png" />
			<!-- Unnamed () -->
			<div id="u259" class="text"
				 style="display: none; visibility: hidden">
				<p>
					<span></span>
				</p>
			</div>
		</div>
	</div>

	<!-- Unnamed (矩形) -->
	<div id="u260" class="ax_default _一级标题">
		<div id="u260_div" class=""></div>
		<!-- Unnamed () -->
		<div id="u261" class="text" style="visibility: visible;">
			<p>
				<span>办公用品管理系统</span>
			</p>
		</div>
	</div>

	<!-- Unnamed (组合) -->
	<div id="u262" class="ax_default">

		<!-- Unnamed (矩形) -->
		<div id="u263" class="ax_default box_1">
			<div id="u263_div" class=""></div>
			<!-- Unnamed () -->
			<div id="u264" class="text"
				 style="display: none; visibility: hidden">
				<p>
					<span></span>
				</p>
			</div>
		</div>

		<!-- username (文本框) -->
		<div id="u265" class="ax_default text_field" data-label="username">
			<input id="u265_input" type="text" value="" />
		</div>
	</div>

	<!-- Unnamed (组合) -->
	<div id="u266" class="ax_default">

		<!-- Unnamed (矩形) -->
		<div id="u267" class="ax_default box_1">
			<div id="u267_div" class=""></div>
			<!-- Unnamed () -->
			<div id="u268" class="text"
				 style="display: none; visibility: hidden">
				<p>
					<span></span>
				</p>
			</div>
		</div>
	</div>

	<!-- Unnamed (组合) -->
	<div id="u269" class="ax_default">

		<!-- Unnamed (矩形) -->
		<div id="u270" class="ax_default box_1">
			<div id="u270_div" class=""></div>
			<!-- Unnamed () -->
			<div id="u271" class="text"
				 style="display: none; visibility: hidden">
				<p>
					<span></span>
				</p>
			</div>
		</div>

		<!-- pwd (文本框) -->
		<div id="u272" class="ax_default text_field" data-label="pwd">
			<input id="u272_input" type="password" value="" />
		</div>
	</div>

	<!-- Unnamed (图片) -->
	<div id="u273" class="ax_default _图片">
		<img id="u273_img" class="img " src="images/登陆/u273.png" />
		<!-- Unnamed () -->
		<div id="u274" class="text" style="display: none; visibility: hidden">
			<p>
				<span></span>
			</p>
		</div>
	</div>

	<!-- login (矩形) -->
	<div id="u275" class="ax_default box_1" data-label="login">
		<img id="u275_img" class="img " src="images/登陆/login_u275.png" />
		<!-- Unnamed () -->
		<div id="u276" class="text" style="visibility: visible;">
			<p>
				<span>登陆</span>
			</p>
		</div>
	</div>

	<!-- 百搭按钮 (矩形) -->
	<div id="u277" class="ax_default box_1" data-label="百搭按钮">
		<img id="u277_img" class="img " src="images/登陆/百搭按钮_u277.png" />
		<!-- Unnamed () -->
		<div id="u278" class="text" style="visibility: visible;">
			<p>
				<span>重置</span>
			</p>
		</div>
	</div>

	<!-- login tips (矩形) -->
	<div id="u279" class="ax_default _三级标题" data-label="login tips">
		<div id="u279_div" class=""></div>
		<!-- Unnamed () -->
		<div id="u280" class="text" style="display: none; visibility: hidden">
			<p>
				<span></span>
			</p>
		</div>
	</div>

	<!-- Unnamed (矩形) -->
	<div id="u281" class="ax_default _文本段落">
		<div id="u281_div" class=""></div>
		<!-- Unnamed () -->
		<div id="u282" class="text" style="visibility: visible;">
			<p>
				<span>说明：</span>
			</p>
		</div>
	</div>

	<!-- Unnamed (文本段落) -->
	<div id="u283" class="ax_default _文本段落">
		<img id="u283_img" class="img "
			 src="resources/images/transparent.gif" />
		<!-- Unnamed () -->
		<div id="u284" class="text" style="visibility: visible;">
			<p>
				<span>用户名做必填验证，未填写时，点击登陆给出提示；</span>
			</p>
		</div>
	</div>

	<!-- Unnamed (文本段落) -->
	<div id="u285" class="ax_default _文本段落">
		<img id="u285_img" class="img "
			 src="resources/images/transparent.gif" />
		<!-- Unnamed () -->
		<div id="u286" class="text" style="visibility: visible;">
			<p>
				<span>密码做必填验证，未填写时，点击登陆给出提示；</span>
			</p>
		</div>
	</div>

	<!-- Unnamed (文本段落) -->
	<div id="u287" class="ax_default _文本段落">
		<img id="u287_img" class="img "
			 src="resources/images/transparent.gif" />
		<!-- Unnamed () -->
		<div id="u288" class="text" style="visibility: visible;">
			<p>
				<span>点重置之后，清除用户名、密码；</span>
			</p>
		</div>
	</div>

	<!-- Unnamed (文本段落) -->
	<div id="u289" class="ax_default _文本段落">
		<img id="u289_img" class="img "
			 src="resources/images/transparent.gif" />
		<!-- Unnamed () -->
		<div id="u290" class="text" style="visibility: visible;">
			<p>
				<span>用户名或密码错误的情况下，点击登陆，给出用户名或密码错误的提示。</span>
			</p>
			<p>
				<span>用户名、密码都输入正确的情况，弹出登陆成功提示，随后进如相应的页面：管理人员进入“办公用品管理页面”；职员进入办公用品申请页面。</span>
			</p>
		</div>
	</div>

	<!-- Unnamed (椭圆形) -->
	<div id="u291" class="ax_default ellipse">
		<img id="u291_img" class="img " src="images/登陆/u291.png" />
		<!-- Unnamed () -->
		<div id="u292" class="text" style="visibility: visible;">
			<p>
				<span>1</span>
			</p>
		</div>
	</div>

	<!-- Unnamed (椭圆形) -->
	<div id="u293" class="ax_default ellipse">
		<img id="u293_img" class="img " src="images/登陆/u291.png" />
		<!-- Unnamed () -->
		<div id="u294" class="text" style="visibility: visible;">
			<p>
				<span>2</span>
			</p>
		</div>
	</div>

	<!-- Unnamed (椭圆形) -->
	<div id="u295" class="ax_default ellipse">
		<img id="u295_img" class="img " src="images/登陆/u291.png" />
		<!-- Unnamed () -->
		<div id="u296" class="text" style="visibility: visible;">
			<p>
				<span>3</span>
			</p>
		</div>
	</div>

	<!-- Unnamed (椭圆形) -->
	<div id="u297" class="ax_default ellipse">
		<img id="u297_img" class="img " src="images/登陆/u291.png" />
		<!-- Unnamed () -->
		<div id="u298" class="text" style="visibility: visible;">
			<p>
				<span>4</span>
			</p>
		</div>
	</div>

	<!-- Unnamed (椭圆形) -->
	<div id="u299" class="ax_default ellipse">
		<img id="u299_img" class="img " src="images/登陆/u291.png" />
		<!-- Unnamed () -->
		<div id="u300" class="text" style="visibility: visible;">
			<p>
				<span>1</span>
			</p>
		</div>
	</div>

	<!-- Unnamed (椭圆形) -->
	<div id="u301" class="ax_default ellipse">
		<img id="u301_img" class="img " src="images/登陆/u291.png" />
		<!-- Unnamed () -->
		<div id="u302" class="text" style="visibility: visible;">
			<p>
				<span>2</span>
			</p>
		</div>
	</div>

	<!-- Unnamed (椭圆形) -->
	<div id="u303" class="ax_default ellipse">
		<img id="u303_img" class="img " src="images/登陆/u291.png" />
		<!-- Unnamed () -->
		<div id="u304" class="text" style="visibility: visible;">
			<p>
				<span>4</span>
			</p>
		</div>
	</div>

	<!-- Unnamed (椭圆形) -->
	<div id="u305" class="ax_default ellipse">
		<img id="u305_img" class="img " src="images/登陆/u291.png" />
		<!-- Unnamed () -->
		<div id="u306" class="text" style="visibility: visible;">
			<p>
				<span>3</span>
			</p>
		</div>
	</div>
</div>
</body>
</html>