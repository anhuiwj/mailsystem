<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/common/top.jsp" %>
<!DOCTYPE html>
<head>
	<link rel="shortcut icon" href="${ctx}/favicon.ico"/>
	<title>${fns:getDictByCode("00001", "1").name}</title>
	<%@ include file="/WEB-INF/views/common/head.jsp" %>
	<%@ include file="/WEB-INF/views/common/toplib.jsp" %>
	<script type="text/javascript" src="${ctxStatic}/layer/1.9.3/layer.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/H-ui.admin.js"></script>
<script type="text/javascript" src="${ctxStatic}/lib/layui/layui.js" ></script>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="login">
<!-- BEGIN LOGO -->
<div class="logo">
	<img src="${ctxStatic}/admin/layout/img/logo-big.png" alt=""/>
</div>
<!-- END LOGO -->
<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
<div class="menu-toggler sidebar-toggler">
</div>
<!-- END SIDEBAR TOGGLER BUTTON -->
<!-- BEGIN LOGIN -->
<div class="content">
	<!-- BEGIN LOGIN FORM -->
	<form class="loginForm" action="${ctx}/login" method="post">
		<h3 class="form-title">登录</h3>
		<c:if test="${not empty message}">
			<div class="alert alert-danger ">
				<button class="close" data-close="alert"></button>
				<span id="message">${message}</span>
			</div>
		</c:if>
		<div class="form-group">
			<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
			<label class="control-label visible-ie8 visible-ie9">Username</label>
			<div class="input-icon">
				<i class="fa fa-user"></i>
				<input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="用户名" name="userCode"/>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label visible-ie8 visible-ie9">Password</label>
			<div class="input-icon">
				<i class="fa fa-lock"></i>
				<input class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="密码" name="password"/>
			</div>
		</div>
		<div class="form-actions">
			 <%--<input class="btn btn-primary radius  mt-50"    value="&nbsp;&nbsp注册&nbsp;&nbsp;">
			 --%>
			 <a onclick="addUser()" class="btn green-haze pull-right">
				注册 <i class="m-icon-swapright m-icon-white"></i>
			</a>
			&nbsp&nbsp&nbsp&nbsp
			<button id="btn" class="btn green-haze pull-right">
				登录 <i class="m-icon-swapright m-icon-white"></i>
			</button>
		</div>
	</form>
</div>
<!-- END LOGIN -->
<!-- BEGIN COPYRIGHT -->
<div class="copyright">
	 2014 &copy; Metronic. Admin Dashboard Template.
</div>
<script>
$(document).ready(function() {
  Metronic.init(); // init metronic core components
  Layout.init(); // init current layout
  //Login.init();
  Demo.init();

	$('#btn').click(function () {
		loginForm();
	});

});
function loginForm() {
	var userCode = $("#userCode").val();
	if (userCode == undefined || $.trim(userCode) == "") {
		return;
	} else {
		$("#message").text("");
	}
	var password = $("#password").val();
	if (password == undefined || $.trim(password) == "") {
		return;
	} else {
		$("#message").text("");
	}
	var mask = layer.load(1, {shade: 0.4, time: 120 * 1000});
	$.ajax({
		url: "${ctx}/publickey",
		type: "post",
		synsc:"false",
		success: function (data) {
			var publicKey = RSAUtils.getKeyPair(data.value.exponent, '', data.value.modulus);
			$('#enusername').val(RSAUtils.encryptedString(publicKey, $('#username').val()));
			$('#enpassword').val(RSAUtils.encryptedString(publicKey, $('#password').val()));
			$('#envalidateCode').val($('#validateCode').val());
			$('#loginForm').submit();
		}, callback: function () {
			layer.close(mask);
		}
	});
}

function addUser(){
	layer_show("注册",'${ctx}/user/add');
}


</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>